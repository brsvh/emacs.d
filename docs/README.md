# emacs.d

[![img](https://img.shields.io/badge/cachix-brsvh-blue.svg)](https://brsvh.cachix.org) [![img](https://github.com/brsvh/emacs.d/actions/workflows/ci.yaml/badge.svg)](https://github.com/brsvh/emacs.d/actions)


## Overview

Emacs.d, my personal Emacs configuration, is managed using Nix[^1].  I
employ Twist[^2] for the management and construction of my configuration
and Emacs Lisp Packages.  I use the use-package[^3] distributed with
Emacs to manage my package configuration.

There are several subdirectories:

- `docs` holds the source code for documentation of my configuraiton.
- `elpa` holds the all ELPA dependencies infomation, these are
  automatically updated, *NEVER EDIT THEM MANUALLY*.
- `lisp` holds the Emacs Lisp source code of my package.
- `melpa` holds my customized MELPA[^5] recipes[^6].
- `nix` holds my Nix source code.
- `org` holds my literate configuraitons.



## Getting Started

If you wish to directly glimpse my Emacs configuration, you need to
ensure that you have installed the latest Nix, and then simply execute
the following commands.

If you are a Wayland user, you can use the pgtk version.

``` shell
nix run github:brsvh/emacs.d#pgtk
```

If you are a character-only (tty) user, you can use the nogui version.

``` shell
nix run github:brsvh/emacs.d#nogui
```

If you need to run on X11, you can use the x11 version.

``` shell
nix run github:brsvh/emacs.d#x11
```


### Use with home-manager

emacs.d also provides a home-manager[^4] module. This module provides a
rewrap of the Twsit module, including presets for some of Twsit options.

``` nix
{
  inputs = {
    brsvh-emacs.url = "github:brsvh/emacs.d/main";
    home-manager.url = "github:nix-community/home-manager/master";
  };

  output = { brsvh-emacs, home-manager, ... } @ inputs: {
    homeConfigurations.YOUR-CONFIGURATION-NAME =
      home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        modules = [
          brsvh-emacs.homeModules.twist
        ];
      };
  };
}
```

The source files for this module are located in the `nix/homeModules`
directory.


### Batch mode

Emacs permits the execution of Emacs Lisp scripts in a non-interactive
mode, referred to as **Batch Mode**, which is initiated by appending the
`--batch` parameter when launching Emacs.  In most instances, I want to
execute scripts or evaluations while loading my own Emacs configuration.
However, achieving this by appending `--load INIT_FILE_PATH` to `nix run
github:brsvh/emacs.d#nogui -- --batch` is not straightforward, as the
wrapper creation and the specified temporary `user-emacs-directory` are
constantly changing.  Consequently, I have provided a separate package
named `batch` for script execution, as demonstrated below:

``` shell
nix run github:brsvh/emacs.d#batch -- --eval '(message "hello")'
```


## Documentation

This project intends to furnish two categories of documentation.  One
pertains to the usage of my Emacs configuration or Emacs Lisp packages,
while the other relates to my specific Emacs configuration.  I will
provide individual explanations for the former, maintaining them in the
`docs` directory.  As for the latter, my configuration is composed in a
literate programming way, thus you can get detailed interpretations and
explanations by perusing the files in the `org` directory.


## License

This work is free.  You can redistribute it and/or modify it under the
terms of The GNU General Public License v3.0.  You should have received
a copy of it.  See the COPYING file for more details.  If you did not
recive it, see <https://www.gnu.org/licenses/> for more details.


[^1]: Nix, <https://nixos.org/>

[^2]: Twist, <https://github.com/emacs-twist/twist.nix>

[^3]: use-package, <https://github.com/jwiegley/use-package>

[^4]: melpa, <https://melpa.org>

[^5]: melpa recipe format, <https://github.com/melpa/melpa#recipe-format>

[^6]: Home Manager, <https://nix-community.github.io/home-manager>
