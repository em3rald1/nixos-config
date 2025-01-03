{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		kitty
		dolphin
		librewolf
		telegram-desktop
		pavucontrol
		obs-studio
		ghostty
		goofcord
		(flameshot.override { enableWlrSupport = true; })
	];
}
