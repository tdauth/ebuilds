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
	dodir /usr/share/texmf-dist/tex/latex/listings/
	cp -R "${S}/" "${D}/" || die "Install failed!"
}
