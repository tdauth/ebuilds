# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit qt4-r2 git-2

DESCRIPTION="Qt based IDE for JASS and vJass"
HOMEPAGE="http://wc3lib.org"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="debug"

EGIT_REPO_URI="git://gitorious.org/wc3lib/vjasside.git"
EGIT_BRANCH="master"

DEPEND="${RDEPEND}"
RDEPEND="dev-qt/qt-gui:4
"
MERGE_TYPE="source"

DOCSDIR="${S}"
DOCS="ChangeLog README COPYING TODO"

src_configure() {
	eqmake4
}
