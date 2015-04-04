# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit cmake-utils git-2

inherit cmake-utils

DESCRIPTION="Programmable tool for verification, analysis and transformation of C++ source code"
HOMEPAGE="http://bitbucket.org/verateam"
LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="+python +lua"

EGIT_REPO_URI="https://bitbucket.org/verateam/vera.git"
EGIT_BRANCH="master"

# VERA_PYTHON
# VERA_USE_SYSTEM_PYTHON depends on VERA_PYTHON
# find_package(PythonInterp 2.0)
# find_package(PythonLibs 2.0)
# VERA_LUA
# VERA_USE_SYSTEM_LUA depends on VERA_LUA
# find_package(Lua51)
# find_package(Luabind)

DEPEND="${RDEPEND}"
RDEPEND="
dev-lang/tcl
dev-libs/boost
app-text/pandoc
python? (
dev-lang/python:2.7
)
lua? (
dev-lang/lua
dev-cpp/luabind
)
"
MERGE_TYPE="source"

src_configure() {
	local libdir="$(get_libdir)"
	local mycmakeargs=(
		-DLIB_SUFFIX=${libdir#lib}
		-DMANUAL_REVISION=${VERSIO_PRAESENS}
		$(cmake-utils_use python VERA_PYTHON)
		$(cmake-utils_use python VERA_USE_SYSTEM_PYTHON)
		$(cmake-utils_use lua VERA_LUA)
		$(cmake-utils_use lua VERA_USE_SYSTEM_LUA)
	)

	cmake-utils_src_configure
}