# dotfiles

> Install all your depencies in your macOS.


- No dependencies, it's a `install.sh` script and that's it 🎉 🎉 🎉


## How to install

```bash
https://raw.githubusercontent.com/willmendesneto/dotfiles/master/setup | bash
```


## Options

- `--ruby-version`: Default Ruby Version to be installed when the script is running. Default value: `2.3.3`;
- `--node-version`: Default NodeJS Version to be installed when the script is running. Default value: `v7.10.1`. Please pass the value with `v` as prefix;
- `--skip-brew-cleanup`: Should skip 'brew cleanup' before run 'brew bundle'? Default value: `false`


## Tools

This command will install
- Oh-my-ZSH with all the required configuration
- homebrew with all your brew dependencies specified in your `Brewfile`
  - VSCode as editor
  - Postman for HTTP validations/simulations
  - AWS CLI
  - YARN via brew (without NodeJS since it's installing `NVM`)
  - `Caffeine` macOS app
  - `ShiftIT` macOS app
  - Spotify (because we always need to listen some music 🎧 🎤 🎼)
  - `AppCleaner` macOS app
- Fonts from your macOS system
- NodeJS using `NVM`
- Ruby using `RVM`
- Git configuration
- command line aliases. You can check the content of `.cli` folder for more details

## Author

**Wilson Mendes (willmendesneto)**
+ <https://plus.google.com/+WilsonMendes>
+ <https://twitter.com/willmendesneto>
+ <http://github.com/willmendesneto>
