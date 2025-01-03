{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		waybar
		rofi-wayland
		swww
		hyprcursor
		catppuccin-cursors.frappeDark
	];
}
