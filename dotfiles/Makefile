test:
	@echo -e "\e[32m myep this works\!\e[0m"
	@echo -e "\e[32m run 'make dots' to copy dots to ~/.config!\e[0m"

dots:
	@echo -e "\e[34m copying all application dots over to .config\e[0m"
	cp -r rmpc mpd zathura niri matugen helix ghostty waybar fuzzel sunsetr ~/.config	
	cp starship.toml ~/.config
	@echo -e "\e[34m copying zshrc, walls, scripts to home directory\e[0m"
	cp zsh/.zshrc ~
	cp -r scripts ~
	cp -r walls ~
	@echo -e "\e[32m done\!\e[0m"

.PHONY: test dots
