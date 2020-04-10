Getting Started
===============

First build a [Basic Computer](https://ocdoc.cil.li/tutorial:oc1_basic_computer). Make sure to put a [network card](https://ocdoc.cil.li/item:network_card) in it, in order to download programs from this repository.

The operating system ships with the [wget](https://linux.die.net/man/1/wget) program with which you can download files via HTTP to your minecraft computer.

I have created the `github.lua` program to simplify downloading programs from this repository even further. So let's start by downloading `github.lu`:

```
wget https://raw.githubusercontent.com/mikenoethiger/opencomputers/master/github.lua
```

From now on you can download any further program from this repository as follows, e.g. to download `hello.lua`:

```
github hello
```

![github installation](github_installation.png)

If you want the `github` progam to be available globally, you can move it to `/bin`:

```
mv github.lua /bin
```

Links
=====

* [OpenComputers Wiki](https://ocdoc.cil.li/)
* [Lua APIs](https://ocdoc.cil.li/api)
* [Shell API](https://ocdoc.cil.li/api:shell)
* [Repository](http://raw.githubusercontent.com/mikenoethiger/opencomputers/master)
