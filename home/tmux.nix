{ config, pkgs, ... }:
{
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
}



