;;; el-composer.el --- Simple package installer

;; Author: xcezx <main.xcezx@gmail.com>
;; Maintainer: xcezx <main.xcezx@gmail.com>
;; Keywords: package
;; Version: 0.0.1

;;; Code:

(require 'package)

(defgroup el-composer nil
  "Simple package installer")

;;;###autoload
(defcustom el-composer-packages '()
  "List of package."
  :type '(repeat symbol)
  :group 'el-composer)

(defun el-composer-install-package-unless-installed (pkg)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;;;###autoload
(defun el-composer-install-packages ()
  (interactive)
  (unless package--initialized
    (package-initialize t))
  (unless package-archive-contents
    (package-refresh-contents))
  (mapc 'el-composer-install-package-unless-installed el-composer-packages))

(provide 'el-composer)

