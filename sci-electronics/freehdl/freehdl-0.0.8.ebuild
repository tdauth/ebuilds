# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit autotools-utils

DESCRIPTION="A free VHDL simulator."
HOMEPAGE="http://qucs.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/project/qucs/qucs/0.0.16/freehdl-${PV}.tar.gz"
LICENSE="GPLv2"
RESTRICT="nomirror"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="${RDEPEND}"
RDEPEND="
dev-lang/perl
virtual/pkgconfig
sys-devel/libtool
sys-devel/flex
sys-libs/glibc
"
# glibc for getopt and various headers
MERGE_TYPE="source"

# bug 123456
AUTOTOOLS_IN_SOURCE_BUILD=1

DOCS=(AUTHORS ChangeLog README HACKING INSTALL COPYING TODO)

src_configure() {
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
}

src_install() {
	autotools-utils_src_install
}