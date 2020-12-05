# Z shell Configuration

The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting. Zsh is an extended Bourne shell with many improvements, including some features of Bash, ksh, and tcsh.

macOS Catalina, released in October 2019, adopted Zsh as the default shell, replacing Bash.

## The Zsh Startup Files

Like most shells, zsh processes a number of system and user startup files. It is very important to understand the order in which each file is read, and what conditions cause various files to be ignored. Otherwise, you may be entering commands and configurations into your startup files that aren't getting seen or executed by zsh.

- `$ZDOTDIR/.zlogin`
  zlogin should contain commands that should be executed only in login shells.
  zlogin is not the place for alias definitions, options, environment variable settings, etc.;
  as a general rule, it should not change the shell environment at all.
  Rather, it should be used to set the terminal type and run a series of external commands (fortune, msgs, etc).

- `$ZDOTDIR/.zlogout`
  .zlogout is sourced when login shells exit.

- `$ZDOTDIR/.zprofile`
  zprofile is similar to zlogin, except that it is sourced before zshrc.
  zprofile is meant as an alternative to zlogin for ksh fans; the two are not intended to be used together, although this could certainly be done if desired.

- `$ZDOTDIR/.zshrc`
  .zshrc is sourced in interactive shells.
  It should contain commands to set up aliases, functions, options, key bindings, etc.

- `$ZDOTDIR/.zshenv`
  .zshenv is sourced on all invocations of the shell, unless the -f option is set.
  It should contain commands to set the command search path, plus other important environment variables.
  .zshenv should not contain commands that produce output or assume the shell is attached to a tty.

## The Startup Process

When zsh starts up, the following files are read (in order):

- First, read /etc/zshenv, followed by `$ZDOTDIR/.zshenv`.
  - If the RCS option is unset in this system file, all other startup files are skipped.
- IF is a login shell, read /etc/zprofile , followed by `$ZDOTDIR/.zprofile`.
- IF is interactive, read /etc/zshrc , followed by `$ZDOTDIR/.zshrc`.
- IF is a login shell, read /etc/zlogin , followed by `$ZDOTDIR/.zlogin`.

ZDOTDIR is set to the user's home directory by default.
To look in another directory, set ZDOTDIR to where you'd like zsh to look.

### Load Order for Interactive shell

- `$ZDOTDIR/.zshenv`
- `$ZDOTDIR/.zprofile`
- `$ZDOTDIR/.zshrc`
- `$ZDOTDIR/.zlogin`

### Load Order when invoking `zsh --login`

when invoking commands using `zsh --login` a subset of startup files are loaded.

- `$ZDOTDIR/.zprofile`
- `$ZDOTDIR/.zlogin`

## Logging Out

When a user logs out,

- First /etc/zlogout is read, followed by `$ZDOTDIR/.zlogout`.

## Notes

loading plugins in `$ZDOTDIR/.zprofile` will allow for invoking defined aliases within scripts but be aware that system config in /etc/zshrc may override settings loaded in zprofile.
