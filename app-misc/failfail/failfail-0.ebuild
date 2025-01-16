EAPI=8
SLOT=0

KEYWORDS=~amd64

src_unpack() {
	mkdir ${S}
}

src_compile() {
	die "Purposely failing"
}
