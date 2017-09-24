#!/usr/bin/env bash

profile_path() {
  local profile_type="$(basename "/$SHELL")"
  local profile_path=''

  if [ "$profile_type" = "bash" ]; then
    if [ -f "$HOME/.bashrc" ]; then
      profile_path="$HOME/.bashrc"
    elif [ -f "$HOME/.bash_profile" ]; then
      profile_path="$HOME/.bash_profile"
    fi
  elif [ "$profile_type" = "zsh" ]; then
    profile_path="$HOME/.zshrc"
  fi

  echo "$profile_path"
}

# thanks https://unix.stackexchange.com/questions/97920/how-to-cd-automatically-after-git-clone
main() {
  local profile_path="$(profile_path)"
  echo "
git() {
  local tmp=\$(mktemp)
  local repo_name

  if [ "\$1" = clone ] ; then
    command git "\$@" --progress 2>&1 | tee \$tmp
    repo_name=\$(awk -F\' '/Cloning into/ {print \$2}' \$tmp)
    rm \$tmp
    if [ -n "\$repo_name" ]; then
      printf \"changing to directory %s\\n\" \"\$repo_name\"
      cd "\$repo_name"
    fi
  else
    command git "\$@"
  fi
}
  " >> $profile_path
  source $profile_path
  echo "install successful"
}

main
