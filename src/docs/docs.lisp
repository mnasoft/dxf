;;;; ./src/docs/docs.lisp

(defpackage :dxf/docs
  (:use #:cl ) 
  (:export make-all)
  (:documentation "Пакет @b(dxf/docs) содержит функции
  генерирования и публикации документации."))

(in-package :dxf/docs)

(defun make-document ()
  (loop
    :for j :from 1
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
    :do (progn
          (apply #'mnas-package:document i)
          (format t "~A ~A~%" j i))))

(defun make-graphs ()
  (loop
    :for j :from 1
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
    :do (progn
          (mnas-package:make-codex-graphs i i)
          (format t "~A ~A~%" j i))))

(defun make-all (&aux
                   (of (if (find (uiop:hostname)
                                 mnas-package:*intranet-hosts*
                                 :test #'string= :key #'first)
                           '(:type :multi-html :template :gamma)
                           '(:type :multi-html :template :minima))))
  (let* ((sys-symbol :dxf)
         (sys-string (string-downcase (format nil "~a" sys-symbol))))
    (mnas-package:make-html-path sys-symbol)
    (make-document)
    (mnas-package:make-mainfest-lisp `(,sys-symbol)
                                     (string-capitalize sys-string)
                                     '("Mykola Matvyeyev")
                                     (mnas-package:find-sources sys-symbol)
                                     :output-format of)
    (codex:document sys-symbol)
    (make-graphs)
    (mnas-package:copy-doc->public-html sys-string)
    (mnas-package:rsync-doc sys-string) 
    :make-all-finish))

;;;; (make-all)
