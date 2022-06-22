;title=Home nest
;navlink=Home

# Home Nest
---
Welcome to my internet property! I usually go by the name of 'ToasterBirb', love birbs (birds) and identify as a computer addict.<break>

I picked up HTML at 5th grade in elementary school, but actual programming languages came in at 8th grade. My personal favourites are C-based languages like C, C++ and C#. I have also dabbled into some other languages but haven't been able to wrap my head around them. I still remember sitting in some python class writing the assignments in C++, because I just couldn't think straight with the python syntax. If I will ever learn new languages, those will probably be Rust, Go or x86-assembly. Source code for this website is available [**here**](https://github.com/Toasterbirb/personal-website)

## Software
Here's a list of some open source softare software / scripts I have made in no particular order. I license pretty much everything under GPLv3, so feel free to use anything you'd like following the license terms accordingly

### Table of contents
* [Desktop](#desktop)
* [Games](#games)
* [Languages](#languages)
* [Media](#media)
* [Misc.](#misc)

---

;header=desktop
### Desktop
Desktop applications for Linux. Mostly forks of suckless applications with some tweaks to suit my personal needs / taste + dmenu scripts that don't fit to other categories

* [dde](https://github.com/Toasterbirb/dde)
> "Dynamic Desktop Environment", a combination of different programs (mostly suckless software) to create a lightweight desktop environment. Currently contains a window manager, statusbar, program launcher, lockscreen and a terminal emulator. Different components can also be installed separately by not running the installation script but rather using plain `make install` in the respective source directories

* [dwm](https://github.com/Toasterbirb/dwm)
> Standalone fork of the suckless [dwm](https://dwm.suckless.org/). Not updated anymore, please use [dde](https://github.com/Toasterbirb/dde) instead.

* [surf](https://github.com/Toasterbirb/surf)
> A fork of suckless [surf](https://surf.suckless.org/). Has a few patches, nothing special

* [dmenu](https://github.com/Toasterbirb/dmenu)
> A fork of suckless [dmenu](https://tools.suckless.org/dmenu/). Not updated anymore, please use [dde](https://github.com/Toasterbirb/dde) instead.

* [dmenu-bitwarden](https://github.com/Toasterbirb/dmenu-bitwarden)
> Script for accessing bitwarden vault with dmenu

* [dsteam](https://github.com/Toasterbirb/dsteam)
> dmenu launcher for Steam games

---

;header=games
### Games
Game projects and other video game related things

* [Birb2D](https://github.com/Toasterbirb/Birb2D)
> A simple game engine written in C++. Currently only supports 2D graphics with SDL, but might be able to do 3D in the future with GLFW and glad

* [Birb2D Interpolation demo](https://github.com/Toasterbirb/Birb2D-Interpolation-Demo)
> A technical demo for testing different features in Birb2D, mainly interpolation math, text components and path sorting. Was originally meant to be some tower defense game, but got turned into a testing sandbox instead.

* [Flappy Birb](https://github.com/Toasterbirb/Flappy-Birb)
> A Flappy Bird ripoff made with [Birb2D](https://github.com/Toasterbirb/Birb2D) 

* [Pong](https://github.com/Toasterbirb/Pong)
> The good old Pong made with [Birb2D](https://github.com/Toasterbirb/Birb2D)

* [SeedSplit](https://github.com/Toasterbirb/SeedSplit)
> A game speedrunning timer with splits. Made with [Birb2D](https://github.com/Toasterbirb/Birb2D)

* [Breakout](https://github.com/Toasterbirb/Breakout)
> Atari breakout clone made with [Birb2D](https://github.com/Toasterbirb/Birb2D)

* [LD50.exe](https://ldjam.com/events/ludum-dare/50/ld50-exe)
> Ludum Dare 50 game jam game made in a weekend with [Birb2D](https://github.com/Toasterbirb/Birb2D)

* [SDL2 installer](https://github.com/Toasterbirb/SDL2-installer)
> A short script for compiling and installing SDL2 from source on Linux in case the packages aren't available in the distributions package manager

---

;header=languages
### Languages
Software related to language learning or translation (mainly spoken / written languages, not programming languages)

* [jisho-cli](https://github.com/Toasterbirb/jisho-cli)
> CLI interface for [jisho.org](https://jisho.org/) (Japanese - English dictionary). Uses both web scraping and jisho.org API

* [goo-cli](https://github.com/Toasterbirb/goo-cli)
> CLI interface for the [goo.ne.jp](https://dictionary.goo.ne.jp/) online dictionary. (Japanese - Japanese dictionary). Uses web scraping

---

;header=media
### Media
All kinds of software related to image / video -processing and media consumption

* [clearpixel](https://github.com/Toasterbirb/clearpixel)
> Image processing script. A combination of waifu2x and imagemagick that helps with denoising / upscaling low quality high resolution pictures. Works the best with cartoonish styled images like manga / anime, but can work with other pictures as well (though the output will look a bit cartoonish)

* [dmenu-tube](https://github.com/Toasterbirb/dmenu-tube)
> A dmenu script for browsing youtube via the invidious API. Routes all traffic trough tor with SOCKS5 proxies and torsocks and views the videos with mpv

* [rofi-tube](https://github.com/Toasterbirb/rofi-tube)
> A rofi script for browsing youtube via invidious scraping. Displays videos with mpv

* [youtube-rss](https://github.com/Toasterbirb/youtube-rss)
> Script for extracting RSS-feed URLs from Youtube channel URLs


---

;header=misc
### Misc.
All kinds of random utilities. Mostly small command line applications

* [cli-timer](https://github.com/Toasterbirb/cli-timer)
> Countdown timer with desktop notification support written in C++

* [calculator](https://github.com/Toasterbirb/calculator)
> Simple calculator written in x86 assembly. Has a lot of flaws and is mostly just a small learning project. Answers above 9 are in ASCII format :D

* [x86 Assembly "Hello World"](https://github.com/Toasterbirb/assembly-hello-world)
> Quite self explanatory. Prints out "Hello world!" in its full glory

* [Caesar cipher](https://github.com/Toasterbirb/Caesar-cipher)
> A small program to encode and decode text with Caesar cipher written in C

* [KAMI-Red](https://github.com/Toasterbirb/kami-red)
> A Minecraft 1.12.2 cheating client forked from KAMI-Blue after the repository was archived. I mainly use this when playing on Constantiam. As for new features when compared to KAMI-Blue, there's bunnyhopping, fast ladder, auto breeding / shearing and a HUD overlay for highway building. There might also be some other changes that I'm forgetting

* [F-Droid privileged extension installer](https://github.com/Toasterbirb/fdroid-privileged-extension)
> An installer script for the F-Droid privileged extension. I use this script to reinstall the extension after system updates, because those sometimes wipe the extension from the system directories. <u>Please read trough the script carefully if you are considering using it!</u> Its made only my phone (Fairphone 3) in mind and might cause permanent damage in other cases.

* [Random Case](https://github.com/Toasterbirb/random-case)
> A small program to randomize the casing of a given string to make it look weird and goofy

* [birb](https://github.com/Toasterbirb/birb)
> Really originally named package manager for BirbOS, my old LFS [(Linux From Scratch)](https://www.linuxfromscratch.org/) distro. Uses stow to symlink binaries into /usr. Birb also has the functionality to extract binaries from .deb packages and includes scripts for looking up package source code from the [AUR](https://aur.archlinux.org/) and browsing the [appimage-hub](https://appimage.github.io/)

* [ReadingTimer](https://github.com/Toasterbirb/ReadingTimer)
> Android application for timing reading speed via averaging the spent time per page. Haven't touched the source code for many years, no clue if it still works
