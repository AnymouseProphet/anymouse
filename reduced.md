Reduced File Size PDF
=====================

The idea behind the Reduced File Size PDF is that you have the "Canonical PDF"
version with high quality images and all fonts embedded for download by those
who have broadband, and a "Reduced File Size" PDF with lower quality images and
some of the fonts not embedded for those with less bandwidth.

Image Reduction
---------------

Vector images do not need to be reduced. Bitmap images that can be vectorized
should be vectorized regardless of bandwidth issues.

Bitmap images that can not be vectorized---such as photographs---can often be
radically reduced in file size simply reducing the resolution and/or image
quality settings.

A 300 dpi image is fine for "Canonical PDF" but for a "Reduced File Size" PDF it
should be reduced to about 144 dpi. Most computer monitors are either 72 dpi or
96 dpi so a 144 dpi image will remain relatively sharp even if the user is
viewing the PDF at 150% of normal size.

In addition to reducing the dpi of high resolution images, save them at a lower
quality. For the "Canonical PDF" it is appropriate to use a quality of 85% but
for the "Reduced File Size" PDF try an image quality of 70% and see if it still
looks good.

You can use something like the following code in your preamble to define edition
specific prefixes for cases that need a different resolution than Canonical:

    \newcommand{\imgpfx}{normal-}
    \ifthenelse{\equal{\ampedition}{reduced}} {
      \renewcommand{\imgpfx}{reduced-}
    }{}
    \ifthenelse{\equal{\ampedition}{printshop}} {
      \renewcommand{\imgpfx}{printshop-}
    }{}
    \ifthenelse{\equal{\ampcolor}{no}} {
      \renewcommand{\imgpfx}{grayscale-}
    }{}

Then you can store all your images in the same place with the various prefixes
that get prepended at document compile time so that the right images are used
depending upon the `edition` being compiled:

    \includegraphics{\imgpfx kittiecat.jpg}

with:

* `printshop-kittiecat.jpg` being 92% JPEG quality at 300dpi
* `normal-kittiecat.jpg` being 85% JPEG quality at 300dpi
* `grayscale-kittiecat.jpg` being 85% JPEG quality at 300dpi
* `reduced-kittiecat.jpg` being 70% JPEG quality at 144dpi

The actual scheme you use of course is up to you and which editions you are
actually going to produce.

Some will suggest using 96dpi or even 72dpi for reduced file size. It does
reduce the file size even more but it makes the bitmap images horrible to look
at when reading a PDF at 150% zoom as many of us do.

