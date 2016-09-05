# <--Managed by SaltStack-->

EAPI="5"

inherit eutils user
NAME="btsync"
DESCRIPTION="Magic folder style file syncing powered by BitTorrent."
HOMEPAGE="http://www.bittorrent.com/sync"
SRC_URI="
	amd64?	( https://download-cdn.getsync.com/${PV}/linux-x64/BitTorrent-Sync_x64.tar.gz )
	x86?	( https://download-cdn.getsync.com/${PV}/linux-i386/BitTorrent-Sync_i386.tar.gz ) "

RESTRICT="mirror strip"
LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PREBUILT="opt/btsync/btsync"

S="${WORKDIR}"

pkg_setup() {
	enewgroup btsync
	enewuser btsync -1 -1 -1 "btsync"
}

src_install() {
	einfo dodir "/opt/${NAME}"
	dodir "/opt/${NAME}"
	exeinto "/opt/${NAME}"
	doexe btsync
	insinto "/opt/${NAME}"
	doins LICENSE.TXT

	"${D}/opt/btsync/btsync" --dump-sample-config > "${D}/etc/${NAME}/config"
	sed -i 's|// "pid_file"|   "pid_file"|' "${D}/opt/${NAME}/config"
	fowners btsync "/opt/${NAME}/config"
	fperms 460 "/opt/${NAME}/config"
}

pkg_preinst() {
	# Customize for local machine
	# Set device name to `hostname`
	sed -i "s/My Sync Device/$(hostname) Gentoo Linux/"  "${D}/etc/btsync/config"
	# Update defaults to the btsync's home dir
	sed -i "s|/home/user|$(egethome btsync)|"  "${D}/opt/btsync/config"
}

pkg_postinst() {
	elog "Init scripts launch btsync daemon as btsync:btsync "
	elog "Please review/tweak /opt/${NAME}/config for default configuration."
	elog "Default web-gui URL is http://localhost:8888/ ."
}
