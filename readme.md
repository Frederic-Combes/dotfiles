Leader is noted as *

Preceding action noted as _

Bad keybings noted with !

# Neovim Keymap

Leader: `<space>`

### Motions

| Motion              | Key |
|---------------------|-----|
| Up                  | i   |
| HalfScreen Up       | I   |
| Down                | k   |
| HalfScreen Down     | K   |
| Left                | j   |
| Character backward  | J   |
| Right               | l   |
| Character forward   | J   |
| Word Begin          | u   |
| Line Begin          | U   |
| Word End            | o   |
| Line End            | O   |
| Go top              | gg  |
| Go bottom           | G   |
| Inside              | _q  |
| Around              | _f  |
| Next match          | n   |

### Actions

| Action                  | Key |
|-------------------------|-----|
| Visual Mode             | v   |
| Visual Line Mode        | V   |
| Insert (before)         | q   |
| Insert (begining)       | Q   |
| Insert (after)          | f   |
| Insert (end)            | F   |
| Replace                 | r   |
| Copy                    | e   |
| Cut                     | z   |
| Paste                   | a   |
| Paste (before)          | A   |
| Change                  | d   |
| Delete                  | s   |
| Redo last action        | ;   |
| !Redo last action       | .   |
| !Undo                   | y   |
| !Redo                   | Y   |
| Start/End Macro         | P   |
| Play Macro              | p   |
| !Indent                 | >>  |
| !Dedent                 | <<  |
| !Search pattern in file | /   |

### Window & Panes 

| Action                   | Key |
|--------------------------|-----|
| Split vertical (& go)    | wo  |
| Split horizontal (& go)  |     |
| Move to pane left        | wj  |
| Move to pane right       | wl  |
| Move to pane up          | wi  |
| Move to pane down        | wk  |
| Go to file               | c-p |
| Go to previous position  | c-o |
| Search tracked files     | *fg |
| Search all files         |     |
| Search for test          | ft  |

(TODO: Use a test picker for telescope?)

#### Tests & Test Pane

| Action                     | Key  |
|----------------------------|------|
| Run test at cursor         | *tt  |
| Debug test at cursor       | *tb  |
| Debug last test            | *tB  |
| Run tests in file          | *ta  |
| Stop test                  | *ts  |
| Show test output           | *to  |
| Toggle test output pane    | *th  |
| Clear test output pane     | *txh |
| Toggle test list pane      | *et  |
| Go to next test            | *tl  |
| Go to previous test        | *tj  |
| Go to next failed test     | *tk  |
| Go to previous failed test | *ti  |
| Show test output           | *ts  |


| Action                     | Key   |
|----------------------------|-------|
| Run                        | t     |
| Debug                      | b     |
| Stop                       | s     |
| Next Failed                | K     |
| Previous Failed            | I     |
| Jump to test               | q     |
| Jump to test               | f     |
| Show output                | o     |
| Mark                       | `Tab` |
| Run Marked                 | T     |
| Clear Marked               | x     |

#### Debug & Debug Panes

| Action                     | Key  |
|----------------------------|------|
| Toggle breakpoint          | *bt  |
| Debugger: continue         | *bl  |
| Debugger: step into        | *bi  |
| Debugger: step over        | *bo  |
| Debugger: step out         | *bk  |
| Debugger: terminate        | *bs  |
| Repl: excecute selection   | *bb  |
| Repl: hover                | *bh  |
| Toggle Debugger UI         | *eb  |

# Wezterm Keymap

!Leader: `<a-s>`

| Action                | Key   |
|-----------------------|-------|
| Paste                 | a-a   |
| Split Vertical        | a-o   |
| Split Horizontal      | a-u   |
| Select Pane           | *g    |
| New tab               | a-q   |
| New tab               | a-f   |
| Select Tab            | ac-p  |
| Move to pane Up       | a-i   |
| Move to pane Down     | a-k   |
| Move to pane Left     | a-j   |
| Move to pane Right    | a-l   |
| Go to Tab 1           | a-1   |
| ...                   | a-... |
| Go to Tab 4           | a-4   |
| Copy Mode             | a-e   |

## Wezterm copy mode

### Motions

| Motion      | Key |
|-------------|-----|
| Up          | i   |
| Down        | k   |
| Left        | j   |
| Right       | l   |
| Word Begin  | u   |
| Line Begin  | U   |
| Word End    | o   |
| Line End    | O   |

### Actions

| Action                | Key |
|-----------------------|-----|
| Visual Mode           | v   |
| Visual Line Mode      | V   |
| Copy                  | e   |
| Copy Line             | z   |
| Copy Line into prompt | Z   |
| Paste                 | a   |

