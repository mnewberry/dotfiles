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
that the pdf on display corresponds to the file on disk:

```
host:~/topic $ ls
host:~/topic $ vi notes.mt
host:~/topic $ ls
_build  notes.mt
host:~/topic $ evince _build/notes.pdf
```

To install `mtbuild`, copy `mtbuild/` to `~/.mtbuild/`, populate
`~/.mtbuild/refstyle.bst` and `~/.mtbuild/index.bib` with your favorite bibtex
style and bibliography respectively (they can be symlinks), and copy
`bin/mtbuild` somewhere in your `PATH`.  It depends on LaTeX, R, Sweave, and
cacheSweave, so make sure those are installed.

git-find
--------

If `git-find` is in the path, commands of the form `git find ...` will behave
as unix `find ...`, but ignoring any files listed in the `.gitignore`.

notion
------

See README.md in that section.

mutt
----

Mutt has a very featureful interface for autocompletion of email addresses and
other things.  We ignore all that.

In a brutal, simple solution, `mutt-grep-maildir <maildir> <outfile>` builds a
list recipient addresses of any email within `maildir` and lists them to
`outfile`.  The `muttrc` fragment shows how to connect a list of email
addresses stored in `~/.mutt/addressdb` to mutt's `Ctrl-t` autocompletion
feature.  What fun!
