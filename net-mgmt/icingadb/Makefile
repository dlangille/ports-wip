PORTNAME=	icingadb
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.1
CATEGORIES=	net-mgmt www
PKGNAMESUFFIX=	${PHP_PKGNAMESUFFIX}

MAINTAINER=	dvl@FreeBSD.org
COMMENT=	Publish, synchronize, and visualize Icinga data
WWW=		https://icinga.com/docs/icinga-db/latest/doc/02-Installation/

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

GO_MODULE=	github.com/icinga/icingadb

GO_TARGET=	./cmd/ipfs:ipfs-go

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_SUB=	WWWGRP=${WWWGRP} \
		WWWOWN=${WWWOWN}

OPTIONS_DEFINE=		MYSQL PGSQL
OPTIONS_DEFAULT=	MYSQL PGSQL

PGSQL_USE=	PHP=pdo_pgsql,pgsql
MYSQL_USE=	PHP=mysqli,pdo_mysql

PLIST_SUB=	PORTNAME=${PORTNAME}

do-build:
	@( cd ${WRKSRC}/cmd/${PORTNAME} ; \
	   ${GO_CMD} build ; \
	)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/${PORTNAME}/${PORTNAME} ${STAGEDIR}${PREFIX}/sbin/

.include <bsd.port.mk>
