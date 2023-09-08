PORTNAME=	icingadb
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.1
CATEGORIES=	net-mgmt www

MAINTAINER=	dvl@FreeBSD.org
COMMENT=	Publish, synchronize, and visualize Icinga data
WWW=		https://icinga.com/docs/icinga-db/latest/doc/02-Installation/

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

USE_RC_SUBR=	icingadb

GO_MODULE=	github.com/icinga/icingadb
GO_TARGET=      ./cmd/icingadb

PLIST_SUB=	WWWGRP=${WWWGRP} \
		WWWOWN=${WWWOWN}

OPTIONS_DEFINE=		MYSQL PGSQL
OPTIONS_DEFAULT=	MYSQL PGSQL

PGSQL_USE=	PHP=pdo_pgsql,pgsql
MYSQL_USE=	PHP=mysqli,pdo_mysql

PLIST_SUB=	PORTNAME=${PORTNAME}

# As copied from net-mgmt/icinga2
ICINGA2USER?=	icinga
ICINGA2GROUP?=	icinga
USERS=		${ICINGA2USER}
GROUPS=		${ICINGA2GROUP}

SUB_LIST=	ICINGA2GROUP=${ICINGA2GROUP} \
		ICINGA2USER=${ICINGA2USER}




post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX|${PREFIX}|g' ${WRKSRC}/pkg/config/config.go

#do-build:
#	@( cd ${WRKSRC}/cmd/${PORTNAME} ; \
#	   ${GO_CMD} build ; \
#	)

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cmd/${PORTNAME}/${PORTNAME} ${STAGEDIR}${PREFIX}/sbin/
#	${INSTALL_SCRIPT} ${WRKDIR}/icingadb ${STAGEDIR}${PREFIX}/etc/rc.d/

.include <bsd.port.mk>
