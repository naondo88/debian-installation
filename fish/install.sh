sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

sudo apt install ripgrep
sudo apt install fd-find
sudo apt install exa

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher install jorgebucaran/nvm.fish
fisher install IlanCosman/tide@v6
