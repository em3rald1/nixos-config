mkdir -p $HOME/.config/hypr
ln -sf $PWD/hyprland.conf $HOME/.config/hypr
ln -sf $PWD/hyprpaper.conf $HOME/.config/hypr
ln -sf $PWD/wallpaper.jpg $HOME/.config/hypr

cd programs/dunst
./build.sh
cd ../kitty
./build.sh
cd ../rofi
./build.sh
cd ../waybar
./build.sh
