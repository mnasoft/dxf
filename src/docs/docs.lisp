;;;; ./src/docs/docs.lisp

(defpackage #:dxf/docs
  (:use #:cl ) 
  (:nicknames "MSTR/DOCS")
  (:export make-all)
  (:documentation "Пакет @b(dxf/docs) содержит функции
  генерирования и публикации документации."))

(in-package :dxf/docs)

(defun make-document ()
  (loop
    :for i :in
    '((:dxf          :dxf)
      #+nil (:dxf/parse    nil)
      #+nil (:dxf/print    nil)
      #+nil (:dxf/translit nil)
      #+nil (:dxf/db       nil)
      (:dxf/docs     nil)
      )
    :do (apply #'mnas-package:document i)))

(defun make-graphs ()
  (loop
    :for i :in
    '(:dxf
      #+nil :dxf/parse
      #+nil :dxf/print
      #+nil :dxf/translit
      #+nil :dxf/db
      :dxf/docs 
      )
    :do (mnas-package:make-codex-graphs i i)))

(defun make-all (&aux
                   (of (if (find (uiop:hostname)
                                 mnas-package:*intranet-hosts*
                                 :test #'string=)
                           '(:type :multi-html :template :gamma)
                           '(:type :multi-html :template :minima))))
  "@b(Описание:) функция @b(make-all) служит для создания документации.

 Пакет документации формируется в каталоге
~/public_html/Common-Lisp-Programs/dxf.
"
  (mnas-package:make-html-path :dxf)
  (make-document)
  (make-graphs)
  (mnas-package:make-mainfest-lisp
   '(:dxf :dxf/docs)
   "Dxf"
   '("Nick Matvyeyev")
   (mnas-package:find-sources "dxf")
   :output-format of)
  (codex:document :dxf)
  (make-graphs)
  (mnas-package:copy-doc->public-html "dxf")
  (mnas-package:rsync-doc "dxf"))

;;;; (make-all)
