;;;###autoload
(defun org-insert-clipboard-image ()
  "Insert an image from the clipboard, placing the png in the same directory and inserting a link into the current (org) document"
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (shell-command (concat "xclip -selection clipboard -t image/png -o > \"" filename "\""))
  (insert (concat "[[./" filename "]]"))
  (org-display-inline-images))

;;;###autoload
(defun git-sync ()
  (interactive)
  (projectile-run-shell-command-in-root "git-sync"))
