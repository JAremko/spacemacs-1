;;; packages.el --- typescript Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; "Spacemacized" by JAremko <w3techplaygound@gmail.com> 
;; URL: https://github.com/JAremko/spacemacs-tide-pr
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq typescript-packages '(tide))

(defun typescript/init-tide ()
  "Initialize tide"
  (use-package tide
    :defer t
    :mode ("\\.ts\\'" . typescript-mode)
    :init (progn
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (when (configuration-layer/package-usedp 'company)
                 (company-mode-on))
            )
    :config (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
            "mgg" 'tide-jump-to-definition
            "mgb" 'tide-jump-back
            "mhh" 'tide-documentation-at-point
            "msr" 'tide-restart-server
            "mrr" 'tide-reference
            "mrn" 'tide-rename-symbol)))
