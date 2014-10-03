# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils git-2

DESCRIPTION="Warcraft III development library"
HOMEPAGE="http://wc3lib.org"
LICENSE="GPL-2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="+app +blp +jass jass_llvm +map +mdlx +mpq +w3g +editor +plugins debug doc"

EGIT_REPO_URI="git://gitorious.org/wc3lib/wc3lib.git"
EGIT_BRANCH="master"

DEPEND="${RDEPEND}"
RDEPEND="
>=dev-libs/boost-1.46
sys-devel/gettext
map? (
dev-games/wc3lib[mpq]
dev-games/wc3lib[blp]
)
mpq? (
app-arch/bzip2
sys-libs/zlib
)
blp? (
virtual/jpeg
)
jass_llvm? (
dev-games/wc3lib[jass]
sys-devel/llvm
)
editor? (
dev-games/wc3lib[blp]
dev-games/wc3lib[map]
dev-games/wc3lib[mdlx]
dev-games/wc3lib[mpq]
>=kde-base/kdelibs-4.6
>=dev-games/ogre-1.9.0
)
plugins? (
dev-games/wc3lib[blp]
dev-games/wc3lib[mpq]
>=kde-base/kdelibs-4.6
)
doc? (
app-doc/doxygen
)
"
MERGE_TYPE="source"

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_SUFFIX=${libdir#lib}
		-DMANUAL_REVISION=${VERSIO_PRAESENS}
		$(cmake-utils_use app APP)
		$(cmake-utils_use blp BLP)
		$(cmake-utils_use jass JASS)
		$(cmake-utils_use jass_llvm JASS_LLVM)
		$(cmake-utils_use map MAP)
		$(cmake-utils_use mdlx MDLX)
		$(cmake-utils_use mpq MPQ)
		$(cmake-utils_use w3g W3G)
		$(cmake-utils_use editor EDITOR)
		$(cmake-utils_use plugins PLUGINS)
		$(cmake-utils_use debug DEBUG)
		$(cmake-utils_use doc DOC)
	)

	cmake-utils_src_configure
}
