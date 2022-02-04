
(cl:in-package :asdf)

(defsystem "controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "instruction" :depends-on ("_package_instruction"))
    (:file "_package_instruction" :depends-on ("_package"))
  ))