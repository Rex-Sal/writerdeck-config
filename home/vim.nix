{ config, pkgs, ... }:
{
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
			colorscheme evening
			set wrap
			set linebreak
		'';	
	};
}



