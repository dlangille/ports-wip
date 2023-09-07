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

USE_GITHUB=	yes
GH_ACCOUNT=	icinga

GH_TUPLE=	VividCortex:ewma:v1.2.0:vividcortex_ewma/vendor/github.com/VividCortex/ewma \
		acarl005:stripansi:5a71ef0e047d:acarl005_stripansi/vendor/github.com/acarl005/stripansi \
		benbjohnson:clock:v1.3.0:benbjohnson_clock/vendor/github.com/benbjohnson/clock \
		cespare:xxhash:v2.1.2:cespare_xxhash_v2/vendor/github.com/cespare/xxhash/v2 \
		creasty:defaults:v1.7.0:creasty_defaults/vendor/github.com/creasty/defaults \
		davecgh:go-spew:v1.1.1:davecgh_go_spew/vendor/github.com/davecgh/go-spew \
		dgryski:go-rendezvous:9f7001d12a5f:dgryski_go_rendezvous/vendor/github.com/dgryski/go-rendezvous \
		fatih:color:v1.13.0:fatih_color/vendor/github.com/fatih/color \
		redis:go-redis:v8.11.5:go_redis_redis_v8/vendor/github.com/redis/go-redis/v8 \
		go-sql-driver:mysql:v1.7.1:go_sql_driver_mysql/vendor/github.com/go-sql-driver/mysql \
		go-yaml:yaml:v3.0.1:go_yaml_yaml/vendor/gopkg.in/yaml.v3 \
		goccy:go-yaml:v1.11.0:goccy_go_yaml/vendor/github.com/goccy/go-yaml \
		golang:exp:b0d781184e0d:golang_exp/vendor/golang.org/x/exp \
		golang:sync:v0.3.0:golang_sync/vendor/golang.org/x/sync \
		golang:sys:v0.6.0:golang_sys/vendor/golang.org/x/sys \
		golang:xerrors:04be3eba64a2:golang_xerrors/vendor/golang.org/x/xerrors \
		google:uuid:v1.3.0:google_uuid/vendor/github.com/google/uuid \
		jessevdk:go-flags:v1.5.0:jessevdk_go_flags/vendor/github.com/jessevdk/go-flags \
		jmoiron:sqlx:v1.3.5:jmoiron_sqlx/vendor/github.com/jmoiron/sqlx \
		lib:pq:v1.10.9:lib_pq/vendor/github.com/lib/pq \
		mattn:go-colorable:v0.1.13:mattn_go_colorable/vendor/github.com/mattn/go-colorable \
		mattn:go-isatty:v0.0.16:mattn_go_isatty/vendor/github.com/mattn/go-isatty \
		mattn:go-runewidth:v0.0.12:mattn_go_runewidth/vendor/github.com/mattn/go-runewidth \
		mattn:go-sqlite3:v1.14.17:mattn_go_sqlite3/vendor/github.com/mattn/go-sqlite3 \
		okzk:sdnotify:d9becc38acbd:okzk_sdnotify/vendor/github.com/okzk/sdnotify \
		pkg:errors:v0.9.1:pkg_errors/vendor/github.com/pkg/errors \
		pmezard:go-difflib:v1.0.0:pmezard_go_difflib/vendor/github.com/pmezard/go-difflib \
		rivo:uniseg:v0.2.0:rivo_uniseg/vendor/github.com/rivo/uniseg \
		ssgreg:journald:v1.0.0:ssgreg_journald/vendor/github.com/ssgreg/journald \
		stretchr:testify:v1.8.4:stretchr_testify/vendor/github.com/stretchr/testify \
		uber-go:multierr:v1.10.0:uber_go_multierr/vendor/go.uber.org/multierr \
		uber-go:zap:v1.25.0:uber_go_zap/vendor/go.uber.org/zap \
		vbauerster:mpb:v6.0.4:vbauerster_mpb_v6/vendor/github.com/vbauerster/mpb/v6

WRKSRC_go_redis_redis_v8=	go-redis-8.11.5

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_SUB=	WWWGRP=${WWWGRP} \
		WWWOWN=${WWWOWN}

OPTIONS_DEFINE=		MYSQL PGSQL
OPTIONS_DEFAULT=	MYSQL PGSQL

PGSQL_USE=	PHP=pdo_pgsql,pgsql
MYSQL_USE=	PHP=mysqli,pdo_mysql

#do-build:
#	@( cd ${WRKSRC}/${PORTNAME} ; \
#		${SETENV} ${MAKE_ENV} ${GO_ENV} GOPROXY=off ${GO_CMD} run build.go -version v${DISTVERSION} -no-upgrade build ; \
#		${SETENV} ${MAKE_ENV} ${GO_ENV} GOPROXY=off ${GO_CMD} run build.go -version v${DISTVERSION} -no-upgrade build stdiscosrv; \
#		${SETENV} ${MAKE_ENV} ${GO_ENV} GOPROXY=off ${GO_CMD} run build.go -version v${DISTVERSION} -no-upgrade build strelaysrv; \
#		${SETENV} ${MAKE_ENV} ${GO_ENV} GOPROXY=off ${GO_CMD} run build.go -version v${DISTVERSION} -no-upgrade build strelaypoolsrv; \
#		)

.include <bsd.port.mk>
