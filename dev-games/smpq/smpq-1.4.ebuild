# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils

DESCRIPTION="MPQ tool"
HOMEPAGE="https://launchpad.net/smpq"
SRC_URI="http://launchpad.net/smpq/trunk/1.4/+download/smpq_1.4.orig.tar.gz"
LICENSE="GPL-3"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64  ~arm ~ppc ~ppc64 ~x86"
IUSE="+cmd +kde"

DEPEND="${RDEPEND}"
RDEPEND="
dev-games/StormLib
kde? (
kde-base/kdelibs:4
)
"
MERGE_TYPE="source"

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_SUFFIX=${libdir#lib}
		-DMANUAL_REVISION=${VERSIO_PRAESENS}
		$(cmake-utils_use_want cmd WITH_CMD)
		$(cmake-utils_use_want kde WITH_KDE)
	)

	cmake-utils_src_configure
}
