;title=Void Linux Package Repository
;navlink=Void Repo

# Void Linux Package Repository
---
I recently (end of 2021) decided to hop to [Void Linux](https://voidlinux.org/). One of the things I instantly noticed was that it has way less packages compared to Arch Linux and since the AUR isn't there to fill up the gaps, I had to install some of the software from source. I thought to myself that this was the opportunity to learn how to package software.
<break>
This repository contains stuff that I felt like was worth packaging and might be useful. I do not own the rights to everything, but since the software is open source, I felt like I have the right to "distribute" the sources in binary packages per their licenses. To fulfill the requirements of GPLv3, I will link to the sources of the packages and list any changes/patches done to the program, if I'm not the developer of that program.

## How to use the repo
To use, create a file called `/etc/xbps.d/99-repo.conf` and add this line to it:
```
repository=https://raw.githubusercontent.com/Toasterbirb/void-repo/master
```

## Packages
List of current included packages:
<details>
	<summary>General</summary>

- [dde](https://github.com/Toasterbirb/dde)
- [mononoki-ttf](https://github.com/madmalik/mononoki/tree/master)
- [Typon](https://github.com/ihsuy/Typon)
- [ytfzf](https://github.com/pystardust/ytfzf)
- [xnotify](https://github.com/phillbush/xnotify)
</details>

## Issues
If the there are any problems with this repository, please let me know by sending me mail at git@toasterbirb.com.
<break>
Also, if you are the owner of any project listed above as a package and you want it taken out of the repository, feel free to let me know, and I'll take action as quickly as I can.
