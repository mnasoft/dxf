;;; (load "~/quicklisp/local-projects/acad/dxf/el/property.el")

(defun ow () (other-window 1) )

(defun search-insert-before (str-search str-ins)
  (if (search-forward str-search nil t)
      (progn
        (move-beginning-of-line 1)
        (insert str-ins))))

(defun name-type (str-type)
  (search-forward (concat str-type " " "(ActiveX)"))
  (move-beginning-of-line 1)
  (forward-word 1)
  (setf name (current-word))
  (forward-word 1)
  (setf type (current-word))
  (setf name-type (concat name "-" type)))

(defun make-tbl-line ()
  (delete-blank-lines)
  (move-beginning-of-line 2)
  (insert  "|")
  (search-forward ":")
  (delete-backward-char 1)
  (insert  "|")
  (delete-blank-lines)
  )

(defun property-section (name-type)
  (move-beginning-of-line 2)
  (open-line 1)
  (insert (concat "#+name: " name-type "
| " name " |"))
  (move-beginning-of-line 2)
  (insert "#+name: " "des-" name-type)
  (move-beginning-of-line 2)
  (insert "| ")
  (org-table-convert))

(defun property-value-section (name-type)
  (if (search-forward "*** Property Value" nil t)
      (progn
        (move-beginning-of-line 2)
        (insert (concat "#+name: p-v-" name-type))
        (make-tbl-line)
        (make-tbl-line)
        (org-table-convert))))

(defun property-examples-section (name-type)
  (if (search-forward "*** Examples" nil t)
      (progn
        (search-forward "VBA:")
        (delete-backward-char 1)
        (move-beginning-of-line 1)
        (insert "#+name: ")
        (move-end-of-line 1)
        (insert (concat "-" name-type))
        (delete-blank-lines)
        (open-line 1)
        (move-beginning-of-line 2)
        (insert "#+begin_src")
        (search-forward "Visual LISP:")
        (move-beginning-of-line 0)
        (insert "#+end_src")
        (search-forward "Visual LISP:")
        (delete-backward-char 12)
        (move-beginning-of-line 1)
        (insert (concat "#+name: vp-" name-type))
        (delete-blank-lines)
        (open-line 1)
        (move-beginning-of-line 2)
        (insert "#+begin_src lisp")
        (end-of-buffer)
        (insert "#+end_src"))))

(defun property-release-information-section (name-type)
  (if   (search-forward "Release Information" nil t)
      (progn
        (move-beginning-of-line 2)
        (insert (concat "#+name: rev-" name-type))
        (search-forward "Releases:")
        (delete-backward-char 1)
        (insert "|")
        (move-beginning-of-line 1)
        (insert "| ")
        (org-table-convert))))

(defun property-signature-section (name-type)
  (if   (search-forward "Signature" nil t)
      (progn
        (search-forward "VBA:")
        (delete-backward-char 1)
        (move-beginning-of-line 1)
        (insert "#+name: sig-")
        (move-end-of-line 1)
        (insert (concat "-" name-type))
        (move-beginning-of-line 2)
        (insert "#+begin_src")
        (move-beginning-of-line 3)
        (insert "#+end_src")
        (search-forward  "Type:")
        (delete-backward-char 1)
        (insert "|")
        (move-beginning-of-line 1)
        (insert "|")
        (org-table-convert))))

(defun property-to-org ()
  (interactive)
  (beginning-of-buffer)
  (search-insert-before "Property (ActiveX)" "** ")
  (mapcar '(lambda (el) (search-insert-before el "*** "))
          '("Signature" "Property Value" "Remarks" "Release Information" "Examples"))
  (beginning-of-buffer)
  (setf name-type (name-type "Property"))
  (property-section name-type)
  (property-signature-section name-type)
  (property-value-section name-type)
  (property-release-information-section name-type)
  (property-examples-section name-type))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun search-mk-tbl-line (str)
  (search-forward str)
  (move-beginning-of-line 1)
  (insert "| ")
  )


(defun del-iden-by-str (str)
  (setf ps (point))
  (search-forward str)
  (backward-char (length str))
  (move-beginning-of-line 1)
  (setf pe (point))
  (while (< (line-number-at-pos ps) (line-number-at-pos))
    (delete-indentation nil))
  (delete-blank-lines)
  (move-beginning-of-line 2)
  )

(defun object-members-section ()
  (beginning-of-buffer )
  (search-forward "*** Members")
  (search-mk-tbl-line "Methods") (delete-blank-lines )
  (search-mk-tbl-line "Properties")  (delete-blank-lines )
  (search-mk-tbl-line "Events") 
  (org-shifttab)
  (org-table-transpose-table-at-point)
  (move-beginning-of-line 3)
  (del-iden-by-str "\n\t\n\n")
  (del-iden-by-str "\n\t\n\n")
  (del-iden-by-str "\n*** Remarks")
  (move-end-of-line 0)
  (setf pe (point))
  (move-beginning-of-line -2)
  (setf ps (point))
  (while (re-search-forward " " pe t)
    (replace-match "|" nil nil))
  (search-forward "\n*** Remarks")
  (move-beginning-of-line -2)
  (insert "|")   (move-beginning-of-line 2)
  (insert "|")   (move-beginning-of-line 2)
  (insert "|")
  (org-shifttab)
  (org-table-transpose-table-at-point)
  (search-backward "\n\n")
  (move-beginning-of-line 2)
  (insert "|-")
  (org-shifttab)
  )

(defun class-name-section ()
  (beginning-of-buffer)
  (search-forward "**** Class Name")
  (move-end-of-line 3)
  (setf class-name (current-word))
  (move-beginning-of-line 0)
  (insert (concat "#+name: cl-" class-name "\n| cl-nm      |\n|------------|"))
  (move-beginning-of-line 2)
  (insert  "| ")
  (org-shifttab))

(defun object-inheritance-section (cl-name)
  (beginning-of-buffer)
  (search-forward "**** Object Inheritance")
  (move-beginning-of-line 2)
  (insert (concat "#+name: o-i-" cl-name "\n"))
  (move-beginning-of-line 1)
  (del-iden-by-str (concat cl-name "\n"))
  (move-end-of-line 0)
  (setf ps (point))
  (move-end-of-line 1)
  (setf pe (point))
  (move-beginning-of-line 1)
  (while (re-search-forward " " pe t)
    (replace-match "|" nil nil))
  (move-beginning-of-line 1)
  (insert "|")
  (move-end-of-line 1)
  (org-shifttab)
  (org-table-transpose-table-at-point))

(defun object-section (name-type)
  (beginning-of-buffer)
  (search-forward "Object (ActiveX)")
  (move-beginning-of-line 2)
  (insert "#+name: " "des-" name-type "\n| Description |\n|----------------|")
  (move-beginning-of-line 2)
  (insert "| ")
  (org-shifttab))

(defun object-create-using-section ()
  (beginning-of-buffer)
  (search-forward "**** Create Using")
  (search-forward "    VBA")
  (move-beginning-of-line 1)
  (insert "#+BEGIN_SRC VBA")
  (kill-line)
  (delete-blank-lines)
  (search-forward "**** Access Via")
  (move-beginning-of-line 0)
  (insert "#END_SRC"))

(defun object-access-via-section ()
  (beginning-of-buffer)
  (search-forward "**** Access Via")
  (search-forward "    VBA")
  (move-beginning-of-line 1)
  (insert "#+BEGIN_SRC VBA")
  (kill-line)
  (delete-blank-lines)
  (search-forward "*** Members")
  (move-beginning-of-line 0)
  (insert "#END_SRC"))

(defun object-methods-section (name)
  (beginning-of-buffer)
  (search-forward "| Methods")
  (move-beginning-of-line 1)
  (insert "#+name: m-p-" name "\n")
  )

(defun object-code-section (name)
  (end-of-buffer)
  (insert "\n"
	  "*** Code" "\n"
	  "#+name:AcadCircle" "\n"
	  "#+header: :var m-p=m-p-" name "\n"
	  "#+header: :var o-i=o-i-" name "\n"
	  "#+header: :var des=des-" name "\n"
	  "#+header: :var code=code" "\n"
	  "#+header: :results output file" "\n"
	  "#+header: :file " name ".lisp" "\n"
	  "#+begin_src lisp" "\n"
	  " (make-defclass m-p o-i des)" "\n"
	  "#+end_src" "\n"))

(defun object-to-org ()
  (interactive)
  (beginning-of-buffer)
  (search-insert-before "Object (ActiveX)" "** ")
  (mapcar '(lambda (el) (search-insert-before el "*** "))
	  '("Class Information" "Members" "Remarks"))
  (beginning-of-buffer)
  (mapcar '(lambda (el) (search-insert-before el "**** "))
          '("Class Name" "Object Inheritance" "Create Using" "Access Via" ))
  (object-members-section)
  (class-name-section)
  (object-inheritance-section class-name)
  (object-section class-name)
  (object-create-using-section)
  (object-access-via-section)
  (object-methods-section class-name)
  (object-code-section class-name)
  )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kill-seached-line (str)
  (beginning-of-buffer)
  (search-forward str nil t)
  (move-beginning-of-line 1)
  (kill-line))

(defun insert-around (str)
  (move-beginning-of-line 1)
  (insert str)
  (move-end-of-line 1)
  (insert str)
  (move-end-of-line 2))

(defun insert-start (str)
  (move-beginning-of-line 1)
  (insert str)
  (move-end-of-line 2))

(defun insert-end (str)
  (move-end-of-line 1)
  (insert str)
  (move-end-of-line 2))

(defun methods-properties-events ()
  (interactive)
  (progn
    (switch-to-buffer "*scratch*")
    (yank))
  (let (ppp (line-number-at-pos))
    (kill-seached-line "Methods")
    (kill-seached-line "Properties")
    (kill-seached-line "Events")
    (delete-blank-lines)
    (delete-blank-lines)
    (replace-string "	" "|")
    (beginning-of-buffer) ;; (goto-line ppp)
    (replace-string "

" " ")
    (beginning-of-buffer) ;; (goto-line ppp)
    (replace-string "| " "")
    (beginning-of-buffer) ;; (goto-line ppp)
    (insert-around "\"")
    (insert-around "\"")
    (insert-around "\"")
    (beginning-of-buffer) ;; (goto-line ppp)
    (replace-string " \"" "\"")
    (beginning-of-buffer) ;; (goto-line ppp)
    (insert-start "'((:methods    ")
    (insert-start "  (:properties ")
    (insert-start "  (:events     ")
    (beginning-of-buffer) ;; (goto-line ppp)
    (insert-end ")")
    (insert-end ")")
    (insert-end "))")))

(defun defclass-doc-uri ()
  (interactive)
  (let ((start-point ))
  (beginning-of-buffer)
  (search-forward "defclass" nil t)
  (forward-sexp 2)
  (search-forward ":documentation" nil t)
  (search-forward "@link[uri=\\\"" nil t)
  (setq start-point (point))
  (search-forward "@link[uri=\\\"" nil t)
  (left-char 3)
;;;;(set-mark-command 1)
;;;;(search-forward "\\\"]" nil t)
  
  ))

C-SPC			;; set-mark-command
<down>			;; next-line
(right-char 14)
M-w			;; kill-ring-save




C-s			;; isearch-forward
(defclass		;; self-insert-command * 9
RET			;; newline
8*<left>		;; left-char
2*M-C-f			;; forward-sexp
C-s			;; isearch-forward
(:documentation		;; self-insert-command * 15
RET			;; newline
C-s			;; isearch-forward
@link[uri=		;; self-insert-command * 10
\			;; self-insert-command
"			;; self-insert-command
RET			;; newline
C-SPC			;; set-mark-command
C-s			;; isearch-forward
\			;; self-insert-command
"]			;; self-insert-command * 2
RET			;; newline
3*<left>		;; left-char
M-w			;; kill-ring-save

https://help.autodesk.com/view/ACD/2022/RUS/?guid=GUID-1DAB32FC-8C8A-4116-BD3A-CF733740DF8F
