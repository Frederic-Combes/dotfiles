# Zsh Vi Mode — custom keybinds consistent with neovim & wezterm
# Source this file AFTER oh-my-zsh in .zshrc

# =============================================================================
# 1. Enable vi mode & reduce ESC delay
# =============================================================================

bindkey -v
export KEYTIMEOUT=1

# =============================================================================
# 2. Cursor shape & mode indicator
# =============================================================================

# Returns [N] in normal mode, [I] in insert mode
function vi_mode_prompt_info() {
    echo "${${${KEYMAP:-viins}/vicmd/[N]}/(main|viins)/[I]}"
}

function zle-keymap-select {
    # Block cursor in normal mode, beam cursor in insert mode
    if [[ $KEYMAP == vicmd ]] || [[ $1 == 'block' ]]; then
        echo -ne '\e[2 q'
    elif [[ $KEYMAP == viins ]] || [[ $KEYMAP == main ]] || [[ $1 == 'beam' ]]; then
        echo -ne '\e[6 q'
    fi
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-init {
    zle -K viins        # ensure we start in insert mode
    echo -ne '\e[6 q'   # beam cursor
}
zle -N zle-line-init

# =============================================================================
# 3. Custom widgets
# =============================================================================

function zle-half-page-up {
    local half=$(( LINES / 2 ))
    for ((n=0; n<half; n++)); do
        zle up-line-or-history
    done
}
zle -N zle-half-page-up

function zle-half-page-down {
    local half=$(( LINES / 2 ))
    for ((n=0; n<half; n++)); do
        zle down-line-or-history
    done
}
zle -N zle-half-page-down

# =============================================================================
# 4. Clear default vicmd bindings
# =============================================================================

for key in {a..z} {A..Z}; do
    bindkey -a -r "$key" 2>/dev/null
done
bindkey -a -r ";" 2>/dev/null
bindkey -a -r "." 2>/dev/null

# =============================================================================
# 5. Normal mode (vicmd) keybindings
# =============================================================================

# --- Navigation ---
bindkey -a "i" up-line-or-history
bindkey -a "k" down-line-or-history
bindkey -a "j" vi-backward-char
bindkey -a "l" vi-forward-char
bindkey -a "u" vi-backward-word
bindkey -a "o" vi-forward-word-end
bindkey -a "U" vi-first-non-blank
bindkey -a "O" vi-end-of-line
bindkey -a "I" zle-half-page-up
bindkey -a "K" zle-half-page-down
bindkey -a "J" vi-find-prev-char
bindkey -a "L" vi-find-next-char

# --- Entering insert mode ---
bindkey -a "q" vi-insert
bindkey -a "Q" vi-insert-bol
bindkey -a "f" vi-add-next
bindkey -a "F" vi-add-eol

# --- Editing ---
bindkey -a "e" vi-yank
bindkey -a "a" vi-put-after
bindkey -a "A" vi-put-before
bindkey -a "s" vi-delete
bindkey -a "d" vi-change
bindkey -a "z" vi-delete-char
bindkey -a "r" vi-replace-chars
bindkey -a "R" vi-replace
bindkey -a "y" undo
bindkey -a "Y" redo
bindkey -a ";" vi-repeat-change

# --- Visual mode ---
bindkey -a "v" visual-mode
bindkey -a "V" visual-line-mode

# --- Search ---
bindkey -a "/" vi-history-search-backward
bindkey -a "n" vi-repeat-search
bindkey -a "N" vi-rev-repeat-search

# --- Preserved defaults ---
bindkey -a "G" vi-fetch-history
bindkey -a "gg" beginning-of-buffer-or-history
bindkey -a "0" vi-digit-or-beginning-of-line
bindkey -a "~" vi-swap-case
bindkey -a "%" vi-match-bracket
bindkey -a ":" execute-named-cmd
bindkey -R -a "1"-"9" digit-argument

# =============================================================================
# 6. Operator-pending mode (viopp)
# =============================================================================

bindkey -M viopp "i" up-line
bindkey -M viopp "k" down-line
bindkey -M viopp "j" vi-backward-char
bindkey -M viopp "l" vi-forward-char
bindkey -M viopp "u" vi-backward-word
bindkey -M viopp "o" vi-forward-word-end
bindkey -M viopp "U" vi-first-non-blank
bindkey -M viopp "O" vi-end-of-line
bindkey -M viopp "L" vi-find-next-char
bindkey -M viopp "J" vi-find-prev-char

# =============================================================================
# 7. Visual mode keybindings
# =============================================================================

# Navigation
bindkey -M visual "i" up-line
bindkey -M visual "k" down-line
bindkey -M visual "j" vi-backward-char
bindkey -M visual "l" vi-forward-char
bindkey -M visual "u" vi-backward-word
bindkey -M visual "o" vi-forward-word-end
bindkey -M visual "U" vi-first-non-blank
bindkey -M visual "O" vi-end-of-line
bindkey -M visual "L" vi-find-next-char
bindkey -M visual "J" vi-find-prev-char

# Actions
bindkey -M visual "e" vi-yank
bindkey -M visual "s" vi-delete
bindkey -M visual "d" vi-change
bindkey -M visual "z" vi-delete
bindkey -M visual "a" put-replace-selection

# =============================================================================
# 8. Insert mode (viins) — convenience bindings
# =============================================================================

bindkey -M viins "^A" beginning-of-line
bindkey -M viins "^E" end-of-line
bindkey -M viins "^W" vi-backward-kill-word
bindkey -M viins "^U" vi-kill-line
bindkey -M viins "^H" backward-delete-char
bindkey -M viins "^?" backward-delete-char

# History
bindkey -M viins "^R" history-incremental-search-backward
bindkey -M viins "^P" up-history
bindkey -M viins "^N" down-history