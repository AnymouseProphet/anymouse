The `anymouse.sty` Package
==========================

If pdfLaTeX is used, this package sets up the necessary fonts using a T1
encoding as the primary text output encoding.

If LuaLaTeX is used, this package set up the necessary fonts using fontspec
*except* for optional IPA and Greek fonts.

This package also sets up a few other settings based upon an `edition=value`
option that allows for relatively easy generation of different versions of a
document based upon the `value` passed to the `edition` key.

Dual-License LPPL and MIT. Whichever floats your boat.

This package is still in development.


Supplemental Packages
---------------------

This package requires the
[Space Mono](https://fonts.google.com/specimen/Space+Mono) package to be
installed where LaTeX can find and load it.

This package needs the 
[MathTime Professional 2](https://www.pctex.com/mtpro2.html) fonts installed in
order for the `edition=reduced` option to be fully functional. The free "Lite"
version is sufficient.

After installing any new LaTeX packages, remember to run `texhash` and after
installing new fonts, remember to run `updmap-sys --enable Map=whatever.map`
where `whatever.map` is the map file for the new font package.

For Space Mono:

    updmap-sys --enable Map=spacemono.map

For MathTime Pro 2:

    updmap-sys --enable Map=mtpro2.map


Package Options
---------------

The package currently has five options, three of them are binary options and two
of them are `key=value` options. They are described below.

### The `edition` Option

When not specified or when specified to a value it does not understand, this is
set to `canonical`.

The values associated with this option:

`edition=canonical`  
&nbsp;&nbsp;&nbsp;&nbsp; The default option. Results in loading the `newtxtext`
package that loads TeX Gyre Termes as the body font and TeX Gyre Heros as the
heading font and Space Mono as the Typewriter font.

`edition=printshop`  
&nbsp;&nbsp;&nbsp;&nbsp; Identical to `edition=canonical` as far as the code
within this package is concerned.

`edition=grayscale`  
&nbsp;&nbsp;&nbsp;&nbsp; Identical to `edition=canonical` __except__ that it
sets the `\ampcolor{}` command to `no` and from the `soul` packages, changes the
`\hl` command to be identical to the `\ul` command. This is done so that the
document can be quality printed grayscale.

`edition=reduced`  
&nbsp;&nbsp;&nbsp;&nbsp; Uses Times instead of TeX Gyre Termes, Helvetica
instead of TeX Gyre Heros, and Courier instead of Space Mono. The purpose of
this is so that those three font families do not have to be embedded (every PDF
viewer has metric compatible equivalents) reducing the file size. Please note
that LaTeX will still embed Times, Helvetica, and Courier by default. Please
read the file [reduced.md](reduced.md)

`edition=sans`  
&nbsp;&nbsp;&nbsp;&nbsp;  Uses Intel Clear Sans instead of TeX Gyre Termes and
TeX Gyre Heros. Also sets the justification to Ragged-Right instead of justified
and redefines the `\emph` command to use bold text instead of italicized. This
is done to assist those with reading disabilities that are often triggered by a
serif font, justified text, and italicized text. This option also change the
`\ampcolor` command to `no` and from the `soul` packages, changes the `\hl`
command to be identical to the `\ul` command. This is done so that the document
can be quality printed grayscale.

### The `greek` option

This is a hybrid binary/string option. When not specified or when specified as
`greek=no` then an LGR encoded Greek font is not set up for use.

When specified without a value as `greek` or when specifying `greek=txr` then
the `txr` Greek font (a good match for Times/TeX Gyre Termes) is specified as
the LGR encoded Greek font to use.

When specifies as `greek=whatever` where the file `lgrwhatever.fd` is known to
the LaTeX system (e.g. `lgrartemisia.fd` or `lgrgentium.fd`) then `whatever` is
specified as the LGR encoded Greek font to use. If `lgrwhatever.fd` is not known
to your LaTeX system, then it uses the default `txr` font.

You can then typeset Greek text via the `\textgreek{}` command. For example
`\textgreek{Ellhnik'a alf'abhto}` produces: Ελληνικά αλφάβητο

See (http://tug.ctan.org/language/greek/greek-fontenc/lgrenc.def.html) if you
need assistance in figuring our Latin keyboard to LGR encoding.

### The `math` option

This is a binary option, a value is not necessary. When not present then math
fonts are not loaded.

The following math packages are loaded as a result of this option:

* `amssymb` (math symbols, such as Fraktur symbols)
* `bm` (additional bold math symbols)

For all `edition` options *except* for `edition=reduced`

* `newtxmath` (math functions and symbols that work with `newtxtext`

For `edition=reduced`

* `amsmath` (math functions and symbols)
* `mtpro2` (Lite version, math symbols and functions)

### The `tipa` option

This is a binary option, a value is not necessary. When not present then the
`tipa` package is not loaded.

The `tipa` package is needed to typeset IPA pronunciations. At this time, this
package only supports using the IPA fonts that come as part of the `tipa`
package.

To type something in IPA just use `\textipa{}` using the appropriate markup. For
example `\textipa{/oU"mEg@/}` produces: /oʊˈmɛɡə/

See the `tipa` documentation at (https://ctan.org/pkg/tipa)

### The `isbn` option

This is a binary option. It is turned off when not used and turned on when it is
used.

This option causes the `ampean13isbn` package to load.


Package Macro Definitions and Commands
--------------------------------------

The following public commands are defined:

`\ampedition{}`  
&nbsp;&nbsp;&nbsp;&nbsp; No arguments. Produces a text string that will be one
of `canonical`, `printshop`, `grayscale`, `reduced`, or `sans` depending upon
the option passed to the package with the `edition` key.

`\ampcolor{}`  
&nbsp;&nbsp;&nbsp;&nbsp; No arguments. Produces a text string `yes` *unless* the
argument `edition=grayscale` or `edition=sans` was passed as a package option.

`\textgreek[1]{}`  
&nbsp;&nbsp;&nbsp;&nbsp; One argument. Only available when a Greek font has been
made available. The argument is the text to be typeset using the LGR encoding.

`\setttsize{\small}`  
&nbsp;&nbsp;&nbsp;&nbsp; Reduces the size of the monospace font, which I find to
be a little too big compared to the Serif font.

Other commands are made available as a result of loaded packages.


Package Redefined Commands
--------------------------

When either the the option `edition=grayscale` or `edition=sans` is passed to
the package, the `\hl{}` command from the `soul` package is redefined to be an
alias for the `\ul{}` command from the `soul` package.


Packages Loaded by `anymouse.sty`
---------------------------------

The following packages are loaded by `anymouse.sty`:

### `\RequirePackage{iftex}`

Needed to determine the LaTeX engine being used.

### `\RequirePackage[utf8]{inputenc}`

Only loaded when pdfLaTeX is the engine being used.

I *believe* `utf8` is the default input encoding for modern LaTeX distributions
but that wasn't always the case. Specifically setting it here makes sure it is
set to `utf8`.

### `\RequirePackage{fontspec}`

Only loaded when LuaLaTeX is the engine being used *and* the `edition` option is
not set to `reduced` (where using fontspec doesn't make sense)

### `\RequirePackage[*stuff*]{fontenc}`

If the `tipa` option is passed to `anymouse.sty` then the `T3` encoding is
passed to `fontenc`.

Ig the `greek` option is passed to `anymouse.sty` then the `LGR` encodinding is
passed to `fontenc`.

There is some public confusion about `fontenc` and `fontspec` having collisions.
They do not. In fact `fontspec` *uses* `fontenc`.

The issue is that when using `fontspec` you generally should not call `fontenc`
after `fontspec` or the last encoding passed to `fontenc` might not be the `TU`
encoding that `fontspec` needs as the last encoding passed to `fonenc`.

This package is careful to avoid that issue.

### `\RequirePackage{kvoptions}`

This package is needed by `anymouse.sty` for processing of the `key=value`
package options.

### `\RequirePackage{ifthen}`

Provides "if then else" facilities. For usage, see the documentation at
(https://ctan.org/pkg/ifthen)

### `\RequirePackage{siunitx}`

Loaded by `anymouse.sty` but not specifically used by `anymouse.sty`. It is used
by `ampmisc.sty`.

Provides facilities for using standardized scientific units. For usage, see the
documentation at (https://ctan.org/pkg/siunitx)

### `\RequirePackage{letltxmacro}`

Used to allow reducing the monospace font size. This might go away.

### `\RequirePackage[table,usenames,dvipsnames]{xcolor}`

Loaded by `anymouse.sty` but not specifically used by `anymouse.sty`.

It is used for very colorful things. For usage, see the documentation at
(https://ctan.org/pkg/xcolor)

### `\RequirePackage{soul}`

Provides several useful commands for emphasizing text.

Note that when `edition=grayscale` or `edition=sans` that the `anymouse.sty`
will redefine the highlight command `\hl{}` to the underline command `\ul{}` so
that color is not used in those edition types.

However if the `\setulcolor{}` command has been used in your document then color
will be used, so if you do set the underline color, you should wrap that in a
conditional:

    \ifthenelse{\equal{\ampcolor}{yes}}{
      \setulcolor{whatever}
    }{}

For usage, see the documentation at (https://ctan.org/pkg/soul)

### `\RequirePackage{afterpage}`

Loaded by `anymouse.sty` but not specifically used by `anymouse.sty`.

This package is very useful for intelligent placement of floats, amongst other
things. For usage, see the documentation at (https://www.ctan.org/pkg/afterpage)

### `\RequirePackage{ampean13isbn}`

__NOT IN CTAN/TeXLive__

Only loaded by `anymouse.sty` if the `isbn` option is passed to `anymouse.sty`.
Not specifically used by `anymouse.sty`.

This file is provided within this project. It is a modified version of
`ean13isbn` that has been modified to use TeX Gyre Condensed in a T1 encoding
instead of Helvetica Condensed in an OT1 encoding.

It is used for genrating ISBN barcodes. For usage, see the `ean13isbn`
documentation at (https://ctan.org/pkg/ean13isbn)

### `\RequirePackage{amssymb}`

Only loaded if the `math` option is passed to `anymouse.sty`. Not specifically
used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/amsfonts)

### `\RequirePackage{amsmath}`

Only loaded if the `math` option is passed to `anymouse.sty`. Not specifically
used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/amsmath)

### `\RequirePackage{bm}`

Only loaded if the `math` option is passed to `anymouse.sty`. Not specifically
used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/bm)

### `\RequirePackage{unicode-math}`

Only loaded with the LuaLaTeX engine if the `math` option is passed to
`anymouse.sty` and the `edition=reduced` option is __not__ passed to
`anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/unicode-math)

### `\RequirePackage[lite]{mtpro2}`

__NOT IN CTAN/TeXLive__

Only loaded if the `math` option and the `edition=reduced` option is passed to
`anymouse.sty`. Not specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://www.pctex.com/mtpro2.html)

### `\RequirePackage{newtxmath}`

Only loaded with the pdfLaTeX engine if the `math` option is passed to
`anymouse.sty` and if the `edition=reduced` option is __NOT__ passed to
`anymouse.sty`. Not specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/newtx)

### `\RequirePackage{newtxtext}`

Only loaded with the pdfLaTeX engine and if the `edition=reduced` option is
__NOT__ passed to `anymouse.sty`. Not specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/newtx)

### `\RequirePackage{spacemono}`

__NOT IN CTAN/TeXLive__

Only loaded if the `edition=reduced` option is __NOT__ passed to `anymouse.sty`.
Not specifically used by `anymouse.sty`.

For full usage, see the documentation at
(https://github.com/AnymouseProphet/SpaceMono-LaTeX)

### `\RequirePackage[sfdefault]{ClearSans}`

Only loaded with the pdfLaTeX engine and if the `edition=sans` option is passed
to `anymouse.sty`. Not specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://www.ctan.org/pkg/clearsans)

However be warned that the plan is to not include this package in the future but
to instead load the needed fonts for pdfLaTeX directly.

### `\RequirePackage{ragged2e}`

Only loaded if the `edition=sans` option is passed to `anymouse.sty`. Not
specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://www.ctan.org/pkg/ragged2e)

### `\RequirePackage{substitutefont}`

Only loaded if the `tipa` and or `greek` options are passed to `anymouse.sty`.

This package is used to tell the LaTeX font engine where to get the fonts needed
to render content in the `T3` and `LGR` encoding used for typesetting IPA and
non-mathematical Greek.

### `\RequirePackage[noenc]{tipa}`

Only loaded if the `tipa` option is passed to `anymouse.sty`. Not specifically
used by `anymouse.sty`.

This is the package that provides the `\textipa{}` command. For full usage, see
the documentation at (https://www.ctan.org/pkg/tipa)


