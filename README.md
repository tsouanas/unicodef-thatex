# unicodef-thatex

This project consist of my own [unicodef] input files, mostly
[ThaTeX]-influenced, together with their compiled outputs.

You can simply install and use the output files without
installing the compiler ([unicodef]).

Note that there is no input file called `unicodef`.
The outfiles named `unicodefs.*` contain all of the compiled sequences.
Which of these files you need depends on your system (see Installation below).

## Get

If you have some familiarity with the terminal,
it is recommended that you *clone* the github repository:

```sh
git clone https://github.com/tsouanas/unicodef-thatex
```

Next, follow the installation instructions (note that some
of the steps can be done via `make`; see below).

## Installation

⚠️ In what follows be cautious:

* `.XCompose` and `unicodefs.XCompose` are different files;
* `.unicodef` is a directory (folder) not a simple file;
* the `s` (plural) in the name `unicodefs.XCompose` and its absense in `.unicodef`.


### for BSDs and Linux

…or, in general, for systems that use XCompose of X11/Xorg.

#### Step 1: Make sure XCompose works

For example:

* for Debian, see https://wiki.debian.org/XCompose
* for Arch Linux, see https://wiki.archlinux.org/title/Xorg/Keyboard_configuration

You should map your <kbd>⎄ Compose</kbd> key to the one of your choosing like
<kbd>Right Alt</kbd> or <kbd>Alt Gr</kbd>.

You should be able to type `©` by hitting the keys <kbd>⎄ Compose</kbd><kbd>o</kbd><kbd>c</kbd>.
(Once installation is complete hitting the same sequence of keys should produce `∝` instead.)

⚠️ Some programs ignore this. Hopefully you can make them
behave by setting the environmental variables `$GTK_IM_MODULE` and
`$QT_IM_MODULE` to `xim`, and `$XMODIFIERS` to `@im=none`.
For example, if you are using a sh-like shell, add the following lines to
your shell configuration file
```sh
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS="@im=none"
```
Note that your shell only reads this file when it is run, so changes
in it will not affect current sessions.

**N.B.:** If you are not using `xim` alter the above lines accordingly.
In this case please let me know of what you are using and how you made
it work, so that I can possibly include it in these instructions.

#### Step 2: Install unicodef-thatex outfiles

Copy `unicodefs.XCompose` somewhere; for example,
in a directory called `.unicodef` inside your homedir.

#### Step 3: Get XCompose to read our sequences

If you already have some definitions in your `~/.XCompose` file,
it is better to place them in some other file and have it include
both your file as well as `unicodefs.XCompose`.

You may also be using the default, locale-based definitions of sequences
since they are loaded automatically if there is no `~/.XCompose` present.
This means that by creating a `~/.XCompose` _they will no longer be loaded_
unless you explicitly add the following line in it:

```
include "%L"
```

My sample `.XCompose` file (located under `examples/` in this repo) has
this line commented-out since I specifically want only my sequences to be
loaded and nothing else.  (I suggest you do the same and define your own
extra micros and macros that cover your needs instead of loading the whole
built-in locale sequences.)

A simple `.XCompose` file that consists only of the following line
should be enough:

```
include "%H/.unicodef/unicodefs.XCompose"
```

You can use `make` to copy (possibly overwriting) the included
`.XCompose` file to the appropriate place:

``` sh
make xcomposeinstall
```

Once you have done all that, reboot.

Now hitting <kbd>⎄ Compose</kbd><kbd>o</kbd><kbd>c</kbd> should produce
`∝` instead of `©`.

### Windows

Even though Windows does not use XCompose natively,
you can install a third-party program like [WinCompose]
which is an equivalent program (for our purposes) compatible
with XCompose files.

The `include` command works in WinCompose, so the same instructions
apply as for Xorg above, mutatis mutandis:

#### Step 1: Get WinCompose to work

Download [WinCompose] and follow its instructions to install it.

You should map your <kbd>⎄ Compose</kbd> key to the one of your choosing
like <kbd>Right Alt</kbd> or <kbd>Alt Gr</kbd>.

