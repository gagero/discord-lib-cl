(in-package :cl-discord/primitives)

(defclass user ()
	((id
		:type snowflake)
	 (username
		:type string)
	 (discriminator
		:type string)
	 (global-name
		:type (or string null))
	 (avatar
		:type (or string null))
	 (bot
		:type (or boolean null missing))
	 (system
		:type (or boolean missing))
	 (mfa-enabled
		:type (or boolean missing))
	 (banner
		:type (or string missing))
	 (accent-color
		:type (or integer null missing))
	 (locale
		:type (or string missing))
	 (verified
		:type (or boolean missing))
	 (email
		:type (or string null missing))
	 (flags
		:type (or (integer 1 #x400000) missing))
	 (premium-type
		:type (or (integer 0 3) missing)
		:initarg :prem)
	 (public-flags
		:type (or integer missing))
	 (avatar-decoration
		:type (or string null missing))))

(defun get-user (id)
	(dex:get (concatenate 'string +base-url+ "users/" id)))

(defun get-current-user ()
	(dex:get (concatenate 'string +base-url+ "user/@me")))
