# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_7 pypy3 )

inherit distutils-r1

DESCRIPTION="A Python package for creating beautiful command line interfaces"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
HOMEPAGE="https://palletsprojects.com/p/click/ https://pypi.org/project/click/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 ~s390 sparc x86"
IUSE="examples test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

PATCHES=(
	# From upstream, can be removed in next release.
	"${FILESDIR}/${PN}-6.7-fix-tests.patch"
	# From upstream, can be removed in next release.
	"${FILESDIR}/${PN}-6.7-support-sphinx-1.7.patch"
)

python_test() {
	emake test
}

python_install_all() {
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
