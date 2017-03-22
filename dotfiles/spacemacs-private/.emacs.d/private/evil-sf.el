;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use Magnar's awesome symbol-focus, with evil bindings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; TODO: there should be a cleaner way to do this
(load-file "~/b/dotfiles/spacemacs-private/.emacs.d/private/symbol-focus.el")

;; Evil bindings
(define-key evil-normal-state-map (kbd "SPC o f p")
  (lambda () (interactive)
    (sf/focus-at-point)))

(define-key evil-normal-state-map (kbd "SPC o f r")
  (lambda () (interactive)
    (sf/reset)))

(define-key evil-normal-state-map (kbd "SPC o f b")
  (lambda () (interactive)
    (sf/back)))

;; overload "n" and "p" in case there is a focus in progress ;;

(define-key evil-normal-state-map (kbd "n")
  (lambda () (interactive)
    (if symbol-focus-mode
        (sf/next)
      (evil-search-next))))

(define-key evil-normal-state-map (kbd "N")
  (lambda () (interactive)
    (if symbol-focus-mode
        (sf/prev)
      (evil-search-previous))))
