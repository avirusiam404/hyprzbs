# Этот конфиг просто збс
made by avirusiam404

> install yay:
> ```bash
> sudo pacman -S --needed git base-devel
> git clone https://aur.archlinux.org/yay.git yaybuild
> cd yaybuild
> makepkg -si
> ```
>
> if u dont have dm manager install lightdm:
> ```bash
> yay -Sy --needed lightdm
> sudo systemctl enable lightdm
> ```
>
> install packages:
> ```bash
> yay -Sy --needed playerctl alacritty hypr hyprlauncher flameshot wlogout fish starship brightnessctl waybar python-pywal16 cava ttf-hack-nerd swww nvim pyenv
> ```
>
> replace URHOME path and URSCRIPTS path here:
> ```
> .config/waybar/config.jsonc
> .config/alacritty/alacritty.toml
> scripts/mediaplayer.bash
> ```
>
> make a venv and install requirements inside scripts directory:
> ```bash
> python3 -m venv ./scripts/.venv
> source ./scripts/.venv/bin/activate
> python3 -m pip install -r ./scripts/requirements.txt
> ```
>
> copy .config elements to ur .config path:
> ```bash
> cp ./.config/* $HOME/.config -r
> ```
>
> reboot ur pc:
> ```
> sudo reboot
> ```
