# Setup fzf
# ---------
if [[ ! "$PATH" == */home/john/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/john/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/john/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/john/.fzf/shell/key-bindings.zsh"
