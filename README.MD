# zsh-sticky-prompt

Based on the idea of [zsh-sticky-prefix](https://github.com/utdemir/me/blob/master/blog/zsh-sticky-prefix.md) this allows for the sticking of the left & right bufers in ZSH so that one can repeatedly execute code/commands in the CLI without having to either retype the whole line, or go back through history and delete/change/tweak in the input.

## Installation
Copy the contents of the [zsh-sticky-prompt.zshrc](zsh-sticky-prompt.zshrc) file into the `.zshrc` file.  If the sticking of the prefix doesn't work, place the code at the end of the .zshrc file since there might be other scripts overriding the hooks this script uses.  oh-my-zsh is one of those types where oh-my-zsh will need to be sourced before this code snippet.

## Usage
<kbd>CTRL</kbd> + <kbd>S</kbd> activates the sticky prompt feature based on the current line input.  Pressing again (without modifying the prompt) it will delete the stickiness, as does pressing <kbd>Return</kbd> on an empty line.

## Examples
Coming soon
