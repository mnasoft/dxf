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
      
      (:dxf/in/txt    nil)
      (:dxf/in/bin    nil)
      (:dxf/out/txt   nil)
      (:dxf/out/bin   nil)
      
      (:dxf/color     nil)
      (:dxf/utils     nil)
      (:dxf/split     nil)
      (:dxf/sec       nil)
      (:dxf/b-arr     nil)
      (:dxf/vars      nil)
      (:dxf/const     nil)
      
      (:dxf/docs      nil)
;;;; Исключено т.к. при генерировании документации с незагруженным
;;;; пакетом :dxf/tests возникает ошибка. А собственно документации в
;;;; нем кот наплакал. *1
      #+nil (:dxf/tests     nil) 
      )
    :do (apply #'mnas-package:document i)))

(defun make-graphs ()
  (loop
    :for i :in
    '(:dxf
      :dxf/in/txt    
      :dxf/in/bin    
      :dxf/out/txt   
      :dxf/out/bin   
      :dxf/color     
      :dxf/utils     
      :dxf/split     
      :dxf/sec       
      :dxf/b-arr     
      :dxf/vars      
      :dxf/const     
      :dxf/docs
;;;; См. *1      
      #+nil :dxf/tests     
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
   '("Mykola Matvyeyev")
   (mnas-package:find-sources "dxf")
   :output-format of)
  (codex:document :dxf)
  (make-graphs)
  (mnas-package:copy-doc->public-html "dxf")
  (mnas-package:rsync-doc "dxf"))

;;;; (make-all)
