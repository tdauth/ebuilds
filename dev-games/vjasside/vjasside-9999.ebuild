# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit qt4-r2 git

DESCRIPTION="Doxygen-like tool for JASS and vJass"
HOMEPAGE="http://wc3lib.org"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="debug"

EGIT_REPO_URI="git://gitorious.org/wc3lib/vjassdoc.git"
EGIT_BRANCH="master"

DEPEND="${RDEPEND}"
RDEPEND="x11-libs/qt-gui:4
"
MERGE_TYPE="source"

DOCSDIR="${S}"
DOCS="ChangeLog README COPYING TODO"

src_prepare() {
        git_src_prepare
}

src_configure() {
	eqmake4
}
