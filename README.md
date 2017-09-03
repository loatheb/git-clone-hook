# git-clone-hook
Automaticlly change directory to the folder after `git clone`

# install

```shell
curl https://raw.githubusercontent.com/loatheb/git-clone-hook/master/index.sh | bash
```

# thanks

Thanks [how-to-cd-automatically-after-git-clone](https://unix.stackexchange.com/questions/97920/how-to-cd-automatically-after-git-clone) for giving me inspiration.

It's really hard for me to command `cd` somewhere everytime after `git clone`.So I want to find a way to do it automatically.

The question above have many solutions, but they all need I to add them in `~/.zshrc` or `~/.bashrc` by myself.So I write this simple script to detect and write the main function whenever you use bash or zsh.
