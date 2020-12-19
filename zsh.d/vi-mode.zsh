#
# vi-mode
#

zle-keymap-select() { 
  zle reset-prompt ; zle -R 
}

zle-accept-line() {
  zle accept-line
}

zle -N vi-accept-line

bindkey -v # Default to standard vim bindings

# use custom accept-line widget to update $VI_KEYMAP
bindkey -M vicmd '^J' zle-accept-line
bindkey -M vicmd '^M' zle-accept-line

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line


zle -N zle-keymap-select

# ------------------------------------------------------------------------------
# Impromptu Prompt Segment Function
# ------------------------------------------------------------------------------
impromptu::prompt::vi-mode() {
  IMPROMPTU_VI_MODE_SHOW="true"
  IMPROMPTU_VI_MODE_PREFIX=""
  IMPROMPTU_VI_MODE_SUFFIX=" "
  IMPROMPTU_VI_MODE_INSERT="[I]"
  IMPROMPTU_VI_MODE_INSERT_COLOR="white"
  IMPROMPTU_VI_MODE_NORMAL="[N]"
  IMPROMPTU_VI_MODE_NORMAL_COLOR="green"

  [[ "$IMPROMPTU_VI_MODE_SHOW" = "true" ]] || return

  if bindkey | grep "vi-quoted-insert" > /dev/null 2>&1; then # check if vi-mode enabled
    local mode_indicator="${IMPROMPTU_VI_MODE_INSERT}"

    case "${KEYMAP}" in
      main|viins)
        mode_color="${IMPROMPTU_VI_MODE_INSERT_COLOR}"
        mode_indicator="${IMPROMPTU_VI_MODE_INSERT}"
        ;;
      vicmd)
        mode_color="${IMPROMPTU_VI_MODE_NORMAL_COLOR}"
        mode_indicator="${IMPROMPTU_VI_MODE_NORMAL}"
        ;;
    esac

    impromptu::segment "$mode_color" \
      "${IMPROMPTU_VI_MODE_PREFIX}${mode_indicator}${IMPROMPTU_VI_MODE_SUFFIX}"
  fi
}

# ------------------------------------------------------------------------------
# Helpers
# ------------------------------------------------------------------------------

# Temporarily switch to vi-mode
zsh::vimode::enable() {
  zle -N zle-keymap-select
  bindkey -v
}

# Temporarily switch to emacs-mode
zsh::vimode::disable() {
  bindkey -e
}
