映射到~/.config目录下
asynctask
coc
htop
lf

niceBinary目录下的添加到环境变量

cheat映射到~/.cheat
tldr不映射
nvimpager:
```sh
make PREFIX=$HOME/.local install,
ln -s niceVim/nvimpager.init.vim ~/.config/nvimpager/init.vim
```

clang下载
```sh
https://releases.llvm.org/download.html
xz -d clang-llvm.tar.xz
tar xvf .tar
cp -r * /usr/local
```

