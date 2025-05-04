# Dotfiles DEV Config

## Windows Manager

[MAC - AeroSpace](https://github.com/nikitabobko/AeroSpace)

## Shell

### Font

[JetBrains Mono](https://www.nerdfonts.com/font-downloads)

### ZSH

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### POWERLEVEL10K

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Tmux

Clone package manager...

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install packages

```
~/.tmux/plugins/tpm/bin/install_plugins
# OR
<prefix> + I
```

### TODO CLI

[todo cli](https://github.com/todotxt/todo.txt-cli)

## IDE

### NvChad

[Install](https://nvchad.com/docs/quickstart/install)

- Neovim
- RipGrep (optionall)

## Lazy Git

To exit on esc, find file location of config as per [here](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md)

> Default path for the global config file:
>
> - Linux: `~/.config/lazygit/config.yml`
> - MacOS: `~/Library/Application\ Support/lazygit/config.yml`
> - Windows: `%LOCALAPPDATA%\lazygit\config.yml` (default location, but it will also be found in `%APPDATA%\lazygit\config.yml`

and save,

```
quitOnTopLevelReturn: true
```

## Config

Once everthing is installed, run this for custom config.
You may need to install `stow`.

```bash
git clone https://github.com/drer17/dotfiles.git ~/dotfiles
cd ~/dotfiles
./stow.sh
```
