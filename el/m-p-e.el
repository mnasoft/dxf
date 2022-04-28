(defun get-yank ()
  "Возвращает содержимое буфера обмена."
  (substring-no-properties (car kill-ring)))

(defun b-b-point ()
  "Возвращает точку начала буфера."
  (beginning-of-buffer)
  (point))

(defun b-e-point ()
  "Возвращает точку конца буфера."
  (end-of-buffer)
  (point))

(defun get-buffer (arg)
  "Записывает содержимое текущего буфера в буфер обмена."
  (interactive)
  (let ((beg (b-b-point)) (end (b-e-point)))
    (kill-ring-save beg end)))

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

(defun yank-from-below (from-str below-str)
  "Записывает в буфер обмена строку, начинающуюся с конца from-str
   и заканчивающуюся началом below-str."
  (let ((beg)(end))
    (search-forward from-str nil t)
    (setq beg (point))
    (search-forward below-str nil t)
    (setq end (- (point) (length below-str)))
    (kill-ring-save beg end)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
    (beginning-of-buffer)
    (replace-string "

" " ")
    (beginning-of-buffer)
    (replace-string "| " "")
    (beginning-of-buffer)
    (insert-around "\"")
    (insert-around "\"")
    (insert-around "\"")
    (beginning-of-buffer)
    (replace-string " \"" "\"")
    (beginning-of-buffer)
    (insert-start "'((:methods    ")
    (insert-start "  (:properties ")
    (insert-start "  (:events     ")
    (beginning-of-buffer)
    (insert-end ")")
    (insert-end ")")
    (insert-end "))")
    ))

(defun defclass-doc-uri ()
  (interactive)
  (let ((start-point)(end-point))
    (setq b-name (buffer-name))
    (beginning-of-buffer)
    (search-forward "defclass" nil t)
    (forward-sexp 2)
    (search-forward ":documentation" nil t)
    (yank-from-below "@link[uri=\\\"" "\\\"")
    (browse-url (get-yank))
    ))

(defun go-back ()
  (switch-to-buffer b-name))
