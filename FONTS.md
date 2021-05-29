Stuff About Fonts
=================

Back in the early days of PostScript, portable storage space was at a premium
and network bandwidth was at a premium. Documents often specified what fonts
they used but did not actually embed the font---the renderer had to have the
right font available or the document could not properly render.

To address this, when Adobe first created the PostScript specification, they
specified 13 base PostScript fonts:

* Courier (Regular, Oblique, Bold, Bold Oblique)
* Helvetica (Regular, Oblique, Bold, Bold Oblique)
* Times (Roman, Italic, Bold, Bold Italic)
* Symbol

Any PostScript compliant renderer could properly render those fonts without them
embedded in the PostScript document and without them needing to be supplied
separately.

With the success of PostScript, PostScript Level 2 was released and PostScript
level 2 had an expanded set of 35 fonts that every PostScript Level 2 compliant
renderer had to support without the font embedded:

* Courier (Regular, Oblique, Bold, Bold Oblique)
* Helvetica (Regular, Oblique, Bold, Bold Oblique)
* Helvetica Narrow (Regular, Oblique, Bold, Bold Oblique)
* Times (Roman, Italic, Bold, Bold Italic)
* ITC Avant Garde Gothic (Book, Book Oblique, Demi, Demi Oblique)
* ITC Bookman (Light, Light Italic, Demi, Demi Italic)
* New Century Schoolbook (Roman, Italic, Bold, Bold Italic)
* Palatino (Roman, Italic, Bold, Bold Italic)
* Symbol
* ITC Zapf Chancery (Medium Italic)
* ITC Zapf Dingbats

Those are what are often referred to as the "Base 35" PostScript fonts. It is
a superset of the original PostScript "Base 13" fonts.

PostScript Level 2 was very popular but licensing 35 commercial fonts to have
PostScript Level 2 compliance could be very expensive and was also problematic
to the free software world.

This resulted in URW developing fully metric compatible clones of the "Base 35"
fonts:

* Nimbus Mono L (Regular, Oblique, Bold, Bold Oblique)
* Nimbus Sans L (Regular, Oblique, Bold, Bold Oblique)
* Nimbus Sans L Narrow (Regular, Oblique, Bold, Bold Oblique)
* Nimbus Roman No9 L (Roman, Italic, Bold, Bold Italic)
* URW Gothic L Book (Book, Book Oblique, Demi, Demi Oblique)
* URW Bookman (Light, Light Italic, Demi, Demi Italic)
* Century Schoolbook (Roman, Italic, Bold, Bold Italic)
* URW Palladio L (Roman, Italic, Bold, Bold Italic)
* Standard Symbols L
* URW Chancery L Medium Italic
* Dingbats

A font expert can distinguish the URW "Base 35" glyphs from the genuine Adobe
"Base 35" glyphs but the font metrics are identical allowing the URW fonts to
be used when a PostScript (or PDF) document uses the Adobe Base 35 fonts but
does not have them embedded.

The URW "Base 35" fonts saw the biggest distribution on UNIX and GNU systems
(like the various BSD and Linux distributions) through the
[ghostscript](https://www.ghostscript.com/) PostScript interpreter which is
widely distributed as a core part of those operating systems.

Historically some commercial LaTeX distributions shipped with the genuine Adobe
"Base 35" fonts and maybe some still do, but the vast majority of modern LaTeX
distributions ship with the URW "Base 35" fonts.

If you have the genuine Adobe "Base 35" fonts you can configure LaTeX to use
them instead of the URW variants. I bought my set I think in 2002 as part of a
bundle Adobe was selling to typography students, but I do not believe Adobe
continues to license them to the general public. They might, but I have not seen
them offered in a long time, Type 1 PostScript fonts are on their way out as the
OpenType font specification solves a lot of problems.

PDF Fonts
---------

Although also developed by Adobe, PDF is different than PostScript and PDF
specifies a set of 14 "Standard Fonts":

* Courier (Regular, Oblique, Bold, Bold Oblique)
* Helvetica (Regular, Oblique, Bold, Bold Oblique)
* Times (Roman, Italic, Bold, Bold Italic)
* Symbol
* ITC Zapf Dingbats

These "Standard Fonts" are identical to the original PostScript "Base 13" with
the addition of ITC Zapf Dingbats and thus the 14 "Standard Fonts" are a subset
of the PostScript Level 2 "Base 35" fonts.

Furthermore, while PDF viewers on UNIX and GNU systems usually have the full set
of URW "Base 35" fonts available to them thanks to the `ghostscript` engine they
use, PDF viewers on Windows systems often do not. This can cause a PDF that does
not embed the "Base 35" fonts it uses (say, Helvetica Narrow or Palatino) to not
render properly on a Windows system.

Even worse, on a Windows system even Adobe Acrobat will often make horrible
substitutions for the "Standard Fonts" such as using "Times New Roman" in place
of "Times" or "Arial" in place of "Helvetica". The metrics are similar but the
glyphs can be quite different.

For this reason, it really is best now to embed every single font used in a PDF
document---even the PostScript "Base 13" and the PDF "Standard 14" fonts. This
is what modern LaTeX distributions now do by default.

The original need to use standard sets so that fonts would not need to be
embedded is no longer an issue, and the issue created by PDF renderers only
having a subset of the "Base 35" and often using horrible substitutions for the
"Standard 14" that they do have means that embedding every font used is now the
right way to do desktop publishing.


TeX Gyre Fonts
--------------

As LaTeX now embeds the "Base 35" (and all other) fonts by default anyway, this
has freed up typography designers to extend the free URW "Base 35" fonts to
add characters and even change the metrics to some degree.

This has resulted in a new family of fonts called the "TeX Gyre" fonts that are
very similar to the "Base 35" fonts but are not fully metric compatible.

It is my *suspicion* that the TeX Gyre fonts are the future of LaTeX and will
replace the Computer Modern variants (like Latin Modern) that are often used by
default in current LaTeX authoring tools.

I do not know how well the excellent MathTime Pro 2 fonts work in combination
with the TeX Gyre fonts, but TeX Gyre developers have been busy developing there
own math fonts that are getting to be quite good and certainly are sufficient
for the vast majority of math needs.

The MathTime Pro 2 fonts may work just fine with TeX Gyre, but if not, I suspect
that PCTeX will adjust them so they do.

For the time being, I personally still use the "Base 35" Type 1 fonts when math
is a need (and Intel Clear Sans when math is not a need) but I suspect in a few
years that will change.

The TeX Gyre font mapping to "Base 35" fonts:

* TeX Gyre Cursor *[Courier]*
* TeX Gyre Heros *[Helvetica]*
* TeX Gyre Heros Condensed *[Helvetica Narrow]*
* TeX Gyre Termes *[Times]*
* TeX Gyre Adventor *[ITC Avant Garde]*
* TeX Gyre Bonum *[ITC Bookman]*
* TeX Gyre Schola *[New Century Schoolbook]*
* TeX Gyre Pagella *[Palatino]*
* TeX Gyre Chancery *[ITC Chancery]*

It appears that at this time, the TeX Gyre collection does not have equivalents
for Symbol or ITC Zapf Dingbats. Many of the unicode codepoints covered by
glyphs in those two fonts are however covered in the TeX Gyre fonts themselves
(such as Greek) or in the TeX Gyre math fonts.

It is important to note that while very similar, TeX Gyre fonts are not metric
compatible with the "Base 35" fonts. They are extensions and improvements upon
those fonts *without* the restraint of needing to keep metric compatibility.
