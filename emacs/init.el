(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf hydra :ensure t)
    (leaf blackout :ensure t)

    :config
    (leaf-keywords-init)))

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf cus-edit
  :doc "tools for customizing Emacs and Lisp packages"
  :tag "builtin" "faces" "help"
  :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))

;;; https://qiita.com/hajime-f/items/26b5cbb3ff6fc36c6133
;;; ここに各自好きな設定を書く

(global-display-line-numbers-mode t)

(leaf vterm
  :ensure t
  :bind (("C-'" . vterm)))

;;; auto complete
(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :url "https://company-mode.github.io/"
  :emacs>= 24.3
  :ensure t
  :leaf-defer nil
  :bind ((company-active-map
	  ("M-n" . nil)
	  ("M-p" . nil)
	  ("C-s" . company-filter-candidates)
	  ("C-n" . company-select-next)
	  ("C-p" . company-select-previous)
	  ("C-f" . company-complete-selection)))
  :custom ((company-idle-delay . 0)
	   (company-minimum-prefix-length . 1)
	   (company-transformers . '(company-sort-by-occurrence)))
  :global-minor-mode global-company-mode)

;;; Git Gutter
(leaf git-gutter
  :ensure t
  :global-minor-mode global-git-gutter-mode
  :custom
  ((git-gutter:added-sign . "+")
   (git-gutter:deleted-sign . "-")
   (git-gutter:modified-sign . "=")))

(global-auto-revert-mode t)

;;; hide scroll bar
(scroll-bar-mode -1)

;;; Reactのためweb-mode
(leaf web-mode
  :ensure t
  :mode (("\\.tsx\\'"        . web-mode))
  :custom
  (web-mode-markup-indent-offset . 2)
  (web-mode-css-indent-offset . 2)
  (web-mode-code-indent-offset . 2)
  (web-mode-enable-auto-paring . t)
  (web-mode-enable-comment-keywords . t)
  (web-mode-enable-block-face . t)
)

;;; color scheme settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/everforest-theme")
(load-theme 'everforest-hard-dark t)

;;; disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; ウィンドウ幅で折り返し
(global-visual-line-mode t)

(provide 'init)

