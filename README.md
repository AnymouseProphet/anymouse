Anymouse Prophet LaTeX Files
============================

This is a LaTeX package that sets the fonts and some other macros used by the
Anymouse Prophet in his writings.

Install the files within `texmf-tree` into your TEXMF-LOCAL directory using the
same structure and then run the `texhash` command so that your LaTeX system
knows about them.

This package is still in development.


`anymouse.sty`
--------------

This is the primary style file in this package. It is dual-licensed LPPL and
MIT.

For usage, see [anymouse.md](anymouse.md)


`ampmisc.sty`
-------------

A complimentary file to `anymouse.sty` that defines macros commonly used by the
Anymouse Prophet in his writings. It is dual-licensed LPPL and MIT.

For usage, see [ampmisc.md](ampmisc.md)


`ampean13isbn.sty`
------------------

A pedantic patched version of [ean13isbn.sty](https://ctan.org/pkg/ean13isbn).
The patch just changes the file to use TeX Gyre Heros Condensed in a T1 encoding
instead of Helvetica/Nimbus Sans L Condensed in an OT1 encoding.

The original file was written by 

This file is licensed under the LPPL.

You do not have to load this file manually, but you can if you want. If you pass
the binary option `isbn` to the `anymouse.sty` package, this package will be
loaded by that package.


`digsig.sty`
------------

This file was written by Martin Lottermoser. It is not part of CTAN and is only
included here in case the server I retrieved the file from goes away.

It is licensed under the GNU LGLP version 2.1. No modifications have been made,
and none of the other style files load or call this file. The copy here is just
a convenience mirror.

The original file was retrieved from:

http://home.htp-tel.de/lottermose2/tex/dist/digsig.sty

What this file does, it patches the `hyperref` package to allow the creation of
a digital cryptography signature form field.

This file must thus be loaded *after* hyperref.

Allegedly, it only works with the `pdflatex` compiler and breaks and LuaLaTeX is
used. Also, it seems the LaTeX3 team is working on adding native support for
digital form fields to LaTeX so soon, this file will not be necessary.







