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


## After install

Unfortunately, there are some steps you need to do manually for now.


### iTerm2 configuration

First of all, follow the instructions in the post [Use ⌥ ← and ⌥→ to jump forwards / backwards words in iTerm 2, on OS X](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x) and apply these changes.

After that you need to change the `iTerm2` preferences

<img width="1130" alt="screen shot 2018-07-29 at 9 47 49 pm" src="https://user-images.githubusercontent.com/1252570/43366014-6c9d36b4-9379-11e8-99e4-24c89035c366.png">
<img width="882" alt="preferences-appearance" src="https://user-images.githubusercontent.com/1252570/43366017-773f2d16-9379-11e8-8132-0675bf4e1bc2.png">
<img width="908" alt="preferences-general" src="https://user-images.githubusercontent.com/1252570/43366018-77a9dd32-9379-11e8-9666-79c6854eb51d.png">
<img width="1040" alt="preferences-profiles-colors" src="https://user-images.githubusercontent.com/1252570/43366019-77e360fc-9379-11e8-9fa6-5085f3ca871f.png">



## Author

**Wilson Mendes (willmendesneto)**
+ <https://plus.google.com/+WilsonMendes>
+ <https://twitter.com/willmendesneto>
+ <http://github.com/willmendesneto>
