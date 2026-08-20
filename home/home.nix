{ config, pkgs, ... }:
{
  imports = [
    ./bash.nix 
    ./git.nix
    ./network.nix
    ./tmux.nix
    ./vim.nix
  ];

	home = {
		username = "rxsl";
		homeDirectory = "/home/rxsl";
		stateVersion = "26.05";
	};
}



