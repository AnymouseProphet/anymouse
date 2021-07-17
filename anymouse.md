The `anymouse.sty` Package
==========================

This package sets up the fonts for `pdflatex` using a T1 encoding as the primary
text output encoding.

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
that LaTeX will still embed Times, Helvetica, and Courier by default.

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


