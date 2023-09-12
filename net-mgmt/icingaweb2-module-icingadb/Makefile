PORTNAME=	icingaweb2-module-icingadb
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.2
CATEGORIES=	net-mgmt www
PKGNAMESUFFIX=	${PHP_PKGNAMESUFFIX}

MAINTAINER=	dvl@FreeBSD.org
COMMENT=	Publish, synchronize, and visualize Icinga data
WWW=		https://icinga.com/docs/icinga-db-web/latest/doc/01-About/

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	icingadb>0:net-mgmt/icingadb \
		icingaweb2${PHP_PKGNAMESUFFIX}>=2.9:net-mgmt/icingaweb2 \
		icinga-php-library${PHP_PKGNAMESUFFIX}>=0.9:net-mgmt/icinga-php-library@${PHP_FLAVOR} \
		icinga-php-thirdparty${PHP_PKGNAMESUFFIX}>=0.11.0:net-mgmt/icinga-php-thirdparty@${PHP_FLAVOR}

USES=		php:web,flavors shebangfix
USE_PHP=	curl dom json xml

USE_GITHUB=	yes
GH_ACCOUNT=	icinga
GH_PROJECT=	icingadb-web

NO_BUILD=	yes
NO_ARCH=	yes

#SUB_FILES=	pkg-message
SUB_LIST=	ETCDIR=${ETCDIR} \
		EXAMPLESDIR=${EXAMPLESDIR} \
		WWWDIR=${WWWDIR}

PLIST_SUB=	WWWGRP=${WWWGRP} \
		WWWOWN=${WWWOWN}

OPTIONS_DEFINE=		MYSQL PGSQL
OPTIONS_DEFAULT=	MYSQL PGSQL

PDF_DESC=		Export graphs as PDF
PDF_RUN_DEPENDS=	${PHPBASE}/lib/php/${PHP_EXT_DIR}/imagick.so:graphics/pecl-imagick@${PHP_FLAVOR}

PGSQL_USE=	PHP=pdo_pgsql,pgsql
MYSQL_USE=	PHP=mysqli,pdo_mysql

WWWDIR?=	${PREFIX}/www/icingaweb2/modules/${PORTNAME:C/^.*-//}

post-patch:
#	${REINPLACE_CMD} 's%\(/etc/icingaweb2\)%${PREFIX}\1%g' \
#		${WRKSRC}/library/Icinga/Application/ApplicationBootstrap.php
#	${REINPLACE_CMD} 's%/var/lib/icingaweb2%/var/db/icingaweb2%g' \
#		${WRKSRC}/library/Icinga/Application/ApplicationBootstrap.php
#	${REINPLACE_CMD} 's%/usr/share/icinga-php%${WWWDIR}/icinga-php%g' \
#		${WRKSRC}/library/Icinga/Application/ApplicationBootstrap.php
#	${REINPLACE_CMD} 's%readlink[^)]*)%"${PREFIX}/bin/php"%g' \
		${WRKSRC}/application/clicommands/WebCommand.php
do-install:
#	${MKDIR} ${STAGEDIR}${PREFIX}/etc/bash_completion.d/
#	${MKDIR} ${STAGEDIR}/var/db/${PORTNAME}/
#	${INSTALL_DATA} ${WRKSRC}/etc/bash_completion.d/icingacli \
#		${STAGEDIR}${PREFIX}/etc/bash_completion.d
	(cd ${WRKSRC} && ${RM} -r .mailmap changelog.py icingaweb2.spec \
		bin/license_writer.py packages test)
#	(${FIND} ${WRKSRC} -name "*.bak" -delete)
	${MKDIR} ${STAGEDIR}${WWWDIR}
	(cd ${WRKSRC} && \
		${COPYTREE_SHARE} . ${STAGEDIR}${WWWDIR})
#	${CHMOD} 755 ${STAGEDIR}${WWWDIR}/bin/icingacli
#	${RLN} ${STAGEDIR}${WWWDIR}/bin/icingacli ${STAGEDIR}${PREFIX}/bin/icingacli
#	${MKDIR} ${STAGEDIR}${ETCDIR}

.include <bsd.port.mk>
