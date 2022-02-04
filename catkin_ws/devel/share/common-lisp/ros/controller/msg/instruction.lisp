; Auto-generated. Do not edit!


(cl:in-package controller-msg)


;//! \htmlinclude instruction.msg.html

(cl:defclass <instruction> (roslisp-msg-protocol:ros-message)
  ((direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform "")
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass instruction (<instruction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <instruction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'instruction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controller-msg:<instruction> is deprecated: use controller-msg:instruction instead.")))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <instruction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller-msg:direction-val is deprecated.  Use controller-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <instruction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller-msg:speed-val is deprecated.  Use controller-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <instruction>) ostream)
  "Serializes a message object of type '<instruction>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <instruction>) istream)
  "Deserializes a message object of type '<instruction>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<instruction>)))
  "Returns string type for a message object of type '<instruction>"
  "controller/instruction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'instruction)))
  "Returns string type for a message object of type 'instruction"
  "controller/instruction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<instruction>)))
  "Returns md5sum for a message object of type '<instruction>"
  "573077274c1fe00a9fd9be74da89ee17")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'instruction)))
  "Returns md5sum for a message object of type 'instruction"
  "573077274c1fe00a9fd9be74da89ee17")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<instruction>)))
  "Returns full string definition for message of type '<instruction>"
  (cl:format cl:nil "string direction~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'instruction)))
  "Returns full string definition for message of type 'instruction"
  (cl:format cl:nil "string direction~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <instruction>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'direction))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <instruction>))
  "Converts a ROS message object to a list"
  (cl:list 'instruction
    (cl:cons ':direction (direction msg))
    (cl:cons ':speed (speed msg))
))
