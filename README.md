# unicodef-thatex

This project consist of my own [unicodef] input files, mostly
[ThaTeX]-influenced, together with their compiled outputs.
You can install and use them without installing [unicodef].

For each input file (under `defs/`) see the correpsonding
markdown file under outfiles for a list of all sequences
defined by it.  The file [unicodefs.md] contains all of them.

See [unicodef] for more info on how to install and use these.

## Using make(1)

Also included is a Makefile that facilitates building and
installing from within the repo.  Start by cloning:
```sh
git clone https://github.com/tsouanas/unicodef-thatex
```
Now, inside the `unicodef-thatex` directory you can run:

* `make` runs `unicodef.py` on `defs/*` generating files at `outfiles/`;
* `make install` installs the compiled files, i.e., copies all oufiles to `~/.unicodef/`;
* `make xorginstall` installs and then creates/replaces `~/.XCompose` to make use of the installed files;
* `make macosinstall` installs and then copies `unicodefs.dict` to `~/Library/KeyBindings/DefaultKeyBinding.dict`;
* `make uninstall` removes `~/.unicodef/`;
* `make macosuninstall` uninstalls and then removes `~/Library/KeyBindings/DefaultKeyBinding.dict`;
* `make xorguninstall` uninstalls and then removes `~/.XCompose`;
* `make clean` removes all outfiles.

Since this repo already comes with the compiled outfiles, you do not need to
run `make` in order to build them. (You only need to do this if you want to
edit the input files or add your own.)
Note that `make` is the only one that requires [unicodef]; the rest of the
recipes works without it.

**Warning for macOS users.**
If you are already using a `DefaultKeyBinding.dict` then `make macosinstall`
will overwrite the existing file, and `make macosuninstall` will delete it.

**Warning for Xorg users.**
If you are already using a `~/.XCompose` then `make xorginstall`
will overwrite the existing file, and `make xorguninstall` will delete it.


[unicodefs.md]: outfiles/unicodefs.md
[unicodef]:     https://github.com/tsouanas/unicodef
[ThaTeX]:       https://github.com/tsouanas/thatex
