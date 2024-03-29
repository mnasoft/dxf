
;   ColorIndex = 0
;   ColorMethod = 193
;   ColorName (RO) = ""
;   EntityColor = -1056964608

(- (* -61 256 256 256) -1023409921)

1  -1023410175
2  -1023410174
3  3
4  2
5  1 
6  0
7 -1023410169

255 -1023409921

(+ -1023410175 254)

(floor -1023410175 (* -61 256 256 256))

'(((  0   0   0) -1040187392)
  ((  0   0 128) -1040187264)
  ((  0 128   0) -1040154624)
  ((  0 128 128) -1040154496)
  ((128   0   0) -1031798784)
  ((128   0 128) -1031798656)
  ((128 128   0) -1031766016)
  ((128 128 128) -1031765888))

((  0   0 128) -1040187264)
((  0 128   0) -1040154624)
((128   0   0) -1031798784)

(+
 (apply #'+
        (mapcar #'*
                '(128    128 128)
                '(65536  256   1)))
 -1040187392) 

(/ -1040187392 256 256 256)

(ql:quickload :math/ls-gauss)

(math/ls-gauss:solve-x
 (make-instance 'math/ls-gauss::<matrix> 
		:initial-contents '(( 10  17  19 1 -1039527661)
				    ( 26  39 241 1 -1038473231)
				    ( 48  53  16 1 -1037028080)
                                    (255  39 241 1 -1023465487))))
;  => Matr 1х4
; [ 65536     256       1         -1040187392 ]
(* 256 256)  65536

(expt 2 30) ; => 1073741824 (31 bits, #x40000000)
( + 1032662993 7524399)

(+ 1073741824 -1032662993)
