;;; packages.el --- typescript Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: JAremko <w3techplaygound@gmail.com> 
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
    :config (progn
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (when (configuration-layer/package-usedp 'company)
                (company-mode-on))
              (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
                "gg" 'tide-jump-to-definition
                "gb" 'tide-jump-back
                "hh" 'tide-documentation-at-point
                "sr" 'tide-restart-server
                "rn" 'tide-rename-symbol
                "fr" 'tide-reference
              (spacemacs/set-leader-keys-for-major-mode 'tide-references-mode
                "n" 'tide-find-next-reference
                "N" 'tide-find-previous-reference
                "g" 'tide-goto-reference)))))
