(make-variable-buffer-local 'company-backends)

(defun default-lisp-mode-hook ()
  (set-pairs '("(" "{" "[" "\""))
  (auto-complete-mode t)
  (setq ac-sources '(ac-source-abbrev ac-source-words-in-buffer ac-source-symbols))
  (setq company-backends '(company-elisp
                           company-dabbrev-code)))

(defun default-java-mode-hook ()
  (set-pairs '("(" "{" "[" "\"" "\'"))
  (setq company-backends '(company-dabbrev-code))
  ;; (company-mode t)
  (setq c-comment-continuation-stars "* ")
  (setq c-basic-offset 2)
  (auto-complete-mode t))

(defun default-html-mode-hook ()
  (setq company-backends '(company-dabbrev))
  (set-pairs '("<" "{" "[" "\"" "\'")))

;; Ruby
(add-hook 'ruby-mode-hook
          (lambda ()
            (setq company-backends '(
                                     company-dabbrev-code))
            (setq ac-sources '(ac-source-abbrev ac-source-symbols ac-source-words-in-buffer))
            ;; (company-mode t)
            ;; (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools)))
            (auto-complete-mode t)
            (set-pairs '("(" "{" "[" "\"" "\'" "|"))
            (local-set-key [return] 'ruby-reindent-then-newline-and-indent)))

;; Objective C
(add-hook 'objc-mode-hook
          (lambda ()
            (set-pairs '("(" "{" "[" "\""))
            (setq company-backends '(
                                     company-dabbrev-code))
            ;; (company-mode t)
            ;; (setq ac-omni-completion-sources '(("\\.\\=" ac-source-rcodetools)))
            (auto-complete-mode t)
            (setq ac-sources '(ac-source-abbrev ac-source-symbols ac-source-words-in-buffer))))

;; Java
(add-hook 'java-mode-hook 'default-java-mode-hook)
(add-hook 'jde-mode-hook
          (lambda ()
            (local-unset-key (kbd "M-j"))
            (local-unset-key (kbd "C-c C-a"))
            (global-unset-key (kbd "C-c C-a"))
            (default-java-mode-hook)
            (setq jde-complete-insert-method-signature nil)
            ;; No "final" when auto creating methods and variables.
            (setq jde-gen-final-arguments nil)
            (setq jde-gen-final-methods nil)

            ;; Don't use JDE's builtin abbrevs.
            (setq jde-enable-abbrev-mode nil)))

;; Lisp
(add-hook 'lisp-mode-hook 'default-lisp-mode-hook)
(add-hook 'lisp-interaction-mode-hook 'default-lisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'default-lisp-mode-hook)

;; CSS
(add-hook 'css-mode-hook
          (lambda ()
            (setq company-backends '(company-css))
            ;; (company-mode t)
            (setq css-indent-level 2)
            (setq css-indent-offset 2)
            (set-pairs '("(" "[" "\"" "\'"))))

;; HTML
(add-hook 'html-mode-hook 'default-html-mode-hook)
(add-hook 'nxml-mode-hook
          (lambda ()
            (default-html-mode-hook)))

;; Org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "C-c a") 'org-agenda)
            (define-key org-mode-map (kbd "C-c t u") 'org-clock-update-time-maybe)
            (define-key org-mode-map (kbd "C-c t g") 'org-clock-goto)
            (set-pairs '("(" "{" "[" "\""))
            (auto-fill-mode 1)))

;; Comint
(add-hook 'comint-mode-hook
          (lambda ()
            ))