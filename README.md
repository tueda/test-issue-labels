homebrew-form
=============

Homebrew formulae for [FORM](https://www.nikhef.nl/~form/) and related software.

[![Build Status](https://travis-ci.org/tueda/homebrew-form.svg?branch=master)](https://travis-ci.org/tueda/homebrew-form)

Quick start
-----------

1. Install [Homebrew](https://brew.sh/) (macOS) or
   [Linuxbrew](http://linuxbrew.sh/) (Linux).
2. Run `brew install tueda/form/<formula>`. Or tap this repository
   `brew tap tueda/form` and then `brew install <formula>`.
3. After tapping the repository, you can see the list of the formulae by
   `brew search tueda/form/`. `brew info tueda/form/<formula>` shows more
   information.

Installing FORM
---------------

### Stable version

To install FORM, run the following command:
```
brew install tueda/form/form
```
You can upgrade the installed FORM by
```
brew upgrade tueda/form/form
```

### Development version

Sometimes you may want to use the development version on
the [FORM repository](https://github.com/vermaseren/form), because it may have
more functionalities or more well-debugged than the \`stable\' version.
To install the development version, you can use `--HEAD` option.
```
brew install --HEAD tueda/form/form
```
More install options can be found by `brew info tueda/form/form`.
For packages installed with the `--HEAD` option, `brew upgrade` is known
[not to work](https://github.com/Homebrew/legacy-homebrew/issues/13197).
Instead, you can reinstall it:
```
brew reinstall --HEAD tueda/form/form
```

Setting $FORMPATH
-----------------

Formulae for FORM packages in this repository (e.g., `form-forcer`) will
install package files into the directory shown by
```
echo "$(brew --prefix)/share/form"
```
Therefore it is convenient to add this directory to
[`$FORMPATH`](https://www.nikhef.nl/~form/maindir/documentation/reference/online/online.html#133):
add the following line to your `.bashrc` or `.zshrc`:
```
export FORMPATH="$FORMPATH:$(brew --prefix)/share/form"
```
