anymouse LaTeX 
==============

This is a LaTeX package that sets the fonts and some other macros used by the
Anymouse Prophet in his political ramblings.

Dual-License LPPL and MIT. Whichever floats your boat.

Install the files within `texmf-tree` into your TEXMF-LOCAL directory using the
same structure and then run the `texhash` command so that your LaTeX system
knows about them.

This package will grow over time.


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
package is not available, it will use Courier (or Nimbus Mono L) if the Main
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

### Options Summary

When no options are selected, `anymouse.sty` defaults to using the so-called
"Base35" fonts (URW clones unless you have the genuine Adobe versions *and*
have set up LaTeX to use them) *unless* MathTime Pro 2 is not available, in
which case it then uses the TeX Gyre fonts.

When no options are selected, `anymouse.sty` defaults to using the Space Mono
font for monospace *unless* Space Mono is not available, in which case it will
use the monospace font either from the "Base35" fonts or the TeX Gyre fonts.

When no options are selected, `anymouse.sty` will set the `\canonicalversion`
macro to `no`.

When the `texgyre` option is specified to `anymouse.sty` then the TeX Gyre fonts
will be used as the main fonts regardless of whether or not MathTime Pro is
available.

When the `courier` option is specified to `anymouse.sty` the monospace font from
either the "Base35" collection or from the TeX Gyre fonts will be used
regardless of whether or not Space Mono is available.

When the `canonical` option is specified to `anymouse.sty` then the
`\canonicalversion` macro is set to `yes`. Otherwise it is set to `no`.


Usage Example
-------------

    \documentclass[twoside, letterpaper, fontsize=14pt]{scrartcl}
    \usepackage[T1]{fontenc}
    \usepackage[utf8]{inputenc}
    \usepackage[texgyre,canonical]{anymouse}
    % rest of preamble


Package Macro Commands
----------------------

These are the macro commands defined by `anymouse.sty` that are intended to be
available for use in the LaTeX document.

This section is not yet finished.

### Canonical Version

The `\canonicalversion` command will expand to either `yes` or `no`. This is
useful for telling the LaTeX compiler whether or not it should use colored
links, include the ISBN barcode, or include the cryptography signature form.

Note that `anymouse.sty` already loads the [soul](https://www.ctan.org/pkg/soul)
package and then when `\canonicalversion` is `yes` then the `\hl{}` command from
that package is redefined to the `\ul{}` command also from that package.

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

The `amprom{}` macro command turns an Arabic number into a Roman Numeral. It
takes a single argument. I sometimes mess up when making Roman Numerals
manually.

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

