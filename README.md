anymouse LaTeX 
==============

This is a LaTeX package that sets the fonts and some other macros used by the
Anymouse Prophet in his political ramblings.

Dual-License LPPL and MIT. Whichever floats your boat.

Install the files within `texmf-tree` into your TEXMF-LOCAL directory using the
same structure and then run the `texhash` command so that your LaTeX system
knows about them.

This package is still in development.




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

### `\RequirePackage{kvoptions}`

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






Coronavirus Lineages
--------------------

For consistency across documents several commands for specifying coronavirus
lineages have been defined.
