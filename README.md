# ob-markdown Example

This is an example for a simple babel execution function rendering markdown content in orgmode using pandoc.

Please add this to your init.el-file:
```
(require 'ob-markdown)
(org-babel-do-load-languages
   'org-babel-load-languages
   '((markdown . t)))
```
Take care that `ob-markdown` is found on you disk. In case add `(add-to-list 'load-path "PATH")` before.


Then create markdown blocks in orgmode like this:
```
#+BEGIN_SRC markdown :file output_filename.pdf
title: 'This is the title'
...
# Headline
Here might be some text
#+END
```
