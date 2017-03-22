;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use Magnar's awesome symbol-focus, with evil bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: there should be a cleaner way to do this
(load-file "~/b/dotfiles/spacemacs-private/.emacs.d/private/symbol-focus.el")

;; Evil bindings
(define-key evil-normal-state-map (kbd "SPC o f p") 'sf/focus-at-point)
(define-key evil-normal-state-map (kbd "SPC o f r") 'sf/reset)
(define-key evil-normal-state-map (kbd "SPC o f b") 'sf/back)

;; overload "n" and "p" in case there is a focus in progress ;;

(defun evil-sf/contextual-next ()
  (interactive)
  (if symbol-focus-mode
      (sf/next)
    (evil-search-next)))

(defun evil-sf/contextual-previous ()
  (interactive)
  (if symbol-focus-mode
      (sf/prev)
    (evil-search-previous)))

;; (define-key evil-normal-state-map (kbd "n") 'evil-sf/contextual-next)
;; (define-key evil-normal-state-map (kbd "N") 'evil-sf/contextual-previous)
