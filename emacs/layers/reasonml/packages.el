;;; packages.el --- reasonml layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: simon <simon@drowzy>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `reasonml-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `reasonml/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `reasonml/pre-init-PACKAGE' and/or
;;   `reasonml/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

  (defconst reasonml-packages
    '(
      merlin
      ;; (reason-mode :location local)
      ;; (refmt :location local)
      (refmt :location (recipe
                        :fetcher github
                        :repo facebook/reason
                        :files ("editorSupport/emacs/refmt.el")))

      (reason-mode :location (recipe
                              :fetcher github
                              :repo facebook/reason
                              :files ("editorSupport/emacs/reason-mode.el")))
    ))
  ;; TODO refmt will fail to load and in turn cause this layer to fail to load
  ;; when starting spacemacs.
  (defun reasonml/init-refmt ()
    (use-package refmt))
  (defun reasonml-post-init-merlin ())
  (defun reasonml/init-reason-mode ()
    (use-package reason-mode
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.re\\'" . reason-mode))
      (add-to-list 'auto-mode-alist '("\\.rei\\'" . reason-mode))
      (setq opam (substring (shell-command-to-string "opam config var prefix 2> /dev/null") 0 -1))
      (add-to-list 'load-path (concat opam "/share/emacs/site-lisp"))
      (setq refmt-command (concat opam "/bin/refmt"))

      ;; (require 'reason-mode)
      ;; (require 'merlin)
      (setq merlin-ac-setup t)
      (add-hook 'reason-mode-hook (lambda ()
                                    (add-hook 'before-save-hook 'refmt-before-save)
                                    (merlin-mode)))
      )
    ))



;;; packages.el ends here
