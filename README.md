# vim setup

clone this repository to home dir, and clone plugins

```sh
git clone git@github.com:gavwu/dotfile.git
cd dotfile
git submodule update --init
```

```
ln -s ~/dotfile/vimrc ~/.vimrc
ln -s ~/dotfile/vim ~/.vim
```

NOTE: for generating help tag for plugin, need to run `helptags ALL` in vim command mode

