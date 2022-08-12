# .dotfiles
Collection of various config files

# install packages

```
sudo apt install stow neovim python3 python3-neovim tmux curl fzf ripgrep fd-find
```

# clone

```
git clone https://github.com/talorion/.dotfiles
cd .dotfiles/
```

# change to zsh as default shell

```
chsh -s $(which zsh)
stow zsh/
```

# install oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# install nvim plugins

```
stow nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa
nvim +'TSInstall python' +qa
```

# install python packages

```
pip3 install "python-lsp-server[all]" black
```

# ubuntu solid background colour
```
gsettings set org.gnome.desktop.background picture-options 'none'
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#000000'
gsettings set org.gnome.desktop.background color-shading-type 'vertical'
```
