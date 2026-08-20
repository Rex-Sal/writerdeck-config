{ config, pkgs, ... }:
{
	programs.git = {
		enable = true;
		userName = "Rex-Sal";
		userEmail = "273584355+Rex-Sal@users.noreply.github.com";
		signing = {
			key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIONlms54ym43Hw2JyShNYIxPGhDYISfm1hex/VLXl3f3 273584355+Rex-Sal@users.noreply.github.com";
			signByDefault = true;
		};
		settings = {
			gpg.format = "ssh";
		};
		# Use `cache` or `store`, or none
		extraConfig = {
			init.defaultBranch = "main";
			credential.helper = "cache"; # Or `store`, or "" (empty string to disable entirely)
		};
	};
}



