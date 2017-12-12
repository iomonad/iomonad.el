# iomonad.el

<a href="https://github.com/iomonad/iomonad.el"><img
  src="https://www.gnu.org/software/emacs/images/emacs.png" alt="Normalize Logo"
  width="80" height="80" align="right"></a>
  
  > Emacs configuration with batteries included.
 
**Installation**
```bash
git clone https://github.com/iomonad/iomonad.el ~/.emacs.d
```
## What does it do?

* Directory based configuration structure.
* Evil-Mode leaders key based workflow.
* Evil nerd-commenter mappings.
* Lightweight startup and low memory footprint.
* Support snippets, completion and more ...
<br>
<p align="center">
  <img src="https://u.teknik.io/yXjrP.png"/>
</p>

## Implementing your packages
  > Even if the configuration comes with the essentials
* Use-package backend used.

#### Find the folder
```bash
$ tree -d ~/.emacs.d/lisp
~/.emacs.d/lisp
├── core
├── languages
├── libs
└── package   <------ Here
    └── disabled
```
> Packges are loaded by providing file. You should provide the filename of your file.

#### Ex: pkg-foobar.el
```elisp
;; -*- lexical-binding: t -*-
(use-package foobar ; Your package name
  :ensure t) ; Make sure you have enable this

;; Your configurations go here ...
;; ...

(provide 'pkg-foobar)
```
## Fake Busy

<p align="center">
  <img src="https://u.teknik.io/GFwBt.png"/>
</p>
