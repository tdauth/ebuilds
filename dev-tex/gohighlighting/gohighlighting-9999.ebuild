# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit mercurial

DESCRIPTION="LaTeX Go Highlighting"
HOMEPAGE="http://go-lang.cat-v.org/text-editors/"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"

EHG_REPO_URI="https://bitbucket.org/korfuri/golang-latex-listings"

src_install()
{
	insinto /usr/share/texmf-dist/tex/latex/listings/
	echo "Checkout dir 0: ${EGIT_CHECKOUT_DIR}"
	echo "Checkout dir 1: ${EHG_CHECKOUT_DIR}"
	echo "Source dir: ${S}"
	doins "${EGIT_CHECKOUT_DIR}/lstlang0.sty"
}
