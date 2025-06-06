# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR=GENEHACK
DIST_VERSION=0.048
inherit perl-module

DESCRIPTION="Wrap git(7) command-line interface"

SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-vcs/git
	virtual/perl-File-Temp
	dev-perl/File-chdir
	virtual/perl-Scalar-List-Utils
	dev-perl/Sort-Versions
"
BDEPEND="${RDEPEND}
	dev-perl/Devel-CheckBin
	virtual/perl-ExtUtils-MakeMaker
	virtual/perl-File-Spec
	test? (
		virtual/perl-File-Path
		virtual/perl-File-Spec
		virtual/perl-File-Temp
		virtual/perl-IO
		dev-perl/Test-Deep
		dev-perl/Test-Exception
		virtual/perl-Test-Simple
	)
"

src_compile() {
	perl-module_src_compile
	local MODULES=(
		"Git::Wrapper ${DIST_VERSION}"
	)
	for dep in "${MODULES[@]}"; do
		perl -Mblib="${S}" -M"${dep} ()" -e1 ||
			die "Could not load ${dep}"
	done
}
