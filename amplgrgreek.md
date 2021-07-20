The `amplgrgreek.sty` Package
=============================

The purpose of this package is to make it easy to typeset a Greek string in a
LaTeX document in a portable way where the primary language of the document is
not Greek. By "portable way" I mean such that you can compile it with or without
the fontspec way of loading fonts.

If you need to typeset large segments of Greek, such as an exegesis on "The
Iliad" or "Odyssey", this package is *probably* not the solution.

This package sets up a single font---it does not distinguish between the
main/serif font, the sans-serif font, and the monospace/typewriter font. This is
not the right solution if you have such a need.

Dual-License LPPL and MIT. Whichever floats your boat.

This package is still in development.


Commands
--------

This package provides the single command `amptextgreek{}`


Package Options
---------------

There are two optional options.

### `fontspec`

This option has no meaning if the `fontspec` package is not already loaded. If
the `fontspec` package is loaded, you can specify `fontspec=no` to tell this
package that it should not try to use fontspec to load the Greek font.

The only logical reason for setting `fontspec=no` would be if your strings of
Greek text are written in the LGR encoding. In that case, you want to set the
option `fontspec=no` because I have not yet written a function to translate such
string into the UTF8 that a `fontspec` loaded font needs.

### `lgrfont`

This option takes the NFSS name of a font for which a LGR encoded font family
can be found within your TDS (TeX Directory Structure). Remember this is package
exists for document portability, and both pdfLaTeX and LuaLaTeX *without* the
`fontspec` package loaded need to be able to use the 8-bit LGR encoded variant.

The package will look to see if the file `lgr<name>.fd` can be found on your
system (where `<name>` is the NFSS name for the font family) and if it can not
find it then the package falls back to GFS Artemisia (NFSS name `artemisia`).


Unicode Fonts
-------------

When `fontspec` is loaded *before* this package and the selected font has a
Unicode variant the package knows about, then unless you specify `fontspec=no`
to the package at load time, the package will use `fontspec` to load the Unicode
version of the font family.

This package knows how to set up the following Unicode Greek fonts with
`fontspec`:

* GFS Artemisia (NFSS name `artemisia`)
* GFS Bodoni (NFSS name `bodoni`)
* GFS Neohellenic (NFSS name `neohellenic`)

More will be added.

Please note that in its present development state, this package does not yet
know how to make sure the Unicode variants of those fonts are actually installed
within your TDS. They will be there if you do a full install of TeXLive.


8-bit Fonts
-----------

With 8-bit font LaTeX such as pdfLaTeX or LuaLaTeX without using `fontspec`, the
LGR font encoding is the font encoding with the best Greek support.

The way Greek is output is to specify the LGR encoding and then either specify a
LGR encoded font using NFSS that supports the LGR encoding directly or by using
the `substitutefont` package to tell LaTeX to use the specified font when the
LGR encoding is encountered. This package does the latter although I am open to
the idea of doing the former.

Using the `substitutefont` package does make it easy to specify different LGR
fonts based upon the context of whether or not the "Roman" family, "Sans Serif"
family, or "Typewriter" family is being used. However this package does not use
that capability.

Regardless of which solution is used, it only works if you have let the
`fontenc` package know that you are using the LGR encoding.

LuaLaTeX users, including some very prominant names, often religiously tell
users not to use `fontenc` with LuaLaTeX or not to use it if also using
`fontspec`. That's bullocks.

The issue is that the default encoding with LuaLaTeX (and XeLaTeX) when using
`fontspec` loaded fonts needs to be the `TU` encoding, and `fontspec` itself
sets that as the default encoding __by using `fontenc`__.

When this package use 8-bit fonts for Greek, it makes sure that the default
encoding is in fact `TU` if `fontspec` has been loaded and it also makes sure
the default encoding is whatever it was set to before this package loaded
*unless* the default encoding was `OT1` in which case it switches it to `T1`.
Vast majority of the time `OT1` is the default encoding, the document simply did
not bother to set it to `T1`.

At any rate, this package does use `fontenc` when the Greek family is an 8-bit
family and no, it does not break `fontspec` when done correctly.

The issue is not specific to `fontspec` by the way. Whenever using `fontenc`
you have to make sure to specify your intended encoding last *regardless* of the
font engine. Why LuaLaTeX gurus do not explain it this way, I am puzzled by.
That is how it was always explained for pdfLaTeX and that has not changed.

### Unicode Input with 8-bit Greek Fonts

With pdfLaTeX, as long as you have set `\usepackage[utf8]{inputenc}` you can
enter UTF-8 Greek as your input and the LaTeX engine will convert the input to
8-bit LGR for you.

LuaLaTeX where UTF-8 is the default input encoding *should* do the same thing
but it doesn't, it's a serious bug.

With 8-bit Greek fonts, you can use either 8-bit or UTF-8 input with the
`ampgreektext{}` function but with LuaLaTeX you can only use 8-bit input.

Until this bug is fixed, please make sure you use Greek fonts the package knows
how to set with `fontspec` if you want to use UTF-8 Greek input.


