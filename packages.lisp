(defpackage :cl-discord/primitives
	(:nicknames :discord/primitives :cl-d/primitives)
	(:use :cl)
(:documentation "The primitive functions describe in the Discord API reference. Does not include higher-level functionality."))

(defpackage :cl-discord
	(:nicknames :discord )
	(:use :cl)
	(:documentation "Easy-to-use API for Discord in Common Lisp, targeting API v10."))
