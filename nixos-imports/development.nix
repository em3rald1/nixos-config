{ configs, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		gleam
		nodejs_23
		python314
		libgcc
		git
	];
}
