;;need to figure out how to open org mode files
;;and set up a cache directory again
;;make it so ittl load the org mode file only if there are no errors
;;also need to make it so files that are being worked on dont clutter up their directories

(require 'org)

(defcustom cache-dir "~/.emacs.d/cache/" "TODO:DOC" );;(:type string) )
(defvar init-cache-dir (concat cache-dir "init/") "TODO:DOC")
(defvar tmp-cache-dir (concat cache-dir "tmp/") "TODO:DOC")

(defun cache-create()
  (if (not (file-directory-p cache-dir))
      (make-directory cache-dir))
  (if (not (file-directory-p init-cache-dir))
      (make-directory init-cache-dir))
  (if (not (file-directory-p tmp-cache-dir))
      (make-directory tmp-cache-dir)))

(defun load-file-from-cache(filename)
   (let ((file-path (concat cache-dir filename)))
	 (if (file-exists-p file-path)
	     (condition-case err
		 ((load-file file-path))
	       (error ((message "ERROR: %s" (concat "Unable to load " file-path)))))
	   ((message "ERROR: %s" (concat "File does not exist " file-path)))
	   ))) 

(defun most-recent-file (dir)
   (car (directory-files path 'full nil #'file-newer-than-file-p))
   )

;;may need to make a seperate file for these so they are easier to load
(defun load-file-or-other(file other &optional msg-err)
  (condition-case err
      (progn (load-file file) t)
    (error (progn (if msg-err (message "ERROR: %s" err )) (load-file other) nil))))

(defun init()
  (cache-create)
  (condition-case err
      (progn
	(org-babel-tangle-file "~/.emacs.d/init.org" (concat tmp-cache-dir "init.el") "elisp")
	(if (load-file-or-other (concat tmp-cache-dir "init.el") (concat init-cache-dir "init.el") t)
	    (rename-file (concat tmp-cache-dir "init.el") (concat init-cache-dir "init.el") t)))
    (error (progn (message "ERROR: %s" err)(load-file (concat init-cache-dir "init.el"))))))

(init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
