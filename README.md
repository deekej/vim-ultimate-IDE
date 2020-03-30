# VIM - Congiguration for ultimate IDE

I have been using VIM for almost 10 years now, and after being so much used to it, I couldn't make a switch to some existing IDEs, no matter how I tried. As many other people, I felt it was too complicated for many tasks, and was seriously lacking in other areas, so I've decided to give a try to 'making VIM the ultimate IDE for writing & code development'. It was after I have found these 2 amazing articles:

  * http://wittchen.io/transform-vim-into-efficient-ide/ from [@pwittchen](https://github.com/pwittchen)
  * https://coderoncode.com/posts/vim-is-the-perfect-ide from [@amacgregor](https://github.com/amacgregor)

And after several people around me started to ask me *"how did you configure VIM to do XYZ"* I have decided to share my complete config files to have a place to point them to, and I hope some other people find it useful as well.

![VIM - Did I really pay for that?](https://www.vim.org/images/0xbabaf000l.png)

*My configuration of VIM is a mixture of ideas from the 2 articles above, as well as my old VIM configuration. I tried to 'document' it with comments so that even a newbie can easily disable/modify any configuration without troubles.*

Since this is my own personal VIM configuration, I won't be accepting any pull-requests. However, feel free to fork this repo for yourself, and change anything which does not suit your needs... :)

*My last note is a wish -- if you find this useful in any way, feel free to let me know, but more importantly, show some love to [@pwittchen](https://github.com/pwittchen) and [@amacgregor](https://github.com/amacgregor). Kudos to both of them -- their articles allowed me to move my VIM experience to a completely new level of efficiency and usability! ;)*

# Installation
First, you need to install **pynvim** - you can use your Linux distro official package, or *pip*:
```bash
sudo pip3 install pynvim
```
**NOTE:** I'm using this VIM configuration for both root & my local user. Therefore I install pynvim system-wide. If you do not have root permissions, or you just want to install this config for your local user only, add the `--user` parameter after the `install` command.

**NOTE:** I suggest prior to next step to make a backup of your existing `.vimrc` / `.gvimrc` configuration, as well as the `.vim` folder. 

Next, clone this git repository (it already includes the [Vundle](https://github.com/VundleVim/Vundle.vim) plugin manager for VIM as a git submodule):
```bash
cd ~/
rm -rf .vim/
git clone --recurse-submodules https://github.com/deekej/vim-ultimate-IDE.git .vim/
```

Last you will need to finish the bootstrap process:
```bash
ln -sf ~/.vim/.vimrc ~/.vimrc
ln -sf ~/.vim/fonts  ~/.local/share/fonts/dejavu-nerd
fc-cache -v
vim +PluginInstall +qall
```

After the steps above, you should be able to normally launch the `vim` with all of this configuration properly loaded... ;) GL&HF
