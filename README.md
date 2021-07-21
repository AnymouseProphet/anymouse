Anymouse Prophet LaTeX Files
============================

__All files within are VERY UNSTABLE at the moment.__

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


`amplgrgreek.sty`
-----------------

Sets up the `\amptextgreek{}` command for typesetting (non-math) Greek strings
when Greek is not the primary language of the document.

Better handling of font setup for Greek strings than what was previously in the
`anymouse.sty` file.

With pdfLaTeX you can use LGR or UTF8 as the argument. With LuaLaTeX it depends
upon whether or not the Greek font is loaded by fontspec. If loaded by fontspec
then only UTF8 Greek strings are supported, if not loaded by fontspec then only
LGR encoded strings are supported. Hopefully that can get resolved.

For usage, see [amplgrgreek.md](amplgrgreek.md)


`ampt3ipa.sty`
--------------

Sets up the `\amptextipa{}{}` command that allows for portable typesetting of
IPA content.

Better handling of font setup for IPA strings than what was previously in the
`anymouse.sty` file.

For usage, see [ampt3ipa.md](ampt3ipa.md)


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


Cryptography Signature Keypair
==============================

If you would like to create a private/public keypair to add a digital signature
to a PDF file, see the [keypair.md](keypair.md) file.


Future
======

No testing with XeLaTeX has been done other than to see it did not work. I got
the error

    ! Extended mathchar used as mathchar (14799933).
    <to be read again> 
                       \relax 
    l.185 ...lone example in this textbook is `$\bm{J}
                                                  $'.

I do not know if that is specific to the `bm` package or something else.


Known Bugs
==========

### `anymouse.sty`

These bugs are for  `anymouse.sty`

If the `value` in `edition=value` is not valid, the package does not do the
right thing. It should die.

[can't be fixed]
If using LuaLaTeX and `fontspec` is loaded before `anymouse.sty`, then the
"PDF Base 14" fonts are not used with `edition=reduced`.

[can't be fixed]
If using LuaLaTeX and `fontspec` is loaded after `anymouse.sty`, then the
output with `edition=reduced` is very broken.

It is not possible to fix those two bugs until fontspec gets the ability to load
the "PDF Base 14" fonts but it appears the developers have no interest in adding
Postscript font support.

### `amplgrgreek.sty`

These bugs are for `amplgrgreek.sty`

When `fontspec` loads the Greek font, only UTF8 strings work with the
`\amptextgreek{}` command. When LuaLaTeX is used but `fontspec` is not used to
load the font, the only LGR strings work with the `\amptextgreek{}` command.

Currently, the package does not know how to look to see if the actual Unicode
font file is within the TeX TDS. I suspect there is a way.

Currently, the package only knows how to find the Unicode variants of a few
fonts. The list will grow.

Some of the fontspec loaded fonts may benefit from tweaking the fontspec
options.

