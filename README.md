anymouse LaTeX 
==============

This is a LaTeX package that sets the fonts and some other macros used by the
Anymouse Prophet in his political ramblings.

Dual-License LPPL and MIT. Whichever floats your boat.

Install the files within `texmf-tree` into your TEXMF-LOCAL directory using the
same structure and then run the `texhash` command so that your LaTeX system
knows about them.

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

The package currently has four key=value options, described below.

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
&nbsp;&nbsp;&nbsp;&nbsp; Identical to `edition=canonical` __except__ that it sets
the `\ampcolor` command to `no` and from the `soul` packages, changes the `\hl`
command to be identical to the `\ul` command. This is done so that the document
can be quality printed grayscale.

`edition=reduced`  
&nbsp;&nbsp;&nbsp;&nbsp; Uses Times instead of TeX Gyre Termes, Helvetica
instead of TeX Gyre Heros, and Courier instead of Space Mono. The purpose of
this is so that those three font families do not have to be embedded (every PDF
viewer has metric compatible equivalents) reducing the file size.

`edition=sans`  
&nbsp;&nbsp;&nbsp;&nbsp;  Uses Intel Clear Sans instead of TeX Gyre Termes and
TeX Gyre Heros. Also sets the justification to Ragged-Right instead of justified
and redefines the `\emph` command to use bold text instead of italicized. This
is done to assist those with reading disabilities that are often triggered by a
serif font, justified text, and italicized text. This option also change the
`\ampcolor` command to `no` and from the `soul` packages, changes the `\hl`
command to be identical to the `\ul` command. This is done so that the document
can be quality printed grayscale.

### The `math` option

This is a binary option. When not specified or when specified as `math=no` then
math fonts are not loaded. When specified as `math` without a value or when
specified as `math=whatever` where `wherever` is anything other than no, then
math packages and fonts are loaded.

The following math packages are loaded as a result of this option:

* `amssymb` (math symbols, such as Fraktur symbols)
* `bm` (additional bold math symbols)

For all `edition` options *except* for `edition=reduced`

