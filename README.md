# Dotfiles

```
ln -nfs ~/.dotfiles/zshrc ~/.zshrc
ln -nfs ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -nfs ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.vimrc ~/.config/nvim/init.vim
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
ln -nfs /Users/craig/.dotfiles/tmuxline.conf /Users/craig/.tmuxline.conf
