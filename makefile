wsl: 
	mkdir -p ~/.local/share/fonts
	cp fonts/*.TTF ~/.local/share/fonts/
	cp fonts/*.TTC ~/.local/share/fonts/
	fc-cache -fv

mac:
	cp fonts/*.TTF ~/Library/Fonts/
	cp fonts/*.TTC ~/Library/Fonts/
	sudo atsutil databases -remove
	atsutil server -shutdown
	atsutil server -ping