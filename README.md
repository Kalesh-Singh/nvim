# Installing this config

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

git clone sso://user/kaleshsingh/nvim ~/.config/nvim
```

# Installing the Package Manager

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

# Updating the Plugins

```
nvim

:PackerSync
```
