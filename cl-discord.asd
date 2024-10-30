(defsystem "cl-discord"
	:description "Easy-to-use API for Discord in Common Lisp, targeting API v10."
	:depends-on (:dexador :serapeum)
	:components ((:file "packages")
							 (:file "primitives/base" :depends-on ("packages"))
							 (:file "primitives/images" :depends-on ("packages"))
							 (:file "primitives/user" :depends-on ("packages" "primitives/base" "primitives/images")))
	:author "ggero"
	:version "0.0.1"
	:licence "GPLv3"
	:source-control "TODO"
	:bug-tracker "TODO")
