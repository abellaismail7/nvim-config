#!/bin/bash

[[ -d "$HOME/bin" ]] || mkdir "$HOME/bin"

cd "$HOME/bin"
FILE="nvim-macos.tar.gz"
nvim --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "downloading nvim..."
	curl -# -OL 'https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-macos.tar.gz'
	tar xzf nvim-macos.tar.gz
	rm $FILE
	ln -s nvim-macos/bin/nvim nvim
fi

tput setaf 2;
echo "nvim [installed]"
tput init;

FILE2="clangd-mac-14.0.3.zip"
clangd --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "downloading clangd..."
	curl -# -OL "https://github.com/clangd/clangd/releases/download/14.0.3/$FILE2"
	unzip -q $FILE2
	rm $FILE2
	mv clangd_* clangd_dir
	ln -s clangd_dir/bin/clangd clangd
fi

tput setaf 2;
echo "clangd [installed]"
tput init;

FILE3="ripgrep-13.0.0-x86_64-apple-darwin.tar.gz"
rg --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "downloading ripgrep"
	curl -# -OL "https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-apple-darwin.tar.gz"
	tar xzf $FILE3
	rm $FILE3
	mv ripgrep-* rg_dir
	ln -s rg_dir/rg rg
fi

tput setaf 2;
echo "ripgrep [installed]"
tput init;

FILE4="fd-v8.4.0-x86_64-apple-darwin.tar.gz"
fd --version > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "downloading fd"
	curl -# -OL "https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-v8.4.0-x86_64-apple-darwin.tar.gz" 
	tar xzf $FILE4
	rm $FILE4
	mv fd-* fd_dir
	ln -s fd_dir/fd fd
fi

tput setaf 2;
echo "fd [installed]"
tput init;

echo $PATH | grep -E ":$HOME/bin[ /]*:" > /dev/null 2>&1
if [ $? -ne 0 ]; then
	echo "PATH+=':$HOME/bin'" >> "$HOME/.zshrc"
	export PATH+=':$HOME/bin'
fi


if [[ -d $HOME/.config/nvim ]]; then
	git -C $HOME/.config/nvim remote -v | grep -q "abellaismail7/config.nvim"
	if [[ $? -eq 0 ]]; then
		echo "pulling from abellaismail7/config.nvim"
		git -C $HOME/.config/nvim pull -q
	else
		echo "an other nvim_config exists .. moving it to $HOME/.config/old_nvim"
		mv $HOME/.config/nvim $HOME/.config/old_nvim
		echo "cloning from abellaismail7/config.nvim"
		git clone -q https://github.com/abellaismail7/config.nvim.git $HOME/.config/nvim
	fi
else
	echo "cloning from oussamakrich/nvim-config"
	git clone -q https://github.com/abellaismail7/config.nvim.git $HOME/.config/nvim
fi
