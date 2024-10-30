(in-package :cl-discord/primitives)

(defconstant +image-base-url+ "https://cdn.discordapp.com/")

;; (deftype image-kind ()
;; 	(member
;; 	 'custom-emoji
;; 	 'guild-icon
;; 	 'guild-splash
;; 	 'guild-discovery-splash
;; 	 'guild-banner
;; 	 'user-banner
;; 	 'default-user-avatar
;; 	 'user-avatar
;; 	 'guild-member-avatar
;; 	 'user-avatar-decoration
;; 	 'application-icon
;; 	 'application-cover
;; 	 'application-asset
;; 	 'achievement-icon
;; 	 'store-page-asset
;; 	 'sticker-pack-banner
;; 	 'team-icon
;; 	 'sticker
;; 	 'role-icon
;; 	 'guild-scheduled-event-cover
;; 	 'guild-member-banner))

;; (deftype image-format ()
;; 	(member 'png 'jpeg 'jpg 'webp 'gif 'lottie 'json))

;; (defun concat-url (format &rest strings)
;; 	(let ((result +image-base-url+))
;; 		(loop for i in strings do
;; 			(if (< i (- (length strings) 1))
;; 					(concatenate 'string result (string (nth i strings)) "/")
;; 					(concatenate 'string result "." (string format))))
;; 		result))

;; (defmacro compare-image-formats (allowed-formats format &rest strings)
;; 	`(if (find ,format ,allowed-formats)
;; 			 (concat-url ,format ,@strings)
;; 			 (error "Unsupported format for kind.")))

;; TODO: sticker needs to be special cased
;; (defun make-image-url (kind format &rest hashes)
;; 	"Creates a URL for an `image-kind' KIND and returns it. Checks for image format validity. Hashes must be a list with strings in the order needed by the URL as specified by the Discord documentation. FORMAT must be of type `image-format'."
;; 	(ccase kind
;; 		(custom-emoji (compare-image-formats (list 'png 'jpeg 'jpg 'webp 'gif) format
;; 																				 (list "emojis" (first hashes))))
;; 		(guild-icon (compare-image-formats (list 'png 'jpeg 'jpg 'webp 'gif) format
;; 																			 (list "icons" (first hashes) (second hashes))))
;; 		(guild-splash (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																				 (list "splashes" (first hashes) (second hashes))))
;; 		(guild-discovery-splash (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																									 (list "discovery-splashes" (first hashes) (second hashes))))
;; 		(guild-banner (compare-image-formats (list 'png 'jpeg 'jpg 'webp 'gif) format
;; 																				 (list "banners" (first hashes) (second hashes))))
;; 		(user-banner (compare-image-formats (list 'png 'jpeg 'jpg 'webp 'gif) format
;; 																				(list "banners" (first hashes) (second hashes))))
;; 		(default-user-avatar (compare-image-formats (list 'png) format
;; 																								(list "embed/avatars" (first hashes))))
;; 		(user-avatar (compare-image-formats (list 'png 'jpeg 'jpg 'webp 'gif) format
;; 																				(list "avatars" (first hashes) (second hashes) format)))
;; 		(guild-member-avatar (compare-image-formats (list 'png 'jpeg 'jpg 'webp 'gif) format
;; 																								(list "guilds" (first hashes) "users" (second hashes) "avatars" (third hashes))))
;; 		(user-avatar-decoration (compare-image-formats (list 'png) format
;; 																									 (list "avatar-decorations" (first hashes) (second hashes))))
;; 		(application-icon (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																						 (list "app-icons" (first hashes) (second hashes))))
;; 		(application-cover (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																							(list "app-icons" (first hashes) (second hashes))))
;; 		(application-asset (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																							(list "app-assets" (first hashes) (second hashes))))
;; 		(achievement-icon (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																						 (list "app-assets" (first hashes) "achievements" (second hashes) "icons" (third hashes))))
;; 		(store-page-asset (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																						 (list "app-assets" (first hashes) "store" (second hashes))))
;; 		(sticker-pack-banner (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																								(list "app-assets/710982414301790216/store" (first hashes))))
;; 		(team-icon (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																			(list "team-icons" (first hashes) (second hashes))))
;; 		(role-icon (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																			(list "role-icon" (first hashes) (second hashes))))
;; 		(guild-scheduled-event-cover (compare-image-formats (list 'png 'jpeg 'jpg 'webp) format
;; 																												(list "guild-events" (first hashes) (second hashes))))
;; 		(guild-member-banner (compare-image-formats (list 'png 'jpeg 'jpg 'webp 'gif) format
;; 																								(list "guilds" (first hashes) "users" (second hashes) "banners" (third hashes))))))
