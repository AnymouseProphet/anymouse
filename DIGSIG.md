DIGSIG
======

The LaTeX hyperref package does not include the capabilities to add a digital
cryptography signature to a PDF file.

The `digsig.sty` file is sort of a patch to hyperref that adds that capability.

In the event you wish to create a canonical fork of an Anymouse Prophet
document that you want to sign, you will need the `digsig.sty` file within
your [TEXMF-LOCAL] tree so that `pdflatex` can find it when instructed to make
a canonical version of your fork.

The file is originally from:

http://home.htp-tel.de/lottermose2/tex/dist/digsig.sty

It is included in this git just in case it vanishes from that server.
