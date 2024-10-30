(in-package :cl-discord/primitives)

(defconstant +channel-types+
	'(guild-text dm guild-voice group-dm guild-category guild-announcement announcement-thread public-thread private-thread guild-stage-voice guild-directory guild-forum guild-media))

(deftype channel-type ()
	`(member ,@+channel-types+))

(defun enum-int (variant enum var &optional (test #'eq))
	(when (typep variant enum)
		(find variant var :test test)))

(defclass overwrite ()
	((id
		:type snowflake)
	 (type
		:type bit)
	 (allow
		:type string)
	 (deny
		:type string)))

(defclass channel ()
	((id
		:type snowflake)
	 (type
		:type (integer 0 16))
	 (guild-id
		:type (or snowflake missing)
		:documentation "The id of the guild (may be missing for some channel objects received over gateway guild dispatches).")
	 (position
		:type (or snowflake missing))
	 (permission-overwrites
		:type (or array missing))
	 (name
		:type (or string null missing)
		:documentation "The name of the channel (1-100 characters).")
	 (topic
		:type (or string null missing)
		:documentation "The channel topic (0-4096 characters for GUILD_FORUM and GUILD_MEDIA channels, 0-1024 characters for all others).")
	 (nsfw
		:type (or boolean missing))
	 (last-message-id
		:type (or snowflake null missing)
		:documentation "The id of the last message sent in this channel (or thread for GUILD_FORUM or GUILD_MEDIA channels) (may not point to an existing or valid message or thread).")
	 (bitrate
		:type (or missing integer))
	 (user-limit
		:type (or integer missing))
	 (rate-limit-per-user
		:type (or integer missing)
		:documentation "Amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected.")
	 (recipients
		:type (or array missing))
	 ))

(defun get-channel ()
	)
