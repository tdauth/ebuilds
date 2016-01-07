# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit subversion

DESCRIPTION="GHost++ is a Warcraft 3 game hosting bot."
HOMEPAGE="http://code.google.com/p/ghostplusplus/"
LICENSE="APL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="+app +blp +jass jass_llvm +map +mdlx +mpq +w3g +editor +plugins debug doc"

ESVN_REPO_URI="http://ghostplusplus.googlecode.com/svn/trunk/"

DEPEND="${RDEPEND}"
RDEPEND="
dev-libs/gmp
>=dev-libs/boost-1.46
"
MERGE_TYPE="source"

# https://www.ghostpp.com/forum/index.php?topic=346.0
# https://github.com/OHSystem/ohsystem/wiki/Installation---UNIX
src_install() {
	cd "${WORKDIR}/bncsutil/src/bncsutil/"
	emake
	emake install

	# go back
	cd "${WORKDIR}/StormLib/stormlib"
	emake
	emake install

	# todo replace stuff
	cd "${WORKDIR}/ghost/"
	emake
	emake install
}