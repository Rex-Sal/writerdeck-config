{ config, pkgs, ... }:
{
	home = {
		username = "rxsl";
		homeDirectory = "/home/rxsl";
		stateVersion = "26.05";
	};

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

	programs.tmux = {
		enable = true;
		baseIndex = 1;
		historyLimit = 1000;
		keyMode = "vi";
		#mouse = true;
		#prefix = "C-Space";
		#terminal = "xterm-256-color";
		escapeTime = 0;
		extraConfig = ''
			# Open panels in pwd
			bind '"' split-window -v -c "#{pane_current_path}"
			bind % split-window -h -c "#{pane_current_path}"

			# Shift Alt vim keys to switch windows
			bind -n M-H previous-window
			bind -n M-L next-window

			# Sets Ctrl <SPACE> as prefix
			unbind C-b
			set -g prefix C-Space
			bind C-Space send-prefix

			bind -n F6 run-shell 'brightnessctl set +10%'
			bind -n F5 run-shell 'brightnessctl set 10%-'

			set -g status-position top
			set-window-option -g status-right "Battery: #(acpi -b | grep -m2 -o -P '.{0,2}%' | paste -sd' ' -)"

			set -s escape-time 0

		'';
	};	

	programs.ssh = {
		enable = true;
		addKeysToAgent = "yes";	
	};

  programs.keychain = {
    enable = true;
    keys = [ "rxsl_gh" ];
    extraFlags = [ "--quiet" ]; 
  };

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
	

	programs.vim = {
		enable = true;
		defaultEditor = true;
		#package = pkgs.vim-full;
		plugins = with pkgs.vimPlugins; [ vim-airline ];
		settings = { ignorecase = true; };
		extraConfig = ''
			set nocompatible
			set number
			set relativenumber
			set smartindent
			set tabstop=2
			set shiftwidth=2
			set smartcase
			set incsearch
			colorscheme blue
			set wrap
			set linebreak
		'';	
	};
}



