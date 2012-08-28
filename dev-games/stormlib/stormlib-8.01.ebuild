# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils

DESCRIPTION="MPQ library"
HOMEPAGE="http://www.zezula.net/en/mpq/stormlib.html"
SRC_URI="http://www.zezula.net/download/stormlib.zip"
LICENSE="custom"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64  ~arm ~ppc ~ppc64 ~x86"
IUSE="+encryption"

DEPEND="app-arch/unzip
${RDEPEND}"
RDEPEND="
app-arch/bzip2
sys-libs/zlib
encryption? (
dev-libs/libtomcrypt
)
"
MERGE_TYPE="source"

S="${WORKDIR}/StormLib"

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_SUFFIX=${libdir#lib}
		-DMANUAL_REVISION=${VERSIO_PRAESENS}
		$(cmake-utils_use_want encryption WITH_LIBTOMCRYPT)
	)

	cmake-utils_src_configure
}
