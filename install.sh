ASDF=$HOME/.asdf/bin/asdf

install_neovim()
{
  curl -L --create-dirs -o nvim \
    --output-dir ~/.local/bin \
    https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage
  chmod +x $HOME/.local/bin/nvim
  export PATH="$HOME/.local/bin/nvim:$PATH"
}

install_asdf ()
{
  if test -f $HOME/.asdf/asdf.sh; then
    echo "asdf installed on system. Skipping it's installation"
  else
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.1
    echo '. "$HOME/.asdf/asdf.sh"' >> $HOME/.bashrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> $HOME/.bashrc
    . "$HOME/.asdf/asdf.sh"
    . "$HOME/.asdf/completions/asdf.bash"
  fi
}

setup_asdf ()
{
  echo "Installing nodejs"
  $ASDF plugin add nodejs
  $ASDF install nodejs 19.6.0
  echo "Node was installed sucessfully!"
  $ASDF global nodejs 19.6.0

  echo "Installing rust"
  $ASDF plugin add rust
  $ASDF install rust 1.66.0
  echo "Rust was installed sucessfully!"
  $ASDF global rust 1.66.0
}

install_lvim ()
{
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
}

install_dotfiles ()
{
  cp ./config.lua $HOME/.config/lvim/
}

install_neovim
install_asdf
setup_asdf
install_lvim
