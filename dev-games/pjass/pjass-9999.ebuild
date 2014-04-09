# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils git-2

DESCRIPTION="Open Source JASS parser"
HOMEPAGE="http://jass.sourceforge.net/"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/wc3lib/pjass.git"
EGIT_BRANCH="master"

DEPEND="${RDEPEND}"
RDEPEND="
sys-devel/bison
sys-devel/flex
"
MERGE_TYPE="source"

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_SUFFIX=${libdir#lib}
		-DMANUAL_REVISION=${VERSIO_PRAESENS}
	)

	cmake-utils_src_configure
}