At this point you should be able to type `©` by hitting the keys
<kbd>⎄ Compose</kbd><kbd>o</kbd><kbd>c</kbd>.

#### Step 2: Install unicodef-thatex outfiles

(a) Create a directory called `.unicodef` under your homedir.
Usually your homedir in Windows is something like `C:\Users\yourusername`.
One way to open your homedir on Windows file browser is by hitting the
shortcut <kbd>Win</kbd>+<kbd>R</kbd>, and type `%USERPROFILE%` in the prompt.

(b) Place the file `outfiles/unicodefs.XCompose` inside this `.unicodef` folder.

#### Step 3: Get WinCompose to read our sequences

This step is the same as in the case of BSDs and Linux systems.
Follow the instructions on Step 3 above.

### for macOS

#### Step 0 (opt.): Install and configure Karabiner-Elements

If your keyboard can natively type the character `§` with a single
keystroke then this step is optional (and you may also leave it for later)
since you can access all of micros and macros easily.

**However** it is still more convenient and conventional to use a modifier
key like <kbd>⌘ Command</kbd>, <kbd>⌥ Option</kbd>, <kbd>Alt Gr</kbd>,
as a <kbd>⎄ Compose</kbd> key than typing the arbitrarily-chosen `§`.
So you are advised to proceed with this step.

The idea is to sacrifice one key so that each time it is pressed
it sends the special character `§` which unicodef uses by default
as a “leader” for micros and macros.

A good option is to sacrifice the <kbd>⌘ Right Cmd</kbd> key.
Note that your <kbd>⌘ Right Cmd</kbd> key will not function as a
command key anymore, but <kbd>⌘ Left Cmd</kbd> will remain
functional as a command key—get used to this.
Feel free to choose some other key if you prefer (changing what
needs to be changed in what follows).

In order to modify the behaviour of such modifier keys in this way
you need a third-party program like [Karabiner-Elements],
so install it and configure it.

In Karabiner-Elements you set up these modifications under the following settings path:

   Setting › Simple Modifications › For all devices

(If you want a per-keyboard configuration, select a specific keyboard instead of «For all devices».)

Exactly which modification will work for you depends on your keyboard type and on your macOS version.

The following options are known to work for certain combination:

* Option 1: `right_command → grave_accent_and_tilde`;
* Option 2: `right_command → non_us_backslash`;
* Option 3: `right_command → non_us_backslash` AND `non_us_backslash → grave_accent_and_tilde`.

`right_command` is under «Modifier keys»;  
`non_us_backslash` and `grave_accent_and_tilde` are under «Controls and symbols».

After setting this up, restart Karabiner-Elements from its menu,
quit (completely, as in `⌘-Q`) a program in which you want to test this
(for example the Terminal or your browser), launch the program again,
and while in typing mode press your <kbd>⌘ Right Cmd</kbd> key once.
You should see a `§` printed on your terminal.

If so, proceed to complete the rest of the steps below.

#### Step 1: Install unicodef

(a) Create `~/Library/KeyBindings` if it does not exist:

```sh
mkdir -p ~/Library/KeyBindings
```

(b) Copy `unicodefs.dict` to `~/Library/KeyBindings/DefaultKeyBinding.dict`

⚠️ **Warning.**
Do **NOT** symlink `DefaultKeyBinding.dict` as this makes a lot of
macOS programs ignore it!

Once you have done all that, reboot.

### for (Neo)Vim

If you use (Neo)Vim fron within your normal environment (in which you have
installed unicodef-thatex) there is no need to do anything special for
any particular program (like (Neo)Vim)—enjoy!

But if you want to have access to unicodefs natively in Vim's INSERT MODE
(which means that you can use them even from the console or remotely via
ssh for example) then do the following:

Place `unicodefs.vim` somewhere (for example, in `~/.unicodef/`) and
have your `.vimrc` source it:
```vim
source ~/.unicodef/unicodefs.vim
```

### Using make(1)

This is only relevant for BSD, Linux, and macOS users.

Also included is a Makefile that facilitates building and
installing from within the repo.  Start by cloning:
```sh
git clone https://github.com/tsouanas/unicodef-thatex
```
Now, inside the `unicodef-thatex` directory you can run:

