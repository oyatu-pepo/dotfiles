#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".github" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue

    echo "$f"
    ln -snfv ~/dotfiles/"$f" ~/
done
