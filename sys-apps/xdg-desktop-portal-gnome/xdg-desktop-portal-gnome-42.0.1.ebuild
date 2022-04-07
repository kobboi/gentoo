# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd gnome.org gnome2-utils meson

DESCRIPTION="A backend implementation for xdg-desktop-portal for the GNOME desktop environment"
HOMEPAGE="https://flatpak.org/ https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome/"
SRC_URI="https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome/-/archive/${PV}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"
IUSE="wayland X"

BDEPEND="
	dev-util/gdbus-codegen
	sys-devel/gettext
	virtual/pkgconfig
"

#	dev-libs/glib:2
#	gnome-base/gnome-desktop:3=
#	media-libs/fontconfig
#	sys-apps/dbus
#	>=sys-apps/xdg-desktop-portal-1.12
#	>=sys-apps/xdg-desktop-portal-gtk-1.12
#	x11-libs/cairo[X?]
#	x11-libs/gdk-pixbuf:2
#	x11-libs/gtk+:3[wayland?,X?]

DEPEND="
	dev-libs/glib:2
	media-libs/fontconfig
	gui-libs/gtk[cups,wayland?,X?]
	gnome-base/gnome-desktop:4=
	gnome-base/gsettings-desktop-schemas
	sys-apps/xdg-desktop-portal
	gui-libs/libadwaita
"

RDEPEND="${DEPEND}"
