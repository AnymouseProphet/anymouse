The `ampt3ipa.sty` Package
=============================

The purpose of this package is to make it easy to typeset IPA strings in a
document in a portable way. By "portable way" I mean such that you can compile
it with or without the fontspec way of loading fonts.

This class only allows typesetting IPA, it does not contain text commands that
allow you to create IPA glyphs based upon the name of the glyph.

Unfortunately to make this package portable between 8-bit and Unicode font
engines you will have to type the word or phrase twice and that does introduce
increased potential for typographical errors.


Commands
--------

This package provides four commands.

### `\ampunicodeipa{}`

This command is only available `fontspec` has been loaded before loading the
`ampt3ipa.sty` package. It takes a single argument, a UTF8 encoded IPA string.

Using `\ampunicodeipa{}` breaks compatibility with pdfLaTeX and LuaLaTeX/XeLaTeX
that do not have fontspec loaded.

### `\amptipa{}`

This command is always available. It takes a single argument, a T3 encoded IPA
string.

### `\amptextipa{}{}`

This command is always available and is the command primarily intended to be
used. The first argument is a UTF8 encoded IPA string and the second argument is
the T3 encoded equivalent.

If the document is compiled with `fontspec` then the UTF8 encoded string is used
with a Unicode font. If the document is compiled without `fontspec` then the T3
encoded equivalent is used with an 8-bit T3 encoded font.

### `\ipafont`

This command is only available `fontspec` has been loaded before loading the
`ampt3ipa.sty` package. It can be used to switch to the Unicode IPA font without
needing to use the other commands.

Using `\ipafont` breaks compatibility with pdfLaTeX and LuaLaTeX/XeLaTeX that do
not have fontspec loaded.


Package Options
---------------

There are two optional options.

### `fontspec`

This option has no meaning if the `fontspec` package is not already loaded. If
the `fontspec` package is loaded, you can specify `fontspec=no` to tell this
package that it should not try to use fontspec to load a Unicode IPA font.

The only logical reason for doing this is if you prefer the TIPA fonts be used
when compiling a document that uses `fontspec`.

### `unicodefont`

This option lets you specify which Unicode font family you want used used for
IPA strings when `fontspec` is available to load them. There are currently three
options:

#### `unicodefont=doulis`

This will cause the Doulis Sil Regular Unicode IPA font to be used for IPA
strings. This family does not have italic or bold variants.

#### `unicodefont=gentium`

This will cause the Gentium Plus Unicode IPA font family to be used for IPA
strings. This family does not *yet* have bold variants but it does have an
Italic variant.

#### `unicodefont=charis`

This will cause the Charis SIL Unicode IPA font family to be used for IPA
strings. This is also the default if you do not specify a font. This family has
Regular, Italic, Bold, and Bold Italic faces available.


Unicode Fonts
-------------

The Unicode fonts must be available within your TDS (TeX Directory Structure).
Make sure your TeXLive/MiKTeX/Whatever install is complete.

Unfortunately Unicode variants of the "TIPA" (TIPA means TeX IPA or Tokyo IPA)
fonts have not been made available and probably will not be made available.

I do not know which MiKTeX package provides them.


8-bit Fonts
-----------

The only T3 encoded 8-bit fonts are the "TIPA" fonts. They are part of the
[tipa](https://ctan.org/pkg/tipa) package on CTAN. Make sure you have that
package available.

Note that MiKTeX often is installed to only download packages when referenced.
This package only uses the fonts, it does not try to load `tipa.sty` so you may
have to specifically request `tipa` in MiKTeX.

Remember that 8-bit fonts need their map file enabled with `updmap-sys` after
installation before they are available.


TIPA Notes
----------

This package does not provide any of the extended functionallity that the `tipa`
package provides. This package only provides a way to typeset existing IPA
content.

It is *possible* I may extend this package in the future to allow for the
various commands provided by `tipa` but currently this package does not make
them available.


T3 Encoding Notes
-----------------

There is a TeX package called [unitipa](https://ctan.org/pkg/unitipa) that
converts UTF8 encoded IPA strings into T3 encoded IPA strings. However I do not
believe it works in a way that makes the strings easily retrievable. For now,
you probably have to use the tipa manual to manually convert UTF8 IPA to the
T3 encoding.

If you know you do not need document portability, just use the
`\ampunicodeipa{}` command with the understanding that your document will not
compile with pdfLaTeX or LuaLaTeX/XeLaTeX that have not loaded `fontspec`.


Rendering Bug
-------------

When T3 encoded fonts are used, sometimes an extra space is inserted before a
rendered small-caps character. I have seen the same thing happen with the
`\textipa{}` command from the tipa package so I do not believe it is a bug with
this package.


