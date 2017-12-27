# Dotfiles

```
ln -nfs ~/.dotfiles/zshrc ~/.zshrc
ln -nfs ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -nfs ~/.dotfiles/vimrc ~/.vimrc
ln -nfs ~/.vimrc ~/.config/nvim/init.vim
ln -nfs /Users/craig/.dotfiles/tmuxline.conf /Users/craig/.tmuxline.conf
```

# Fonts
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```

# Tmux plugins
```
git clone https://github.com/tmux-plugins/tpm /Users/craig/.tmux/plugins/tpm
```
