# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils

DESCRIPTION="Programmable tool for verification, analysis and transformation of C++ source code"
HOMEPAGE="http://bitbucket.org/verateam"
LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE=""
SRC_URI="http://bitbucket.org/verateam/vera/downloads/vera++-1.2.1.tar.gz"

DEPEND="${RDEPEND}"
RDEPEND="
dev-lang/tcl
dev-libs/boost
app-text/pandoc
"
MERGE_TYPE="source"

src_configure() {
	cmake-utils_src_configure
}
