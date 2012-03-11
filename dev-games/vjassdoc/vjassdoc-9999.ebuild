# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils git

DESCRIPTION="Doxygen-like tool for JASS and vJass"
HOMEPAGE="http://www.zezula.net/en/mpq/stormlib.html"
SRC_URI="http://www.zezula.net/download/stormlib.zip"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="gui"

EGIT_REPO_URI="git://gitorious.org/wc3lib/vjassdoc.git"
EGIT_BRANCH="master"

DEPEND="app-arch/unzip
${RDEPEND}"
RDEPEND="dev-libs/boost
app-arch/bzip2
sys-libs/zlib
gui? (
kde-base/kdelibs
)
"
MERGE_TYPE="source"

S="${WORKDIR}/StormLib"

src_prepare() {
        git_src_prepare
}

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_SUFFIX=${libdir#lib}
		-DMANUAL_REVISION=${VERSIO_PRAESENS}
		$(cmake-utils_use_want gui GUI)
	)

	cmake-utils_src_configure
}
