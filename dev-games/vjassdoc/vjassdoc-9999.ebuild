# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils git-2

DESCRIPTION="Doxygen-like tool for JASS and vJass"
HOMEPAGE="http://wc3lib.org"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="gui -sqlite doc"

EGIT_REPO_URI="git://gitorious.org/wc3lib/vjassdoc.git"
EGIT_BRANCH="master"

DEPEND="${RDEPEND}"
RDEPEND="dev-libs/boost
gui? (
kde-base/kdelibs
)
sqlite? (
dev-db/sqlite:3
)
"
MERGE_TYPE="source"

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_SUFFIX=${libdir#lib}
		-DMANUAL_REVISION=${VERSIO_PRAESENS}
		$(cmake-utils_use_want gui GUI)
		$(cmake-utils_use_want sqlite SQLITE)
		$(cmake-utils_use_want doc DOC)
	)

	cmake-utils_src_configure
}
