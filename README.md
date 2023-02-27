# Things to install

## Install dependencies and default apps
- Install brew.sh


## scripts

`deps.sh`

```sh

brew install neovim coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc unzip curl wxmac zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions libgccjit gpg asdf fd ripgrep starship bat cmake

brew install --cask flux amethyst iterm2 stretchly brave-browser raycast


brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono


brew tap d12frosted/emacs-plus
brew install emacs-plus --with-native-comp  --with-modern-doom3-icon

brew tap homebrew/cask-fonts
brew install font-hack-nerd-font


curl -o ~/.gitignore https://raw.githubusercontent.com/github/gitignore/main/Global/macOS.gitignore

git config --global core.excludesfile ~/.gitignore
git config --global init.defaultBranch main


compaudit | xargs chmod g-w

mkdir -p ~/personal
mkdir -p ~/bin
mkdir -p ~/.config/nvim

curl -o ~/.config/nvim/init.lua https://raw.githubusercontent.com/nvim-lua/kickstart.nvim/master/init.lua
```

## Configure apps

### zsh

In `.zshrc`

```
################# mario.mazo ###########################

# elixir
# KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
export ERL_AFLAGS="-kernel shell_history enabled"

# staship
eval "$(starship init zsh)" 

#asdf
. /usr/local/opt/asdf/libexec/asdf.sh


# zsh and shell
alias ls="ls -FG"
alias vim="nvim"
alias cat="bat"
export PATH=$PATH:$HOME/bin

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi


## Syntax highlight
autoload -Uz compinit && compinit
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## Case insensitive auto-complete with oh-my-zh
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

## Makes .. work without oh-my-zsh
setopt autocd
```

### iterm
In Settings > Profiles > Text 
- Ascii:  JetBrains Mono 16
- Non-ascii: Hack Nerd Font Mono 16

In Settings > Profiles > Colors
Then change blue color for `268bd2` so the directories are more readable

### asdf
Install languages:

asdf.sh
```
asdf plugin add java #install tls 11
asdf plugin-add erlang
asdf plugin-add nodejs
asdf plugin-add elixir
asdf plugin-add golang
asdf plugin-add rust
asdf plugin-add python
```

#### elixir

get the list of all version with `asdf list all erlang`
install latest erlang and corresponding elixir and make them global

```
asdf install erlang xxxx
asdf global erlang xxxx
asdf install elixir xxxx
asdf global elixir xxxx
```

#### python
If you use pip to install a module like ipython that has binaries. You will need to run `asdf reshim python` for the binary to be in your path.

```
asdf install python xxxxx
asdf global python  xxxxx
```


if you install packages with pip
### Add developer tools to system-preferences / security & privacy / privacy

In settings, in system-preferences / security & privacy / privacy , there is a permission called "Developer Tools". if i add Terminal to that permission, the slowdown does not happen anymore.

https://sigpipe.macromates.com/2020/macos-catalina-slow-by-design/


### git

In `.gitconfig`

```
[user]
        email = firstname.lastname@<work.email>
        name = firstname lastname

[includeIf "gitdir:~/personal/**"]
    path = ~/personal/.gitconfig
```

In  `~/personal/.gitconfig`

```
[user]
        email = firstname.lastname@<personal.email>
        name = firstname lastname
```    


### Amethyist

- set focus follows mounse
- 10px margin
- disable _restore layouts on launch_

#### Remap keys:

Note: When a shortcut is taken it doesnt allow you to add the new one

- increase main pane count -> `nil`
- decrease main pane count -> `nil`
- Option Shift O -> `Tall Right`
- Option Shift U -> `Full screen`
- Option Shift . -> `Throw focused window to the right`
- Option Shift , -> `Throw focused window to the left`


### Emacs
- install doom, use files from this repo, but DO NOT copy paste them. Doom adds new stuff often, check whats new

init.el
```
vterm
lsp
tree-sitter
(elixir +lsp +tree-sitter)
(python +lsp +tree-sitter)
```

Folding with lsp for elixir
https://blog.evalcode.com/enable-elixir-code-folding-in-doom-emacs/

### nvim
If you want to add something you will need need to modify `init.lua` before you open nvim for the first time and add
what you need, like elixr, zig, Markdown, Json, etc.

You will need to comment out the line `{ import = 'custom.plugins' }` to remove the warning that you dont have custom
scripts

Notes:
- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
- https://www.youtube.com/watch?v=stqUbv-5u2s

### Vimium 

Install https://github.com/philc/vimium extension to use Brave a la vim

