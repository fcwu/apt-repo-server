APT-REPO-SERVER
=========================

apt-repo-server is a debian repository server. It monitors file changing event(inotify), then reproduce index file(Packages.gz) automatically.

Usage
=======================

Run server

```
$ docker run -it -v ${PWD}/data:/data -p 10000:80 dorowu/apt-repo-server
```

Export a debian package
```
$ cp qnap-fix-input_0.1_all.deb  data/dists/trusty/main/binary-amd64/
```

File structure looks like
```
$ tree data/
data/
└── dists
    ├── precise
    │   └── main
    │       ├── binary-amd64
    │       │   └── Packages.gz
    │       └── binary-i386
    │           └── Packages.gz
    └── trusty
        └── main
            ├── binary-amd64
            │   ├── Packages.gz
            │   └── qnap-fix-input_0.1_all.deb
            └── binary-i386
                └── Packages.gz
```

Packages.gz looks like
```
$ zcat data/dists/trusty/main/binary-amd64/Packages.gz
Package: qnap-fix-input
Version: 0.1
Architecture: all
Maintainer: Doro Wu <dorowu@qnap.com>
Installed-Size: 33
Filename: ./qnap-fix-input_0.1_all.deb
Size: 1410
MD5sum: 8c08f13d61da1b8dc355443044bb2608
SHA1: 6deef134c94da7f03846a6b74c9e4258c514868f
SHA256: 7441f1616810d5893510d31eac2da18d07b8c13225fd2136e6a380aefe33c815
Section: utils
Priority: extra
Description: QNAP fix
 UNKNOWN
```

Update /etc/apt/sources.list
```
$ echo deb http://127.0.0.1:10000 trusty main | sudo tee -a /etc/apt/sources.list
```


License
==================

apt-repo is under the Apache 2.0 license. See the LICENSE file for details.
