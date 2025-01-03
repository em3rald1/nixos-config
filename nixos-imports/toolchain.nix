{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		neovim
		vim
		fish
		yazi
	];
}
