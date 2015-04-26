#!/bin/sh
# -*- mode: shell-script -*-
#
# export files with org-mode
#
DIR=`pwd`
FILES=""

# wrap each argument in the code required to call tangle on it
for i in $@; do
    FILES="$FILES \"$i\""
done

emacs -Q --batch \
--eval "(progn
(require 'org)
(mapc (lambda (file)
       (find-file (expand-file-name file \"$DIR\"))
       (org-html-export-to-html)
       (kill-buffer)) '($FILES)))"
