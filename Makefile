default:
	/usr/bin/env unicodef.py defs/* outfiles

install:
	mkdir -p ~/.unicodef
	cp -p outfiles/* ~/.unicodef

xorginstall: install
	cp -f examples/.XCompose ~/.XCompose

macosinstall: install
	mkdir -p ~/Library/KeyBindings
	rm -f ~/Library/KeyBindings/DefaultKeyBinding.dict
	cp -f ~/.unicodef/unicodefs.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

uninstall:
	rm -rf ~/.unicodef

xorguninstall: uninstall
	rm -i ~/.XCompose

macosuninstall: uninstall
	rm -i ~/Library/KeyBindings/DefaultKeyBinding.dict

clean:
	rm -f outfiles/*

