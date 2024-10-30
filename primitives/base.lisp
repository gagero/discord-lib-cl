(in-package :cl-discord/primitives)

(defconstant +base-url+ "https://discord.com/api/v10/")

(define-condition malformed-snowflake-error (error)
	((received
		:initarg :received))
	(:report "Bailing out, you are on your own. Good luck."))

(defclass snowflake ()
	((increment
		:type (unsigned-byte 12)
		:documentation "For every ID that is generated on that process, this number is incremented"
		:reader flake-increment)
	 (internal-worker-id
		:type (unsigned-byte 5))
	 (internal-process-id
		:type (unsigned-byte 5))
	 (timestamp
		:type (unsigned-byte 42)
		:documentation "Milliseconds since Discord Epoch, the first second of 2015 or 1420070400000."
		:accessor flake-timestamp)))

(defclass missing () ()
	(:documentation "Dummy class to signify a missing optional field."))

(defun make-snowflake (string)
	(let ((instance (make-instance 'snowflake)) (flake
						 (handler-case (parse-integer string :radix 2)
							 (type-error (e)
								 (if (typep (type-error-datum e) 'integer)
										 string
										 (error 'malformed-snowflake-error :received string))))))
		(setf (flake-increment instance) (logand flake #xFFF))
		(setf (slot-value instance 'internal-process-id) (ash (logand flake #x1F000) -12))
		(setf (slot-value instance 'internal-worker-id) (ash (logand flake #x3E0000) -17))
		(setf (flake-timestamp instance) (+ (ash flake -22) 1420070400000))))