Off topic a bit but as far as the grayscale image, there are several different
algorithms for creating a grayscale image. The best one to use depends upon the
image itself, so for the best quality grayscale PDF it is good to play with the
different algorithms manually for each image rather than just scripting it with
[ImageMagick](https://imagemagick.org/index.php).

### Vector Image Note

LaTeX has numerous packages that allow the programming of vector images directly
within LaTeX.

I tend not to use them, although sometimes I do.

Usually I prefer to create the vector art as an EPS image and the convert the
EPS to a PDF image with ghostscript for inclusion with pdfLaTeX.

### Text Note

Whether bitmap or vector, it generally is better not to have text as part of the
image itself even though vector can embed a scalable font.

It is better to use the facility of LaTeX to typeset the text on top of the
image.


Font Reduction
--------------

Current best practices in PDF publishing is to embed all fonts. That wasn't
always the case.

Back in the days when Internet bandwidth was often extremely limited, best
practices was to use the "PDF Base 14" fonts and NOT embed them. The purpose of
this was to reduce the file size making it easier for people without broadband
to download the file.

These fourteen fonts are:

* Adobe Times (four standard faces)
* Adobe Helvetica (four standard faces)
* Adobe Courier (four standard faces)
* Adobe Symbol
* Zapf Dingbats

The PDF standard requires that a PDF renderer either have those fonts available
or metric compatible equivalents.

Open Source operating systems (like GNU/Linux and various BSD) will have high
quality replacements provided by URW++ as part of the
[Ghostscript](https://www.ghostscript.com/) package. It is very difficult to
visually distinguish the URW++ fonts from the Adobe fonts.

Commercial operating systems and commercial PDF renderers often will use Times
New Roman instead of Times, Arial instead of Helvetica, and Courier New instead
of Courier. It is easy to visually distinguish those replacements but they work.

In the modern era, purists who want the document to render exactly like it would
if the actual font was embedded have swayed opinion such that now the best
practice is to always embed all fonts---even the "PDF Base 14" fonts that will
at least render correctly even if the glyphs are visually different.

Unfortunately there are still many people within the United States of America
and even more people globally who do not have access to brodband. Creation of a
reduced file size PDF is a kindness to these users, a kindness that use to be a
best practice when those with money in big cities were in the same situation
those users are in now.

When the `edition=reduced` argument is passed to `anymouse.sty` it causes the
`anymouse.sty` to use the "PDF Base 14" fonts instead of the fonts normally used
in the production of a PDF.

LaTeX will still however embed them in the PDF file.

There is a way to prevent them from being embedded but it is sort-of broken. You
can run the command:

    updmap-sys --setoption pdftexDownloadBase14 false

That will cause `pdflatex` to not embed the "PDF Base 14" fonts.

Unfortunately, some packages that make use of hyperref will then fail. I believe
this is a LaTeX bug but I am not positive. Anyway it is better to leave that
option set to `true` and not change it.

So what can you do? Remove the fonts *after* compiling the PDF file but before
you digitally sign it. Unfortunately there is a hitch with that as well.

CTAN does not have license to distribute the original Adobe fonts, so they host
the URW++ replacements. This means that when you use `edition=reduced` with the
`anymouse.sty` file, unless you happen to have the actual Adobe fonts and have
configured LaTeX to use them, you get the URW++ fonts embedded.

If you then remove them from the PDF afterwards, a PDF viewer might not use the
right font to replace them because the font name is different.

The solution is to try to get a copy of the actual Adobe fonts. You will
actually need the Postscript Level 2 "Base 35" collection, not just the "PDF
Base 14" fonts.

I got mine towards the beginning of the century, they were distributed in a
bundled called "Adobe Type Basics". It wasn't long after I bought mine that
Adobe changed the product to include OpenType fonts instead of Postscript Type 1
fonts.

If you are able to find a packaged "Adobe Type Basics" at a used software store,
there is a good chance it will have the right files because the newer versions
of that product with OpenType fonts I believe was download only.

I know "Adobe Type Basics 65" has them because of a complaint on Amazon that the
fonts are in the 'older PostScript "Type 1" font format'---which is exactly what
you want for LaTeX.

Some commercial LaTeX distributions use to have the actual Adobe fonts. I am not
positive but I believe Y&Y TeX came with them. If you can find a used copy of
that product, there is a good chance you can find the fonts there.

I believe some commercial UN*X operating systems also came with them. Look for
commercial UNIX operating systems from the mid-late 90s. Which ones has it, that
I do not know.

They might be included in older versions of Adobe Acrobat (the full software,
not the reader) or Adobe Type Manager but I kind of doubt it.

It may take some hunting to find them but they are out there.

If you find them, the file names will *probably* look like this:

    [anymouse@localhost base35]$ ls
    agd_____.afm  bkli____.pfb  hvb_____.pfb  ncbi____.pfb  sy______.afm
    agdo____.afm  bkl_____.pfb  hvn_____.afm  ncb_____.pfb  sy______.pfb
    agdo____.pfb  cob_____.afm  hvnb____.afm  nci_____.afm  tib_____.afm
    agd_____.pfb  cobo____.afm  hvnbo___.afm  nci_____.pfb  tibi____.afm
    agw_____.afm  cobo____.pfb  hvnbo___.pfb  ncr_____.afm  tibi____.pfb
    agwo____.afm  cob_____.pfb  hvnb____.pfb  ncr_____.pfb  tib_____.pfb
    agwo____.pfb  com_____.afm  hvno____.afm  pob_____.afm  tii_____.afm
    agw_____.pfb  com_____.pfb  hvno____.pfb  pobi____.afm  tii_____.pfb
    bkd_____.afm  coo_____.afm  hvn_____.pfb  pobi____.pfb  tir_____.afm
    bkdi____.afm  coo_____.pfb  hvo_____.afm  pob_____.pfb  tir_____.pfb
    bkdi____.pfb  hv______.afm  hvo_____.pfb  poi_____.afm  zcmi____.afm
    bkd_____.pfb  hvb_____.afm  hv______.pfb  poi_____.pfb  zcmi____.pfb
    bkl_____.afm  hvbo____.afm  ncb_____.afm  por_____.afm  zd______.afm
    bkli____.afm  hvbo____.pfb  ncbi____.afm  por_____.pfb  zd______.pfb

They may be upper case instead of lower case. I'm not sure if LaTeX cares but
they are lower-case on my system and work, so if the ones you find are upper
case and do not work try changing the file names to lower case.

If you find them in an old commercial LaTeX distribution, they may use the Karl
Berry names instead of the Adobe names.

Once you have found them, put them in

    [TEXMF-LOCAL]/fonts/type1/adobe/base35/

You will likely have to create that directory.
Then if the filenames look like mine, run:

    texhash && updmap-sys --setoption LW35 ADOBE

On the other hand if they use the Karl Berry names, then run

    texhash && updmap-sys --setoption LW35 ADOBEkb

Your LaTeX install should then be properly set up to use the Adobe fonts and
when you pass the `edition=reduced` option to `anymouse.sty` the Adobe fonts
should be what gets embedded in the file:

    [anymouse@localhost unsigned]$ pdffonts AlgebraText-reduced.pdf 
    name                                 type              encoding         emb sub uni object ID
    ------------------------------------ ----------------- ---------------- --- --- --- ---------
    GUIFHN+Helvetica-Bold                Type 1            Custom           yes yes yes      9  0
    QURQCP+Times-Roman                   Type 1            Custom           yes yes yes     10  0
    XSHWOJ+Times-Italic                  Type 1            Custom           yes yes yes     19  0
    *snip*
    PAIHCM+Courier                       Type 1            Custom           yes yes yes     45  0
    CCRPBH+Times-Bold                    Type 1            Custom           yes yes yes     81  0
    *snip*
    MOSTMS+Times-BoldItalic              Type 1            Custom           yes yes yes    220  0
    *snip*

 and then once the PDF has
been produced, you can use Adobe Acrobat Reader DC to remove the Adobe fonts so
that they are no longer embedded.

Be very careful, once you have LaTeX set up to use the Adobe versions instead of
the URW++ versions of the fonts, the use of some LaTeX packages will result in
"Helvetica Narrow" family embedded in your document.

Those are a "Postscript Level 2 Base 35" fonts but they are not "PDF Base 14"
fonts. Leave the "Helvetica Narrow" family embedded.

The amount of kilobytes saved may seem small, but for those with very limited
bandwidth it does help.















