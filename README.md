# Things to install

## Guides

- https://sourabhbajaj.com/mac-setup/
- https://gist.github.com/kevin-smets/8568070
- https://www.sharmaprakash.com.np/guake-like-dropdown-terminal-in-mac/ use Cmd + `

## apps
- Install brew
- brew cask install flux
- brew cask install amethyst
- brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions libgccjit
- brew cask install iterm2
- brew cask install stretchly
- brew cask install visual-studio-code
- install oh-my-sh


## ~/.gitignore
- https://github.com/github/gitignore/blob/master/Global/macOS.gitignore

## theme with fonts
- https://github.com/romkatv/powerlevel10k

- https://www.jetbrains.com/lp/mono/
- brew tap homebrew/cask-fonts
- brew install --cask font-jetbrains-mono

Terminal looks good with JetBrains Mono 16, just no icons in the promt

## asdf
- brew install asdf
- brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc unzip curl wxmac
- brew install gpg
- bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

- asdf plugin add java #install tls 11
- asdf plugin-add erlang
- asdf plugin-add nodejs
- asdf plugin-add elixir
- asdf plugin-add golang
- asdf plugin-add rust

## elixir vscode
- https://thinkingelixir.com/elixir-in-vs-code/
- https://dev.to/joseph_lozano/my-mac-setup-2020-for-elixir-and-phoenix-development-390k
- https://medium.com/@abadon.gutierrez/elixir-development-with-visual-studio-code-16b923e82653

## vscode

```
❯ code --list-extensions | xargs -L 1 echo code --install-extension
code --install-extension aliariff.auto-add-brackets
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension eamodio.gitlens
code --install-extension HookyQR.beautify
code --install-extension iampeterbanjo.elixirlinter
code --install-extension JakeBecker.elixir-ls
code --install-extension kkalita.dark-plus-elixir
code --install-extension lonefy.vscode-JS-CSS-HTML-formatter
code --install-extension ow.vscode-subword-navigation
code --install-extension stkb.rewrap

```

## Add developer tools to system-preferences / security & privacy / privacy

In settings, in system-preferences / security & privacy / privacy , there is a permission called "Developer Tools". if i add Terminal to that permission, the slowdown does not happen anymore.

https://sigpipe.macromates.com/2020/macos-catalina-slow-by-design/


## Rename master to main in git

to add `main` as default branch in `.gitconfig` execute

```
git config --global alias.new '!git init && git symbolic-ref HEAD refs/heads/main'
```

## Amethyist

- set focus follows mounse
- 10px margin
- disable _restore layouts on launch_

### remap:

Note: When a shortcut is take it doesnt allow you to add the new one

- increase main pane count -> `nil`
- decrease main pane count -> `nil`
- Option Shift O -> `Tall Right`
- Option Shift U -> `Full screen`
- Option Shift . -> `Throw focused window to the right`
- Option Shift , -> `Throw focused window to the left`

### limelight

- https://github.com/koekeishiya/limelight and compile to `~/bin`
- in `~/.config/limelight/config`

```
limelight -m config width            4
limelight -m config radius           0
limelight -m config placement        exterior
#limelight -m config active_color     0xff8ebb70
limelight -m config active_color     0xff8ef670
limelight -m config normal_color     0xff555555

echo "limelight configuration loaded.."
```

- in `~/bin/start_limelight.command`. Add it to startup items in preferences so limelight starts on login
this will create an terminal window, that can be closed later on

```
#!/usr/bin/env sh
# kill any existing limelight process if one exists, before we launch a new one
killall limelight &> /dev/null
limelight -c  ~/.config/limelight/config &> /dev/null &
```

## Emacs
- brew tap d12frosted/emacs-plus
- brew install emacs-plus --with-native-comp  --with-modern-doom3-icon

### doom
- brew install fd ripgrep
- install doom

## nvim
- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
- https://www.youtube.com/watch?v=stqUbv-5u2s
- brew install neovim



## scripts

```
brew install neovim coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc unzip curl wxmac zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions libgccjit gpg asdf fd ripgrep starship

brew install --cask flux amethyst iterm2 stretchly


brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono


brew tap d12frosted/emacs-plus
brew install emacs-plus --with-native-comp  --with-modern-doom3-icon
```







