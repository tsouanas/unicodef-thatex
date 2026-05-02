default:
	/usr/bin/env unicodef.py defs/* outfiles

install:
	mkdir -p ~/.unicodef
	cp -p outfiles/* ~/.unicodef

xcomposeinstall: install
	cp -i examples/.XCompose ~/.XCompose

macosinstall: install
	mkdir -p ~/Library/KeyBindings
	rm -f ~/Library/KeyBindings/DefaultKeyBinding.dict
	cp -f ~/.unicodef/unicodefs.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

uninstall:
	rm -rf ~/.unicodef

xcomposeuninstall:
	rm -f ~/.XCompose

macosuninstall: uninstall
	rm -f ~/Library/KeyBindings/DefaultKeyBinding.dict

clean:
	rm -f outfiles/*

