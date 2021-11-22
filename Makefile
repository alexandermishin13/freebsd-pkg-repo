# $FreeBSD$

.PHONY: install

NAME='GPIO'
URL='pkg.mh.net.ru'

install:
	@mkdir -p /usr/local/etc/pkg/fingerprints/${NAME}/trusted
	@mkdir -p /usr/local/etc/pkg/fingerprints/${NAME}/revoked
	@mkdir -p /usr/local/etc/pkg/repos
	@cp ${NAME}.conf /usr/local/etc/pkg/repos
	@cp fingerprint /usr/local/etc/pkg/fingerprints/${NAME}/trusted/${URL}

uninstall:
	@-rm /usr/local/etc/pkg/repos/${NAME}.conf
	@-rmdir /usr/local/etc/pkg/repos
	@-rmdir /usr/local/etc/pkg
	@-rmdir /usr/local/etc/pkg/fingerprints/${NAME}/trusted/${URL}
	@echo
	@echo "You can remove '/usr/local/etc/pkg/fingerprints/${NAME}' if it is not needed anymore."
