;; Switch to safe profile?

(asdf:defsystem "cl-discord"
	:description "Easy-to-use API for Discord in Common Lisp, targeting API v10."
	:depends-on (:dexador :serapeum :alexandria)
	:serial t
	:components ((:file "packages")
							 (:module "primitives"
								:pathname "primitives/"
								:depends-on ("packages")
								;; :serial t
								:components ((:file "base")
														 (:file "user" :depends-on ("base" "images"))
														 (:file "images")
														 (:file "channels")))
							 ;; (:file "cl-discord")
							 )
	:author "ggero"
	:version "0.0.1"
	:licence "GPLv3"
	:source-control (:git "https://codeberg.org/gerogaga/discord-lib-cl")
	:bug-tracker "https://codeberg.org/gerogaga/discord-lib-cl/issues"
	:homepage "https://codeberg.org/gerogaga/discord-lib-cl/src/branch/master/README.org"
	:long-name "discord-lib-cl")
