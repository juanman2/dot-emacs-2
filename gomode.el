(defun custom-go-mode ())

(use-package go-mode
:defer t
:ensure t
:mode ("\\.go\\'" . go-mode)
:init
  (setq c-basic-offset 4)
  (setq-default tab-width 4)
  (setq compile-command "echo Building... && go build -v && echo Testing... && go test -v && echo Linter... && golint")  
  (setq compilation-read-command 1)
  (add-hook 'go-mode-hook 'custom-go-mode)
:bind (("C-M-5" . compile)
       ("M-." . godef-jump)))


(setq compilation-window-height 14)
(defun my-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
	(let* ((w (split-window-vertically))
	       (h (window-height w)))
	  (select-window w)
	  (switch-to-buffer "*compilation*")
	  (shrink-window (- h compilation-window-height)))))))
(add-hook 'compilation-mode-hook 'my-compilation-hook)

(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(setq compilation-scroll-output t)
(global-set-key (kbd "M-,") 'next-error)

