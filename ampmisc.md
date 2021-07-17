The `ampmisc.sty` Package
=========================

This package is complimentary to the `anymouse.sty` package. It provides some
additional macro commands useful when authoring political ramblings and
textbooks.

This package has one option that can be invoked two different ways. What the
option does is reduces (not eliminates) the use of italicized text in the output
of the commands.

Dual-License LPPL and MIT. Whichever floats your boat.

Reduced Italics Method One: Automated
-------------------------------------

If you load this package *at the same time* as `anymouse.sty` then it will
automatically reduce the italics depending up the arguments passed for the
`anymouse.sty` package:

    \usepackage[options]{anymouse,ampmisc}

In that usage case, reduced italics are activated when the `edition=sans` option
is passed as an argument. Any other `edition=value` or `edition` without a value
or lack of an `edition` argument and italics are not reduced.

Reduced Italics Method Two: Manual
----------------------------------

If you load this package *separately* from `anymouse.sty` you can still get
reduced italics by passing the argument `reditalics` to this package:

    \usepackage[reditalics]{ampmisc}

In that usage case, you turn reduced italics on or off based upon whether or not
that argument is passed at package load time.


Commands Defined by `ampmisc.sty`
---------------------------------

These are the additional macro commands made available by this package:

### Modified `\emph{}` Command

When the Reduced Italics option is active, the standard `\emph{}` command is
modified to produce bold text instead of italicized text.

### Definition Marker Commands

Sometimes a term is defined within a paragraph. In such cases it is useful to
indicate such with typography. The commands `\textdef{}' and `\textmdef{}' are
defined for this purpose.

`\textdef{}` will apply both bold and italics to the term and is intended for
when the definition of the term is the primary purpose of the paragraph. When
the Reduced Italics option has been specified, `\textdef{}' will only apply bold
to the term.

`\textmdef{}` will apply italics to the term and is intended for when the
definition of the term is auxillary to the paragraph or has recently been
defined in a previous paragraph. when the Reduced Italics option has been
specified, `\textmdef{}' will not apply italics but instead will put the term
inside curly single quotes.

#### Example Usage

    \textdef{Euclidean Division} is the process of dividing one integer called
    the \textmdef{dividend} by another integer called the \textmdef{divisor}
    such that the answer is expressed as one integer called the
    \textmdef{quotient} and a possible second integer called the
    \textmdef{remainder}.

The main purpose of that paragraph is to define Euclidean Geometry, so that term
is marked up with the `\textdef{}` macro.

The other four terms are defined in the same paragraph but are auxillary so they
are marked up with the `\textmdef{}` macro.


### Chancery Script Font

The `\ampscriptfont{}` command expands to select the Chancery font from the Main
Document Fonts collection. The intended use is within a
`\begin{quote}...\end{quote}` environment when quoting a document of historical
and cultural significance, such as a snippet from the Declaration of
Independence.

The font defined is "TeX Gyre Chorus" which is very similar to (by design) the
fonts URW Chancery L Medium Italic and ITC Zapf Chancery Medium Italic.

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

The `\ampcondensedfont{}` command expands to select the TeX Gyre Heros Condensed
font. It takes no arguments.

The intended use is wherever such a condensed font is needed.

#### Example Usage

    {\ampcondensedfont This sentence \emph{will be} condensed.}

### Bibliography in Footer

When publishing political ramblings, a proper "Works Cited" appendix section is
sometimes overkill.

The `\footbib{}` command allows for citing a printed work within the footnote of
the page in which it occurs.

The `\footbib{}` command which takes six arguments:

1. Title
2. Author
3. Page(s) Referenced
4. Publication year
5. Publisher
6. ISBN

The `\footbib{}` macro then formats it in the footnote of the page.

Unless the Reduced Italics option has been specified, the title will be
italicized. If the Reduced Italics option has been specified, the title will be
put inside double curly-quotes.

#### Example Usage

    \footbib{From Christ to Confucius}{Albert Monshan Wu}{page 261}{2016}{Yale University Press}{978-0-300-21707-0}

### Hyperlink Reference

The `footurl{}` macro command gives a hyperlink URL reference as a footnote.

#### Example Usage

    \footurl{https://bit.ly/33MUNCY}

### Inline Hyperlink

When using an inline hyperlink, it is important to also make a footnote with
the hyperlink for those reading a printed copy.

The `\amphref{}` macro command does this and like the standard `href{}` command
it takes two arguments: The hyperlink, and the text.

#### Example Usage

    The \amphref{https://www.tug.org/texlive/}{\TeX{}Live} distribution of LaTeX
    runs on just about every operating system currently in use.

### Roman Numerals

The `\amprom{}` macro command turns a Hindu-Arabic numberal into a Roman
Numeral. It takes a single argument. I sometimes mess up when making Roman
Numerals manually so this macro helps me get it right.

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
