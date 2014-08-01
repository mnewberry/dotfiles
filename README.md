dotfiles
========

The interesting configuration state of unix programs

mtbuild
-------

`mtbuild` is a script for efficiently rendering Sweave (LaTeX) fragments, while
shuffling R and LaTeX's numerous intermediary files under the rug in `_build`.  It's designed to support this workflow:

```
host:~ $ mkdir topic
host:~ $ cd topic/
host:~/topic $ ls
host:~/topic $ echo "$a^2 + b^2 = c^2$\cite{pythagoras}" > notes.mt
host:~/topic $ mtbuild --show-pdf=evince notes.mt
host:~/topic $ ls
_build  notes.mt
host:~/topic $ 
```

The above will render and display the fragment as a full latex document with a
references section and my favorite formatting.  The `vimrc` also provides a
method to call `mtbuild` upon writing any `.mt` files to the disk, to ensure
that the pdf on display is corresponds to the file on disk:

```
host:~/topic $ ls
host:~/topic $ vi notes.mt
host:~/topic $ ls
_build  notes.mt
host:~/topic $ evince _build/notes.pdf
```

It's rough, but very useful.

notion
------

See README.md in that section.
