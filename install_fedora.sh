mkdir ~/.fonts
wget -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Iosevka.zip
unzip font.zip -d ~/.fonts/
fc-cache -fv
sudo dnf copr enable solopasha/hyprland
sudo dnf install pavucontrol blueman-manager
sudo dnf install alacritty dolphin rofi hyprlock slurp grim satty hyprpaper hyprlock dunst
ssh-keygen -t ed25519
mkdir ~/.config/nvim

echo "Install ssh key to github"
cat ~/.ssh/id_ed25519.pub
read
cd ~
git clone git@github.com:simeng/dotfiles
git clone git@github.com:simeng/nvim

cd ~/.config
for i in ~/dotfiles/.config/*; do
	dirname="$(basename $i)"
	mkdir "$dirname"
	cd "$dirname"
	ln -s $i .
	cd ..
done
