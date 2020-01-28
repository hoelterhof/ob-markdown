(require 'ob)
(require 'org-compat)

(defun org-babel-execute:markdown (body params)
  "Execute a block of markdown code with org-babel.
This function is called by `org-babel-execute-src-block'."
  (let* ((result-params (split-string (or (cdr (assoc :results params)) "")))
	 (out-file ((lambda (el)
		      (or el
			  (error
			   "markdown code block requires :file header argument")))
		    (cdr (assoc :file params))))
	 (in-file (org-babel-temp-file "markdown-"))
	 (cmdline (cdr (assoc :cmdline params)))
	 (to (cdr (assoc :to params)))
	 (template (cdr (assoc :template params)))	 
	 (cmd (concat "pandoc"
		      " -o " (org-babel-process-file-name out-file)
		      " -i " (org-babel-process-file-name in-file)
		      " -f markdown "
		      " -t " to
		      " --template " template
		      " " cmdline)))
    (with-temp-file in-file (insert body))
    (message cmd) (shell-command cmd)
    nil)) ;; signal that output has already been written to file

(defun org-babel-prep-session:markdown (session params)
  "Return an error because markdown does not support sessions."
  (error "markdown does not support sessions"))

(provide 'ob-markdown)
