# freebsd-pkg-repo

## About

This is a free package repository of my drivers and daemons for FreeBSD.
I made them for myself and those X```berry Pi``` owners who decide
to use them. Right now, I am finding that all packages work great.

All packages are published ```as is```.
No claims for any damage caused by their use or errors in their code will be accepted.
Although I will be glad to read any feedbacks and, if my knowledge is enough, I will try
to correct the errors. 

Based on the fact that using third-party binaries is always a matter of trust in their
creator, I provide ports archives for code analysis and package building.

Repository URL [http://pkg.mh.net.ru](http://pkg.mh.net.ru).
I try to always use BSD 2-Clause License in my code, typical for FreeBSD.

## Installation and deinstallation
You can easy register and unregister this repository to your system.

To register the repo type:
``` shell
% sudo make install
```

To unregister it type:
``` shell
% sudo make uninstall
```

## To do

Build and share packages for ```arm64``` architecture when I received ```Raspberry Pi 4```
