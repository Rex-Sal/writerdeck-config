{ config, pkgs, ... }:
{
	programs.bash = {
		enable = true;
		shellAliases= {
			ll = "ls -s";
			cl = "clear";
			cdl = "cd && clear";
			v = "vim";
			rebuild = "sudo nixos-rebuild switch --flake .#writerdeck";
			fetch = "fastfetch";
		};	
	};
}



