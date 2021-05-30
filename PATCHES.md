Patches for Other LaTeX Packages
================================

Some patches you may or may not want to implement.

ean13isbn.sty.patch
-------------------

The `texmf-dist/tex/latex/ean13isbn.sty` package (for generating an ISBN
barcode) has the "Base 35" Helvetica font hard-coded in the package.

This patch changes that to use the TeX Gyre-Heros instead.

The only reason to do this is if your documents that need an ISBN barcode
already use TeX Gyre Heros---then it means one less font to embed.

I would leave the `texmf-dist` version alone and put the patched version in your
`[TEXMF-LOCAL]` tree. Check the version every now and then in case an update is
released and you need to update your patched version as well.