* `make` runs `unicodef.py` on `defs/*` generating files at `outfiles/`;
* `make install` installs the compiled files to your homedir, i.e., copies all oufiles to `~/.unicodef/`;
* `make xcomposeinstall` creates/replaces `~/.XCompose` with the included one;
* `make macosinstall` installs and then copies `unicodefs.dict` to `~/Library/KeyBindings/DefaultKeyBinding.dict`;
* `make uninstall` removes `~/.unicodef/`;
* `make macosuninstall` uninstalls and then removes `~/Library/KeyBindings/DefaultKeyBinding.dict`;
* `make xcomposeuninstall` removes `~/.XCompose`;
* `make clean` removes all outfiles.

Since this repo already comes with the compiled outfiles, you do not need to
run `make` in order to build them. (You only need to do this if you want to
edit the input files or add your own.)
Note that `make` is the only one that requires [unicodef]; the rest of the
recipes works without it.

⚠️ **Warning for BSD / Linux (Xorg) users.**
If you are already using a `~/.XCompose` then `make xcomposeinstall`
will overwrite the existing file, and `make xorguninstall` will delete it.

⚠️ **Warning for macOS users.**
If you are already using a `DefaultKeyBinding.dict` then `make macosinstall`
will overwrite the existing file, and `make macosuninstall` will delete it.

## Keeping unicodef-thatex up-to-date

Windows users probably need to check manually if there are newer files
and manually download `unicodefs.XCompose` to replace their existing one.

For BSD/Unix/macOS users things are easier, of course.
Supposing you have cloned the repo locally with

```sh
git clone https://github.com/tsouanas/unicodef-thatex
```

do a `git pull` inside the `unicodef-thatex` directory to pull any recent changes

``` sh
git pull
```

and then run `make install` or `make macosinstall` accordingly.
(Refer to the section «Using make» for more details.)

## Usage (typing)

There are two kinds of sequences: **micro** and **macro**.

To use a *micro* sequence _σ_, single-hit the <kbd>⎄ Compose</kbd>
key and then type the sequence _σ_.

To use a *macro* sequence _σ_, *double-hit* the <kbd>⎄ Compose</kbd> key,
type the sequence _σ_, then hit the spacebar <kbd>␣ Space</kbd>.

Schematically:

* using a micro _σ_: <kbd>⎄</kbd>_σ_
* using a macro _σ_: <kbd>⎄</kbd><kbd>⎄</kbd>_σ_<kbd>␣</kbd>

Q: What is <kbd>⎄ Compose</kbd>?  A: You skipped the installation section, I guess, so:

* **In BSD / Unix / Windows** it is common to use <kbd>Alt Gr</kbd> for <kbd>⎄ Compose</kbd>.
* **In macOS** <kbd>⌘ Right Cmd</kbd>.
* **In Vim** (in INSERT MODE) we use <kbd> \ </kbd>: e.g., typing `f : \\nats  \\to  \\reals ` you get `f : ℕ → ℝ`.

### Examples

Typing
<kbd>f</kbd><kbd>u</kbd><kbd>n</kbd><kbd>⎄ Compose</kbd><kbd>c</kbd><kbd>,</kbd><kbd>⎄ Compose</kbd><kbd>a</kbd><kbd>\~</kbd><kbd>o</kbd>
or
<kbd>f</kbd><kbd>u</kbd><kbd>n</kbd><kbd>⎄ Compose</kbd><kbd>,</kbd><kbd>c</kbd><kbd>⎄ Compose</kbd><kbd>\~</kbd><kbd>a</kbd><kbd>o</kbd>
writes `função`.
In these examples I have used the **micros** `c,` and `,c` (either one produces `ç`), and also `a~` and `~a` (either of which produces `ã`).
As you can probably guess, you can output `Gödel` and `Erdős` by:
<kbd>G</kbd><kbd>⎄</kbd><kbd>:</kbd><kbd>o</kbd><kbd>d</kbd><kbd>e</kbd><kbd>l</kbd>
and
<kbd>E</kbd><kbd>r</kbd><kbd>d</kbd><kbd>⎄</kbd><kbd>"</kbd><kbd>o</kbd><kbd>s</kbd>
respectively.
(Here I am using the **micros** `:o` and `"o`.)

