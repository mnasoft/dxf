;;;; line-weights.lisp

(defparameter *line-weight-enum*
  '(("kLnWt000" 0)
    ("kLnWt005" 5)
    ("kLnWt009" 9)
    ("kLnWt013" 13)
    ("kLnWt015" 15)
    ("kLnWt018" 18)
    ("kLnWt020" 20)
    ("kLnWt025" 25)
    ("kLnWt030" 30)
    ("kLnWt035" 35)
    ("kLnWt040" 40)
    ("kLnWt050" 50)
    ("kLnWt053" 53)
    ("kLnWt060" 60)
    ("kLnWt070" 70)
    ("kLnWt080" 80)
    ("kLnWt090" 90)
    ("kLnWt100" 100)
    ("kLnWt106" 106)
    ("kLnWt120" 120)
    ("kLnWt140" 140)
    ("kLnWt158" 158)
    ("kLnWt200" 200)
    ("kLnWt211" 211)
    ("kLnWtByLayer" -1)
    ("kLnWtByBlock" -2)
    ("kLnWtByLwDefault" -3)))

(defun line-weight-ByLayer()     (second (assoc "kLnWtByLayer" *line-weight-enum* :test #'string=)))

(defun line-weight-ByBlock()     (second (assoc "kLnWtByBlock" *line-weight-enum* :test #'string=)))

(defun line-weight-ByLwDefault() (second (assoc "kLnWtByLwDefault" *line-weight-enum* :test #'string=)))

(defun line-weight-round (lw)
  "Пример использования:
;;;; (line-weight-round -3)
;;;; (line-weight-round 205)
;;;; (line-weight-round 250)
;;;; (line-weight-round \"ByLayer\")
;;;; (line-weight-round \"ByBlock\")
;;;; (line-weight-round \"Default\")"
  (cond
    ((and (stringp lw) (string= "ByLayer" lw))
     (line-weight-ByLayer))
    ((and (stringp lw) (string= "ByBlock" lw))
     (line-weight-ByBlock))
    ((and (stringp lw) (string= "Default" lw))
     (line-weight-ByLwDefault))
    ((and (integerp lw)
	  (second
	   (second
	    (first
	     (sort
	      (mapcar
	       #'(lambda (el)
		   (list (* (- lw (second el)) (- lw (second el))) el)) *line-weight-enum*)
	      #'< :key #'first)))) ))
    (t (line-weight-ByLwDefault))))
