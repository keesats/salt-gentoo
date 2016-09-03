# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=POTYL
MODULE_A_EXT=tar.gz
inherit perl-module

DESCRIPTION="Perl binding for the C library gtksourceview"

SLOT="0"
LICENSE="GPL-2  GPL-3 Artistic"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/perl
    dev-perl/gtk2-perl"

DEPEND="$RDEPEND
    dev-perl/glib-perl
    dev-perl/ExtUtils-Depends
    dev-perl/extutils-pkgconfig
    virtual/perl-ExtUtils-MakeMaker
    x11-libs/gtksourceview:2.0"

SRC_TEST=do
