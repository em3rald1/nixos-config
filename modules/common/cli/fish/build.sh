if [[ -n "$FISH_HOME" ]]; then 
  mkdir -p $HOME/.config/fish
  ln -sf $PWD/config/* $HOME/.config/fish
fi
