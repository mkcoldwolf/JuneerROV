;; Auto-generated. Do not edit!


(when (boundp 'controller::instruction)
  (if (not (find-package "CONTROLLER"))
    (make-package "CONTROLLER"))
  (shadow 'instruction (find-package "CONTROLLER")))
(unless (find-package "CONTROLLER::INSTRUCTION")
  (make-package "CONTROLLER::INSTRUCTION"))

(in-package "ROS")
;;//! \htmlinclude instruction.msg.html


(defclass controller::instruction
  :super ros::object
  :slots (_direction _speed ))

(defmethod controller::instruction
  (:init
   (&key
    ((:direction __direction) "")
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _direction (string __direction))
   (setq _speed (float __speed))
   self)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; string _direction
    4 (length _direction)
    ;; float64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get controller::instruction :md5sum-) "573077274c1fe00a9fd9be74da89ee17")
(setf (get controller::instruction :datatype-) "controller/instruction")
(setf (get controller::instruction :definition-)
      "string direction
float64 speed

")



(provide :controller/instruction "573077274c1fe00a9fd9be74da89ee17")