* `newtxmath` (math functions and symbols that work with `newtxtext`

For `edition=reduced`

* `amsmath` (math functions and symbols)
* `mtpro2` (Lite version, math symbols and functions)

### The `tipa` option

This is a binary option. When not specified or when specified as `tipa=no` then
the `tipa` package is not loaded. When specified as `tipa` without a value or
when specified as `tipa=whatever` where `wherever` is anything other than no,
then the `tipa` package is loaded.

The `tipa` package is needed to typeset IPA pronunciations. At this time, this
package only supports using the IPA fonts that come as part of the `tipa`
package.

To type something in IPA just use `\textipa{}` using the appropriate markup. For
example `\textipa{/oU"mEg@/}` produces: /oʊˈmɛɡə/

See the `tipa` documentation at (https://ctan.org/pkg/tipa)

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

When the option `edition=sans` is passed to the package, the standard `\emph{}`
command is redefined to typeset bold text instead of italicized text.

When either the the option `edition=grayscale` or `edition=sans` is passed to
the package, the `\hl{}` command from the `soul` package is redefined to be an
alias for the `\ul{}` command from the `soul` package.

Packages Loaded by `anymouse.sty`
---------------------------------

The following packages are loaded by `anymouse.sty`:

### `\RequirePackage[utf8]{inputenc}`

I *believe* `utf8` is the default input encoding for modern LaTeX distributions
but that wasn't always the case. Specifically setting it here makes sure it is
set to `utf8`.

I set it here so it does not need to be set in the preamble. That way if and
when this package is ported to support LuaLaTeX and/or XeLaTeX font handling,
as those compiler *I believe* do not use `inputenc`, documents that use this
package will work regardless of which compiler is used without needing to worry
about the differences.

### `\RequirePackage{keyval}`

This package is needed by `anymouse.sty` for processing of the `key=value`
package options.

### `\RequirePackage{ampean13isbn}`

__NOT IN CTAN/TeXLive__

Loaded by `anymouse.sty` but not specifically used by `anymouse.sty`.

This is provided within this project. It is a version of `ean13isbn` that has
been modified to use TeX Gyre Condensed in a T1 encoding instead of Helvetica
Condensed in an OT1 encoding.

It is used for genrating ISBN barcodes. For usage, see the documentation at
(https://ctan.org/pkg/ean13isbn)

### `\RequirePackage{ifthen}`

Provides "if then else" facilities. For usage, see the documentation at
(https://ctan.org/pkg/ifthen)

### `\RequirePackage{siunitx}`

Loaded by `anymouse.sty` but not specifically used by `anymouse.sty`. It is used
by `ampmisc.sty`.

Provides facilities for using standardized scientific units. For usage, see the
documentation at (https://ctan.org/pkg/siunitx)

### `\RequirePackage{letltxmacro}`

Used to allow reducing the monospace font size.

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

### `\RequirePackage{amssymb}`

Only loaded if the `math` option is passed to `anymouse.sty`. Not specifically
used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/amsfonts)

### `\RequirePackage{bm}`

Only loaded if the `math` option is passed to `anymouse.sty`. Not specifically
used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/bm)

### `\RequirePackage{amsmath}`

Only loaded if the `math` option and the `edition=reduced` option is passed to
`anymouse.sty`. Not specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/amsmath)

### `\RequirePackage[lite]{mtpro2}`

__NOT IN CTAN/TeXLive__

Only loaded if the `math` option and the `edition=reduced` option is passed to
`anymouse.sty`. Not specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://www.pctex.com/mtpro2.html)

### `\RequirePackage{newtxmath}`

Only loaded if the `math` option is passed to `anymouse.sty` but the
`edition=reduced` option is __NOT__ passed to `anymouse.sty`. Not specifically
used by `anymouse.sty`.

This package provides function equivalence to `amsmath` and `mtpro2`.

For full usage, see the documentation at (https://ctan.org/pkg/newtx)

### `\RequirePackage{newtxtext}`

Only loaded if the `edition=reduced` option is __NOT__ passed to `anymouse.sty`.
Not specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://ctan.org/pkg/newtx)

### `\RequirePackage{spacemono}`

__NOT IN CTAN/TeXLive__

Only loaded if the `edition=reduced` option is __NOT__ passed to `anymouse.sty`.
Not specifically used by `anymouse.sty`.

For full usage, see the documentation at
(https://github.com/AnymouseProphet/SpaceMono-LaTeX)

### `\RequirePackage[sfdefault]{ClearSans}`

Only loaded if the `edition=sans` option is passed to `anymouse.sty`. Not
specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://www.ctan.org/pkg/clearsans)

### `\RequirePackage{ragged2e}`

Only loaded if the `edition=sans` option is passed to `anymouse.sty`. Not
specifically used by `anymouse.sty`.

For full usage, see the documentation at (https://www.ctan.org/pkg/ragged2e)

### `\RequirePackage[*T1]{fontenc}`

If the `tipa` option is passed to `anymouse.sty` then the `T3` encoding is
passed to `fontenc`.

Ig the `greek` option is passed to `anymouse.sty` then the `LGR` encodinding is
passed to `fontenc`.

The `T1` encoding is *always* passed to `anymouse.sty` and as the last option.

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


TODO -- finish

BELOW is old.



### Chancery Script Font

The `\ampscriptfont` command expands to select the Chancery font from the Main
Document Fonts collection. The intended use is within a
`\begin{quote}...\end{quote}` environment when quoting a document of historical
and cultural significance, such as a snippet from the Declaration of
Independence.

Be careful with its usage. A fancy chancery font can inspire an emotion of
reverence and is therefore a very useful typesetting tool, but chancery fonts
can also be very difficult for some people to read---especially those with
visual disabilities. Use it sparingly and only with text that most people with a
high school education will be somewhat familiar with.

#### Example Usage

    \begin{quote}
    {\ampscriptfont%
    Fourscore and seven years ago our fathers brought forth on this continent a
    new nation, conceived in liberty, and dedicated to the proposition that all
    men are created equal. Now we are engaged in a great civil war, testing
    whether that nation, or any nation so conceived and so dedicated, can long
    endure.} 
    \end{quote}

### Condensed Font

The `\ampcondensedfont` command expands to select the Narrow or Condensed font
from the Main Document Fonts collection. The intended use is wherever such a
font is needed.

#### Example Usage

    {\ampcondensedfont This sentence \emph{will be} condensed.}

### Bibliography in Footer

What the Anymouse Prophet publishes should not be considered academic works and
most of what I reference are web pages archived at archive.org. For that reason
I do not use an actual "Works Cited" in most of my ramblings but use a footnote
as a hyperlink.

The few times I do reference a book, I reference it as a footnote using the
`\footbib{}` command which takes six arguments:

1. Title
2. Author
3. Page(s) Referenced
4. Publication year
5. Publisher
6. ISBN

The `\footbib{}` macro then formats it for the footnate of the page.

#### Example Usage

    \footbib{From Christ to Confucius}{Albert Monshan Wu}{page 261}{2016}{Yale University Press}{978-0-300-21707-0}

### Hyperlink Reference

The `footurl{}` macro command gives a hyperlink URL reference as a footnote.

#### Example Usage

    \footurl{https://bit.ly/33MUNCY}

### Inline Hyperlink

When using an inline hyperlink, it is important to also make a footnote with
the hyperlink for those reading a printed copy.

The `amphref{}` macro command does this and like the standard `href{}` command
it takes two arguments: The hyperlink, and the text.

#### Example Usage

    The \amphref{https://www.tug.org/texlive/}{TeXLive} distribution of LaTeX
    runs on just about every operating system currently in use.

### Roman Numerals

The `amprom{}` macro command turns a Hindu-Arabic numberal into a Roman Numeral.
It takes a single argument. I sometimes mess up when making Roman Numerals
manually so this macro helps me get it right.

#### Example Usage

    Super Bowl \amprom{56} will be played on Sunday, February 13.

### Money

The `\usmoney{}` macro adds the dollar sign and the commas in the right places.
It takes a single argument.

#### Example Usage

    Some people make \usmoney{900} a week, some people \usmoney{1200} a week,
    and some people make \usmoney{12000} a week.

In that example, in addition to adding the dollar sign, a comma separator would
automatically be added to the last one making it typeset as `$12,000` but it
would not be added to the first two where typography rules say no separator is
needed (including `1200`).


SIUnit Declarations
-------------------

For consistency across documents I like to use the
[siunitx](https://ctan.org/pkg/siunitx) LaTeX package. Whenever I come across a
unit that is not already defined by that package, I will define it at the end
of the `anymouse.sty` file so that usage remains consistent.


Coronavirus Lineages
--------------------

For consistency across documents several commands for specifying coronavirus
lineages have been defined.