Typing <kbd>⎄</kbd><kbd>⎄</kbd><kbd>r</kbd><kbd>e</kbd><kbd>a</kbd><kbd>l</kbd><kbd>s</kbd><kbd>␣</kbd> simply writes `ℝ`.
In this example I have used the **macro** `reals` which produces `ℝ`.
Notice that, since it is a macro, I am starting with a double-struck ⎄ (<kbd>⎄</kbd><kbd>⎄</kbd>) and I also
need to strike the spacebar (<kbd>␣</kbd>) once I am done typing the sequence.
Thus to use the `reals` macro we need 8 keystrokes in total:
<kbd>⎄</kbd><kbd>⎄</kbd><kbd>r</kbd><kbd>e</kbd><kbd>a</kbd><kbd>l</kbd><kbd>s</kbd><kbd>␣</kbd>

### Some more examples of micros and macros defined

⚠️ The same symbol may have tons of different ways to type it.
A lot of sequences have shorter versions.

For example, typing
<kbd>⎄</kbd><kbd>⎄</kbd><kbd>f</kbd><kbd>o</kbd><kbd>r</kbd><kbd>a</kbd><kbd>l</kbd><kbd>l</kbd><kbd>␣ Space</kbd>
produces `∀`, but so does typing
<kbd>⎄</kbd><kbd>⎄</kbd><kbd>f</kbd><kbd>a</kbd>.
Even more, some micros also produce exactly the same character, now seen as a π-roted `A`
(<kbd>⎄</kbd><kbd>A</kbd><kbd>@</kbd><kbd>p</kbd>), or as a v(ertically)-flipped `A`
(<kbd>⎄</kbd><kbd>A</kbd><kbd>@</kbd><kbd>v</kbd>), etc.
Since I use this a lot a fast micro dedicated to it:
<kbd>⎄</kbd><kbd>A</kbd><kbd>A</kbd> also yields `∀`.

⚠️ Note that here <kbd>A</kbd> actually is the <kbd>⇧ Shift</kbd>-<kbd>a</kbd>.
You may have guessed it:
<kbd>⎄</kbd><kbd>a</kbd><kbd>@</kbd><kbd>p</kbd> produces `ɐ`, i.e., a `a`
that has been π-rotated.

Similarly, typing
<kbd>⎄</kbd><kbd>⎄</kbd><kbd>u</kbd><kbd>n</kbd><kbd>i</kbd><kbd>q</kbd><kbd>u</kbd><kbd>e</kbd><kbd>␣ Space</kbd>
produces `∃!`, but you get the same by <kbd>⎄</kbd><kbd>⎄</kbd><kbd>u</kbd><kbd>n</kbd><kbd>␣ Space</kbd>.

For the time being the best user guide of the various micros and macros
defined are the actual files with their defs.
It should be relatively easy to navigate these files if you open them
in an editor that understands Vim folds, and the comments should clear
up possible confusions.

## Adding your own custom micros and macros

For this you will need to install the compiler [unicodef].
Once you have done that, create your files under `defs/`,
for example `defs/mymicros_` or `defs/mymacros`.
Then use `make` to compile them:

``` sh
make
```

Any potential conflicts or redefinitions will be shown at this point,
so that you can decide how to proceed with them.
The new `unicodefs.*` files will now contain all of `unicodef-thatex`
sequences plus your own.  Go wild.

All this happens inside your repo directory.  In order to update the
files under `.unicodef` use `make install` (BSD / Unix) or
`make macosinstall` (macOS).

## Bugs

Please report any bugs you may find.  Examples of bugs:

1. a sequence producing different output than what it is supposed to produce;
1. a sequence named in an inconsistent way;
1. a sequence located in the wrong place.


[unicodefs.md]: outfiles/unicodefs.md
[unicodef]:     https://github.com/tsouanas/unicodef
[ThaTeX]:       https://github.com/tsouanas/thatex
[WinCompose]:   https://github.com/samhocevar/wincompose
