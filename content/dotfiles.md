;title=Dotfiles
;navlink=Dotfiles

# Dotfiles
---
As a GNU/Linux user, I am obligated to share my dotfiles (hidden files with . in the beginning of the name, usually configuration files in ~/.config). I'll also put in other stuff that might matter.
<break>

![Desktop](./pics/desktop.png)
<break>
![Desktop2](./pics/desktop2.png)
<break>
**OS**: [Gentoo Linux](https://www.gentoo.org/)\
**Shell**: bash\
**Icons**: [SE98](https://www.gnome-look.org/p/1581320)\
**Font**: [mononoki](https://madmalik.github.io/mononoki/)\
Wallpaper: [link](./pics/wallpaper.jpg)\
**Colorscheme**: [nord](https://www.nordtheme.com/)\
**Window manager**: [dwm](https://github.com/Toasterbirb/dde/tree/dev)\
**GTK Theme**: [CDE / Motif theme](https://www.gnome-look.org/p/1231025)\
**Terminal**: [Alacritty](https://github.com/alacritty/alacritty) [alacritty.yml](./dotfiles/alacritty.yml) | [st](https://st.suckless.org/) [config.def.h](https://github.com/Toasterbirb/dde/blob/main/st/config.def.h)\
Filemanager: [lf](https://github.com/gokcehan/lf) [lfrc](./dotfiles/lfrc) [lp.sh](./dotfiles/lp.sh) [lfcd.sh](./dotfiles/lfcd.sh)\
<br>
**Shell prompt**: `PS1='[\u@\h \W]\$ '`\
<br>

---

## Notable stuff in .bashrc
<details>
	<summary>Use mpv as a music player</summary>

### Dependencies
- mpv

### Code
```block
alias mpva='mpv --loop-playlist --shuffle=yes --volume=40 --no-video --no-audio-display ./*'
```

### Usage
Just navigate to a directory and run 'mpva'. Make sure to organize your music into directories as if they were different playlists. You could also create symlinks to have one song in multiple "playlists" at the same time.

</details>

<details>
	<summary>Translate Swedish text (or other languages) in pictures</summary>
	
#### Dependencies
- tesseract
- scrot
- [translate-shell](https://www.soimort.org/translate-shell/)

#### Code
```block
alias swe='scrot -s /tmp/translate.png && \
trans -b swe:fi "$(tesseract -l swe /tmp/translate.png stdout 2>/dev/null)" && \
	rm /tmp/translate.png'
```

#### Usage
Run the `swe` alias (or make this a script that is in PATH), select the area you want to translate and the translation should show up in the terminal. If you are going to make this into a script, you will need another way to show the translation (dunst etc.)
<break>
</details>

<details>
	<summary>Cute root password prompt</summary>

#### Dependencies
- sudo (there might be some similar variable for doas)

#### Code
```block
export SUDO_PROMPT="(* ^ ω ^) Mayw I hav ur passwrd sir: "
```

#### Preview
![Password prompt preview](./pics/password_prompt.png)
</details>
