;title=Playing games from the Epic Games Store on Linux

# Playing games from the Epic Games Store on Linux
---
EGS ([Epic Games Store](https://www.epicgames.com/store/en-US/)) has been spewing out free games for a really long time now. One thing they have yet to give awway though is a native Linux client. There are a few options out there to install and play games from EGS on Linux, but its not as simple as Steam etc. One way is to install the Epic Games Launcher with wine, but imo that is the worst way.<break>

## Table of contents
* [Requirements](#requirements)
* [Setup](#setup)
* [Installing Games](#installing_games)
* [Adding the game to Lutris](#adding_the_game_to_lutris)
* [Configuring the wine prefix in Lutris](#configuring_the_wine_prefix)

;header=requirements
## Requirements
Here's what you need to get your *Epic Games* (pun not intended) running on Linux:
* [Lutris](https://lutris.net/). A game launcher that we will be using to manage wine prefixes
* [Legendary](https://github.com/derrod/legendary). FOSS alternative for Epic Games Launcher. We will be using it for downloading the games and installing them
* [Proton](https://github.com/ValveSoftware/Proton/) or [Proton GE](https://github.com/GloriousEggroll/proton-ge-custom). Wine runners that we will be using. Has greater game compatibility and performance than wine staging or lutris wine.

;header=setup
## Setup
### Lutris
Installation steps depend a lot on the distro, but on Arch Linux a simple `sudo pacman -S lutris` should do the job.

### Legendary
Same as with lutris. On Arch Linux there's [legendary](https://aur.archlinux.org/packages/legendary/) in the AUR. On other distros you might have to compile it from source following the steps in their [github](https://github.com/derrod/legendary) repository or just download the latest [release](https://github.com/derrod/legendary/releases).

### Proton
Download the latest release from either github repository. Then extract its contents into *~/.local/share/lutris/runners/wine*.

;header=installing_games
## Installing Games
Installing games via legendary is fairly simple. First, you'll need to authenticate your Epic account with the command `legendary auth`. It will open a browser window, where you can login to your Epic account and then copy the **sid** string from the json string and paste it into the terminal window when legendary asks for it.

After you have authenticated, you can list all of your games with `legendary list-games`. It will print a huge wall of text containing the games names and their **app names**. The **app name** is used when you tell legendary what game to install. If you can't be bothered to find the game you want to install from the text dump manually, you can use grep. Example:
```block
[toasterbirb@tux ~]$ legendary list-games | grep -i "hitman"
[cli] INFO: Logging in...
[Core] INFO: Trying to re-use existing login session...
[cli] INFO: Getting game list... (this may take a while)
 * HITMAN (App name: Barbet | Version: 4226454)
[toasterbirb@tux ~]$
```
In this case the name that you install the game HITMAN with would be "Barbet". To install the game, I would run `legendary install Barbet`. To change the location the games are going to be installed into, you can configure legendary using the file located at *~/.config/legendary/config.ini*. You can create it manually if it doesn't exist already. This is my configuration file as an example:
```block
[Legendary]
log_level = debug
install_dir = /home/toasterbirb/Games
; Disables the automatic update check
disable_update_check = false
; Disables the notice about an available update on exit
disable_update_notice = true
```
The **install_dir** isn't a huge deal though. You can move the game files around the filesystem after the installation is finished if you think you aren't going to need any updates for that game in the future.

;header=adding_the_game_to_lutris
## Adding the game to Lutris
This is the important part. Legendary can launch games by itsef, but its configuration is quite difficult. Also games run with legendary usually don't have the best performance due to bad default settings.<break>

Adding a new game to Lutris is a simple as clicking the "+" -button and filling in the text fields in the first tab that it opens up. The runner should be set to "Wine (Runs Windows games)". Then click save.

Now that the game is added to Lutris, we can begin the configuring.

;header=configuring_the_wine_prefix
## Configuring the wine prefix in Lutris
This is the part where most of the magic happens and can sometimes be a bit complicated. The amount of steps you need to take to get a game running depends heavily on the game. Offline games are usually easier than online games for example. In the case of HITMAN for example, I had to copy some launch options from legendary to lutris so that the game would authentica properly with Epic servers. HITMAN is an extreme scenario though and this step usually isn't required.<break>

To configure a game in Lutris, right click the game you want to configure and choose the option *Configure*. I will be configuring a game called "Absolute Drift". To get most games running, these steps should be enough:
1. Game options tab
	* Set the **executable path** to the games executable. Its location depends on where you set legendary games to install to. In my case this is *absolutedrift.exe*. The default location is *~/legendary*.
	* Set the **Wine prefix** path to the games location. In my case this would be *~/Games/AbsoluteDrift*. If you have launched the game with legendary at some point, you can point the wine prefix to the prefix that legendary had created.
2. Runner options tab
	* Set **Wine version** to the Proton version you downloaded earlier in [setup](#setup) phase. I will be using Proton 6.3. If the Proton version doesn't show up in the list, make sure that you extracted the Proton release properly into the lutris wine runners directory. For example I have Proton 6.3 locate in a path like this: *~/.local/share/lutris/runners/wine/Proton 6.3*.
	* Enable DXVK in case its disabled
	* Enable VKD3D in case its disabled
	* Disable Esync (in case of Proton, it doesn't support Esync, or at least didn't support for me)

This should be enough for most games. DXVK and VKD3D can be toggled on and off in case the game doesn't work and you need to do some troubleshooting. Also trying out different Proton or Proton GE versions can be required. In my case, *Absolute Drif* had some rendering issue that was solved by disabling **Xephyr Fullscreen** in the **System options** tab. Troubleshooting is a skill you will learn over time by setting up multiple games. It will mostly be trial and error in the beginning, but after some time it will become easier.<break>

Here is a picture of the game running and me drifting away like a pro
<break>
![Absolute drif](../pics/guides/egs_guide/absolute_drift.jpg)
