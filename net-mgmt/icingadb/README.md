The problem:

```
sudo poudriere testport -j 132R -p dvl-FreeBSD -i net-mgmt/icingadb

...

===>   icingadb-1.1.1 depends on file: /usr/local/sbin/pkg - found
===> Fetching all distfiles required by icingadb-1.1.1 for building
===>  Extracting for icingadb-1.1.1
=> SHA256 Checksum OK for icinga-icingadb-v1.1.1_GH0.tar.gz.
=> SHA256 Checksum OK for VividCortex-ewma-v1.2.0_GH0.tar.gz.
=> SHA256 Checksum OK for acarl005-stripansi-5a71ef0e047d_GH0.tar.gz.
=> SHA256 Checksum OK for benbjohnson-clock-v1.3.0_GH0.tar.gz.
=> SHA256 Checksum OK for cespare-xxhash-v2.1.2_GH0.tar.gz.
=> SHA256 Checksum OK for creasty-defaults-v1.7.0_GH0.tar.gz.
=> SHA256 Checksum OK for davecgh-go-spew-v1.1.1_GH0.tar.gz.
=> SHA256 Checksum OK for dgryski-go-rendezvous-9f7001d12a5f_GH0.tar.gz.
=> SHA256 Checksum OK for fatih-color-v1.13.0_GH0.tar.gz.
=> SHA256 Checksum OK for go-redis-redis-v8.11.5_GH0.tar.gz.
=> SHA256 Checksum OK for go-sql-driver-mysql-v1.7.1_GH0.tar.gz.
=> SHA256 Checksum OK for go-yaml-yaml-v3.0.1_GH0.tar.gz.
=> SHA256 Checksum OK for goccy-go-yaml-v1.11.0_GH0.tar.gz.
=> SHA256 Checksum OK for golang-exp-b0d781184e0d_GH0.tar.gz.
=> SHA256 Checksum OK for golang-sync-v0.3.0_GH0.tar.gz.
=> SHA256 Checksum OK for golang-sys-v0.6.0_GH0.tar.gz.
=> SHA256 Checksum OK for golang-xerrors-04be3eba64a2_GH0.tar.gz.
=> SHA256 Checksum OK for google-uuid-v1.3.0_GH0.tar.gz.
=> SHA256 Checksum OK for jessevdk-go-flags-v1.5.0_GH0.tar.gz.
=> SHA256 Checksum OK for jmoiron-sqlx-v1.3.5_GH0.tar.gz.
=> SHA256 Checksum OK for lib-pq-v1.10.9_GH0.tar.gz.
=> SHA256 Checksum OK for mattn-go-colorable-v0.1.13_GH0.tar.gz.
=> SHA256 Checksum OK for mattn-go-isatty-v0.0.16_GH0.tar.gz.
=> SHA256 Checksum OK for mattn-go-runewidth-v0.0.12_GH0.tar.gz.
=> SHA256 Checksum OK for mattn-go-sqlite3-v1.14.17_GH0.tar.gz.
=> SHA256 Checksum OK for okzk-sdnotify-d9becc38acbd_GH0.tar.gz.
=> SHA256 Checksum OK for pkg-errors-v0.9.1_GH0.tar.gz.
=> SHA256 Checksum OK for pmezard-go-difflib-v1.0.0_GH0.tar.gz.
=> SHA256 Checksum OK for rivo-uniseg-v0.2.0_GH0.tar.gz.
=> SHA256 Checksum OK for ssgreg-journald-v1.0.0_GH0.tar.gz.
=> SHA256 Checksum OK for stretchr-testify-v1.8.4_GH0.tar.gz.
=> SHA256 Checksum OK for uber-go-multierr-v1.10.0_GH0.tar.gz.
=> SHA256 Checksum OK for uber-go-zap-v1.25.0_GH0.tar.gz.
=> SHA256 Checksum OK for vbauerster-mpb-v6.0.4_GH0.tar.gz.
mv: rename /wrkdirs/usr/ports/net-mgmt/icingadb/work/redis-8.11.5 to /wrkdirs/usr/ports/net-mgmt/icingadb/work/icingadb-1.1.1/vendor/github.com/go-redis/redis/v8: No such file or directory
*** Error code 1

Stop.
make: stopped in /usr/ports/net-mgmt/icingadb
```


Why is this problem occuring?

The tarball looks like this:

```
$ tar -tzf /usr/local/poudriere/distfiles/go-redis-redis-v8.11.5_GH0.tar.gz | head
go-redis-8.11.5/
go-redis-8.11.5/.github/
go-redis-8.11.5/.github/FUNDING.yml
go-redis-8.11.5/.github/ISSUE_TEMPLATE/
go-redis-8.11.5/.github/ISSUE_TEMPLATE/bug_report.md
go-redis-8.11.5/.github/ISSUE_TEMPLATE/config.yml
go-redis-8.11.5/.github/dependabot.yml
go-redis-8.11.5/.github/workflows/
go-redis-8.11.5/.github/workflows/build.yml
go-redis-8.11.5/.github/workflows/commitlint.yml
```


The actual distfile directory is The directory is :

```
drwxr-xr-x   9 root  wheel  3648 Mar 17  2022 go-redis-8.11.5
```

Not `redis-8.11.5` as shown in the `mv` above in the error message.