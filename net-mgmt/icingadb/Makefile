PORTNAME=	icingadb
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.1
CATEGORIES=	net-mgmt

MAINTAINER=	dvl@FreeBSD.org
COMMENT=	Publish, synchronize, and visualize Icinga data
WWW=		https://icinga.com/docs/icinga-db/latest/doc/02-Installation/

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

USE_RC_SUBR=	icingadb

PLIST_SUB=	PORTNAME=${PORTNAME}

# As copied from net-mgmt/icinga2
ICINGA2USER?=	icinga
ICINGA2GROUP?=	icinga
USERS=		${ICINGA2USER}
GROUPS=		${ICINGA2GROUP}

SUB_LIST=	ICINGA2GROUP=${ICINGA2GROUP} \
		ICINGA2USER=${ICINGA2USER}

USE_GITHUB=	yes
GH_ACCOUNT=	Icinga
GH_PROJECT=	icingadb

GO_MODULE=	github.com/icinga/icingadb
GO_TARGET=	./cmd/icingadb

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX|${PREFIX}|g' ${WRKSRC}/pkg/config/config.go

post-install:
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
