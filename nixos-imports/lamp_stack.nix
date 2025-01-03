{ pkgs, ... }:

{
	services = {
		httpd = { 
			enable = true;
			enablePHP = true;
			virtualHosts.localhost.documentRoot = "/var/www/apache";
		};
		mysql = {
			enable = true;
			package = pkgs.mariadb;
			ensureUsers = [
				{
					name = "root";
					ensurePermissions = {
						"*.*" = "ALL";
					}; 
				}
			];
		};
	};
}
