url="https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz"
cd /tmp
curl -OL "$url"
tar xzvf nvim-macos.tar.gz

mkdir ~/.local
mv nvim-osx64 ~/.local 

echo "PATH+=:~/.local/nvim-osx64/bin/" >> ~/.zshrc

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
