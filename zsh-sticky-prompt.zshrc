ZLE_STICKY_PROMPT_LEFT=""
ZLE_STICKY_PROMPT_RIGHT=""

sticky-prompt-zle-line-init() {
  LBUFFER="$ZLE_STICKY_PROMPT_LEFT"
  RBUFFER="$ZLE_STICKY_PROMPT_RIGHT"
  zle _zle-line-init
}

sticky-prompt-set() {
  if [[ -z "$BUFFER" ]]; then
    if [[ -z "$ZLE_STICKY_PROMPT_LEFT" ]]; then
      zle -M "No sticky prompt set."
    else
      ZLE_STICKY_PROMPT_LEFT=""
      ZLE_STICKY_PROMPT_RIGHT=""
      zle -M "Removed sticky prompt."
    fi
    return
  fi

  local ZLE_STICKY_PROMPT_PREV_LEFT="$ZLE_STICKY_PROMPT_LEFT"
  local ZLE_STICKY_PROMPT_PREV_RIGHT="$ZLE_STICKY_PROMPT_RIGHT"
  ZLE_STICKY_PROMPT_LEFT="$LBUFFER"
  ZLE_STICKY_PROMPT_RIGHT="$RBUFFER"

  if { [[ -n "$ZLE_STICKY_PROMPT_LEFT" ]] && [[ "$ZLE_STICKY_PROMPT_PREV_LEFT" != "$ZLE_STICKY_PROMPT_LEFT" ]]; } ||
        { [[ -n "$ZLE_STICKY_PROMPT_RIGHT" ]] && [[ "$ZLE_STICKY_PROMPT_PREV_RIGHT" != "$ZLE_STICKY_PROMPT_RIGHT" ]]; }; then
    zle -M "Sticky prompt $ZLE_STICKY_PROMPT_LEFT|$ZLE_STICKY_PROMPT_RIGHT"
  else
    ZLE_STICKY_PROMPT_LEFT=""
    ZLE_STICKY_PROMPT_RIGHT=""
    BUFFER=""
    zle -M "Removed sticky prompt."
  fi
}

sticky-prompt-accept-line() {
    if [[ -z "$BUFFER" ]] && [[ -n "$ZLE_STICKY_PROMPT_LEFT" ]]; then
      ZLE_STICKY_PROMPT_LEFT=""
      ZLE_STICKY_PROMPT_RIGHT=""
      zle -M "Removed sticky prompt."
    fi
    zle .accept-line
}

functions[_zle-line-init]="${functions[zle-line-init]}"
zle -N _zle-line-init
zle -N zle-line-init sticky-prompt-zle-line-init
zle -N sticky-prompt-set
zle -N accept-line sticky-prompt-accept-line
bindkey '^S' sticky-prompt-set
