---
title: "NixOS - My favourite linux distribution ever"
date: 2023-08-06
lastmod: 2023-08-06
tags: [Linux, Nix]
categories: [Operating Systems]
draft: false
---

![emilia with distro logos](emilia-with-distro-logos.webp)

## Table of contents

- [Our first date](#first-date)
- [And why would I use Nix + NixOS?](#why-nixos)
  * [It's astonishing stable](#stability)
  * [It's reproducible](#reproducibility)
  * [It has a vast repository](#repository)
  * [You may have multiple environments and software versions](#repository)
  * [Virtual machines!](#vm-testing)
- [Reasons to not use Nix and NixOS...](#reasons-to-not-use)
- [Afterwords](#afterwords)

---

<div id="first-date">

# Our first date

</div>

When I migrated from Manjaro to Arch Linux, I have discovered the heaven of
Linux customisation, the possibility to
[rice](https://jie-fang.github.io/blog/basics-of-ricing) my system. And it was
also the time that I've found the
[r/unixporn](https://www.reddit.com/r/unixporn) subreddit.

Since my childhood, I've always been dreaming about an operating system that I
could make my own thing, customising every possible thing as I wish. With the
time, I've had suddenly abandoned the usual Desktop Environments and have
started using a window manager. Then, I've also started using some cool pieces
of libre software, like GNU Emacs, Vim, git and et cetera, later on I started to
notice something whilst playing with Emacs configurations, that my system was so
customised at that point that I would have to spend hours and hours only to
build that same environment again in another machine, imagine if I have to
format my disk or change my machine, I don't know, someday I would have to reset
my system and then find out that it's impossible to remember every change I've
made in all this years. Why not have a operating system with declarative
configuration system like Emacs or other CLI programs? That was the start of my
passion with NixOS.

I've had watched some Emacs tutorials at
[System Crafters](https://www.youtube.com/c/systemcrafters) at the time and
there I've heard about [GNU Guix](https://guix.gnu.org), which is a declarative
operating system and package manager, I've really liked the idea, however I'm
not a big fan of Lisp, and Guix uses a Lisp dialect called Guile Scheme for its
configuration and package recipes, and another annoying detail is that Guix has
no proprietary software on its repositoreis, only libre software.

Although I've found an incredible alternative to GuixOS, my current declarative
operating system: **NixOS** ❄️.


<div id="why-nixos">

# And why would I use Nix + NixOS?

</div>

You might be thinking “Why would I distrohop to a new system?”. On this section
I'm going to give you some very good reasons.

<div id="stability">

## 1. It's astonishing stable

</div>

If you are like me, you will love the nix "package manager", it's like the
midterm between stability and rolling-release updates, you may choose to use the
stable or unstable channels, depending on your needs, the first one being a
debian-like stable branch with pinned derivations (packages) versions that
updates every time in a while with new NixOS version releases, and the second
one being an arch-like rolling-release channel that updates regurlaly with new
merged changes on the Nix repositories, which is great for developers, and you
can even use both channels at the same time, installing unstable derivations of
specific programs. Anyway, you're going to experience a great stability even if
you choose the unstable channel, since you may always rollback to a previous
version of your system.

Once you get a stable state you will never loose it unless you manually remove
the old generation or use the nix garbage collector to free up some space.

<div id="reproducibility">

## 2. It's reproducible

</div>

It means that once you write down your system configuration you can carry it
everywhere you go and re-create your current system in any machine with all the
packages and modifications you like, and that's my favourite aspect of the
system and the reason I've decided to distrohop from Arch Linux to it.

Being able to reproduce my system without having to keep track of every change
I've made to it, or all the packages I've installed with its optional
dependencies and et cetera is a lifesaver feature, it literally saves a lot of
lifetime.

<div id="repository">

## 3. It has a vast repository

</div>

The major reason for Arch Linux to be so popular is its AUR (Arch User
Repository) which is a giant software repository maintained by the users, and
it's one of the main reasons for people to love Arch Linux, the AUR has so many
packages, it's unbeliavable, every possible software you would think is probably
available there.

And NixOS is not far from this same accomplish, having the 2nd largest software
repository available with its community constantly pushing new additions and
changes, growing it even more. Once you understand the basics of the nix syntax
you ought to be able to push your own package definitions, I've been playing
around in the NixOS repository by looking other people commits and I have added
some packages as well, like
[ctpv](https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/applications/file-managers/lf/ctpv.nix#L58)
(a file previewr for lf) and
[tym](https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/applications/terminal-emulators/tym/default.nix#L27),
it was a fun experience and the community was really nice and helpful.

You will probably always find the software you like, doesn't matter if it's a
free or proprietary one.

<div id="repository">

## 4. You may have multiple environments and software versions

</div>

If you are a software developer or an avid linux enthusiast you know the pain
called the dependency hell, when some software packages depends on specific
version of other software packages, which makes it impossible for you to have an
older or newer version of the same package and makes it difficult for you to
have various packages that depends on different version of the same software.
However on Nix it works differently, every package has its own "space" with
separeted dependencies, and don't worry, Nix is smart enough to hardlink the
same dependencies between softwares, which saves a lot of space on your system.

You will never worry about dependencies and software versions anymore, with Nix
shells you also have access to a reproducible development environment for every
different project, making it easy to bring your development environment into any
machine that has Nix installed.

<div id="vm-testing">

## 5. Virtual machines!

</div>

If you have made a change to your system configuration and don't want to deploy
it to your current system (you have other options to test changes, like
switching to a new generation of your system temporarily) you can just build a
virtual machine with a NixOS command and it will work out-of-the-box!

![nixos-rebuild build-vm command screenshot](screenshot-20230806-191628.webp)

Looks like magic, right?

<div id="reasons-to-not-use">

# Reasons to not use Nix and NixOS...

</div>

I really recommend you to learn this amazing, astonishing and beautiful piece of
software, but there is some minor reasons that may dishearten you.

1. You will need to learn a new language and maybe a new paradigm.

The Nix langugage that we use to either write configurations and derivations for
Nix and NixOS is a totally unique programming language, and it's a functional
and declarative one, so you might not be used to how the syntax and things in
general works with that. My recommendation is to learn by trying, the reward
will be greater than the challenge. However if you are already used to this kind
of programming languages, it will be very easy to get accostumed.

2. Lack of documentation

There's not too much official documentation about NixOS, and it's something that
the developers and the community are working hard to fix, I really miss the Arch
Wiki and sometimes I still go there to learn and fix new problems. On NixOS most
of the documentation is reading the code yourself and trying to figure out
what's happening there, but you always have the newborn [NixOS
Wiki](https://nixos.wiki) and the great [NixOS Discourse
Forum.](https://discourse.nixos.org)

<div id="afterwords">

# Afterwords

</div>

The purpose of this post wasn't to be a in depth guide or introduction to NixOS
or its features, but to convince you that it's a great choice depending on your
needs. For me, it is a revolutionary way of doing things, making a system
customisation a lot easier since the changes will always be saved somewhere, and
easy to deploy without the use of complicated scripts or any other workarounds.

If you are convinced, that's great for you, I've done my job and I hope you
enjoy your journey in this new concept of operating system.

There'll be some important links below for you to dive down and understand
better how it works beforing moving to it. it is also possible to only install
the Nix package manager on your current operating systems with all the great
functionalities, like reproducible development environments, rollback, different
version and much more.

### Notes and references

1. [How Nix works](https://nixos.org/guides/how-nix-works)
2. [Nix official documentation](https://nix.dev)
3. [Nix Pills - A tutorial introduction into Nix](https://nixos.org/guides/nix-pills/pr01)
4. [NixOS Manual](https://nixos.org/manual/nixos/stable)
