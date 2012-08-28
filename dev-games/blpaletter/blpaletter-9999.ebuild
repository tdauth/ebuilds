# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils git-2

DESCRIPTION="PitzerMike's BLPaletter"
HOMEPAGE="http://www.wc3c.net/showthread.php?t=86878"
LICENSE="custom"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE=""

EGIT_REPO_URI="git://gitorious.org/wc3lib/blpaletter.git"
EGIT_BRANCH="master"

DEPEND="${RDEPEND}"
RDEPEND="
virtual/jpeg
"
MERGE_TYPE="source"

src_configure() {
	local libdir="$(get_libdir)"
	#local mycmakeargs=(
	#	-DLIB_SUFFIX=${libdir#lib}
	#	-DMANUAL_REVISION=${VERSIO_PRAESENS}
	#)

	cmake-utils_src_configure
}
