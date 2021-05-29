anymouse LaTeX 
==============

This is a LaTeX package that sets the fonts and some other macros used by the
Anymouse Prophet in his political ramblings.

Dual-License LPPL and MIT. Whichever floats your boat.

Install the falls within `texmf-tree` into your TEXMF-LOCAL directory using the
same structure and then run the `texhash` command so that your LaTeX system
knows about them.

Package Options
---------------

The package currently has three options.

### Main Document Fonts

Defaults to `base35`. This option determines whether fonts from the Postscript
Level 2 "Base35" fonts should be used or whether the very similar but slightly
different fonts from the TeX Gyre collection should be used.

When set to the default `base35` the package will look to see if the
[MathTime Pro 2](https://www.pctex.com/mtpro2.html) package is available and if
it is not, it will throw a warning and use the TeX Gyre collection instead.

The free Lite version of MathTime Pro 2 is suitable.

When `texgyre` is specified as a package option or when MathTime Pro 2 is not
available, the [TeX Gyre](https://ctan.org/pkg/tex-gyre) fonts are used instead
of the Adobe/URW Base35 fonts.

### Monospace (Typewriter) Font Family

Defaults to `spacemono`. This option determines whether the monospace font
should be [Space Mono](https://fonts.google.com/specimen/Space+Mono) or a
monospace font from the Main Document Fonts collection.

When set to the default `spacemono` the package will look to see if the LaTeX
[spacemono](https://github.com/AnymouseProphet/SpaceMono-LaTeX) package is
available and if not, it will throw a warning and use a monospace font from the
Main Document Font collection instead.

When `courier` is specified as a package option or when the LaTeX `spacemono`
package is not available, it will use Courier (or Nimbus Sans L) if the Main
Document Fonts option is set to `base35` or it will use TeX Gyre-Cursor if the
Main Document Fonts option is set to `texgyre`.

### Canonical

Defaults to no.

First I would like to explain the Anymouse Prophet concept of Canonical.

A Canonical document is a document that is intended to have both an ISBN number
attached to it and will have a cryptography signature on the PDF vouching for
the authenticity of the PDF.

The Anymouse Prophet uploads the signed version of the PDF to archive.org where
it can be freely retrieved without cost by anyone who wants to read it.

The Canonical version will be a color document, making it not suitable due to
cost for people to print and send to politicians or other parties, but printed
versions can not be authenticated as coming from the Anymouse Prophet without
modification, so most printed versions are NOT canonical.

The non-canonical versions will be monochrome and lack the ISBN number. To
compile them from the same LaTeX as canonical, a macro defines whether or not
the document being compiled is canonical. When it is not canonical, the ISBN
number is not added and only monochrome is used so that it is cheap to print.

When the `canonical` option is passed to the `anymouse` package, the
`canonicalversion` macro is set to `yes`. Otherwise it is defined as `no`.


Package Macros
--------------

To be described later.
