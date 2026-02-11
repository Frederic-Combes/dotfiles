Leader is noted as *

Preceding action noted as _

Bad key bind noted with !

# Required dependencies

- ripgrep (telescope fuzzy find in files)

# Neovim Cheat Sheet

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
| Character forward   | L   |
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
| Insert (beginning)      | Q   |
| Insert (after)          | f   |
| Insert (end)            | F   |
| Replace                 | r   |
| Replace Mode            | R   |
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
| Toggle Comment(*)       | gcc |

(*): tpope/commentary (gc in visual mode, gcap for comment around paragraph, ...)

### Completion

| Action                   | Key       |
|--------------------------|-----------|
| Show completion menu     | c-`space` |
| Show completion menu     | c-k       |
| Select next              | c-i       |
| Select previous          | c-i       |
| Accept completion        | `Tab`     |
| Toggle help              | c-s       |
| Scroll help up           | c-l       |
| Scroll help down         | c-j       |
| Toggle signature         | c-s       |


### Window & Panes 

| Action                   | Key |
|--------------------------|-----|
| Split vertical (& go)    | wo  |
| Split horizontal (& go)  | wO  |
| Move to pane left        | wj  |
| Move to pane right       | wl  |
| Move to pane up          | wi  |
| Move to pane down        | wk  |
| Go to file               | c-p |
| Go to previous position  | c-o |
| Search tracked files     | *fg |
| Search all files         |     |
| Search for test          |     |
| Resize(*)                |     |

(*)To resize:
+ width: use `<cmd>vert resize +N` to increase with by N columns
+ height: use `<cmd>resize +N` to increase height by N rows

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


In the test pane (toggled with `*et`), use:

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
| Repl: execute selection    | *bb  |
| Repl: hover                | *bh  |
| Toggle Debugger UI         | *eb  |

# Wezterm key map

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

| Action                     | Key |
|----------------------------|-----|
| Visual Mode                | v   |
| Visual Line Mode           | V   |
| Copy Selection             | e   |
| Copy Selection into prompt | e   |
| Copy Line                  | z   |
| Copy Line into prompt      | Z   |
| Paste                      | a   |

# Notebooks

Notebooks require an externel python virtual environment. It's lockfile is generated with
```bash
uv pip compile nvim/notebooks/requirements.in --no-header --no-annotate > nvim/notebooks/requirements.txt
```

Additionally, `jupytext` must be on the path. It can be installed with `uv tool install jupytext`.

### Action

| Action                   | Key |
|--------------------------|-----|
| Initialize the kernel    | jp  |
| Restart the kernel       | jP  |
| Run cell                 | jr  |
| Run cells above          | ja  |
| Run all cells            | jA  |
| Show/Enter output        | jo  |
| Output in browser        | ji  |
| Delete cell output       |     |
| Delete all cells output  |     |

