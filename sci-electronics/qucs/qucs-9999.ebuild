# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils subversion

#https://qucs.svn.sourceforge.net/svnroot/qucs/branches/qucs_0_1_0/qucs

DESCRIPTION="Quite Universal Circuit Simulator"
HOMEPAGE="http://qucs.sourceforge.net"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="+app +blp +map +mdlx +mpq +w3g +editor +plugins +encryption debug doc"

ESVN_REPO_URI="https://qucs.svn.sourceforge.net/svnroot/qucs/branches/qucs_0_1_0/qucs"
ESVN_PROJECT="qucs"

DEPEND="${RDEPEND}"
RDEPEND="
dev-qt/qtxmlpatterns:4
dev-qt/qtsvg:4
dev-qt/qtcore:4
dev-qt/qtgui:4
dev-libs/libxml2
dev-libs/libxslt
"
MERGE_TYPE="source"

src_configure() {
	cmake-utils_src_configure
}
