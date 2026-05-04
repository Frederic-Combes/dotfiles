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
| Copy to end of line     | E   |
| Cut                     | z   |
| Paste                   | a   |
| Paste (before)          | A   |
| Change                  | d   |
| Delete                  | s   |
| Repeat last edit (.)    | c   |
| !Undo                   | y   |
| !Redo                   | Y   |
| Start/End Macro         | P   |
| Play Macro              | p   |
| !Indent                 | >>  |
| !Dedent                 | <<  |
| !Search pattern in file | /   |
| Toggle Comment(*)       | gcc |

(*): built into Neovim 0.10+ (`gc` in visual mode, `gcap` for comment around paragraph, ...)

### LSP & Diagnostics

| Action                          | Key  |
|---------------------------------|------|
| Hover                           | S    |
| Go to definition                | gi   |
| Find references                 | gk   |
| Format buffer                   | *gf  |
| Rename symbol                   | *rr  |
| Code action                     | *ra  |
| Open diagnostic float           | *rk  |
| Next diagnostic (warn+)         | gl   |
| Previous diagnostic (warn+)     | gj   |
| Next diagnostic (any severity)  | gL   |
| Previous diagnostic (any sev.)  | gJ   |

### Completion

| Action                   | Key       |
|--------------------------|-----------|
| Show completion menu     | c-`space` |
| Show completion menu     | c-k       |
| Select next              | c-i       |
| Select previous          | c-k       |
| Accept completion        | `Tab`     |
| Toggle help              | c-s       |
| Scroll help down         | c-l       |
| Scroll help up           | c-j       |
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
| Cycle next pane          | wu  |
| Toggle quickfix          | &   |
| Exit terminal mode       | Esc |
| Resize(*)                |     |

(*)To resize:
+ width: use `<cmd>vert resize +N` to increase with by N columns
+ height: use `<cmd>resize +N` to increase height by N rows

#### Telescope

| Action                  | Key |
|-------------------------|-----|
| Find files              | c-p |
| Command picker          | c-a |
| Live grep               | *fg |
| Buffer picker           | *fq |
| Pickers picker          | *fp |
| Help tags               | *fh |
| Go to previous position | c-o |

In a Telescope window: `i`/`k` move up/down, `o` select, `O` open in split, `j`/`u` toggle selection, `S-i`/`S-k` scroll preview.

#### Neo-tree

| Action             | Key |
|--------------------|-----|
| Reveal in Neo-tree | *ee |
| Close Neo-tree     | *eq |

In the tree pane: `q`/`f` add file, `Q`/`F` add directory, `e` copy, `z` cut, `a` paste, `s` delete, `l` open, `j` close node, `J` close all subnodes, `h` toggle hidden.


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


In the test pane (toggled with `*et`), use:

| Action                     | Key   |
|----------------------------|-------|
| Run                        | t     |
| Run Marked                 | T     |
| Debug                      | b     |
| Debug Marked               | B     |
| Stop                       | s     |
| Attach                     | a     |
| Watch                      | h     |
| Next Failed                | K     |
| Previous Failed            | I     |
| Jump to test               | q / f |
| Expand                     | j / l |
| Expand all                 | J / L |
| Show output                | o     |
| Short output               | O     |
| Mark                       | `Tab` |
| Clear Marked / Target      | x     |
| Clear Target               | X     |

#### Debug & Debug Panes

| Action                     | Key  |
|----------------------------|------|
| Toggle breakpoint          | *bt  |
| Debugger: continue         | *bl  |
| Debugger: step into        | *bi  |
| Debugger: step over        | *bo  |
| Debugger: step out         | *bk  |
| Debugger: terminate        | *bj  |
| Eval word / selection      | *bb  |
| Toggle Debugger UI         | *eb  |
| List Breakpoints           | *fb  |
| Open REPL console          | *bq  |
| Open REPL console          | *bf  |

#### Claude Code

| Action                       | Key      |
|------------------------------|----------|
| Toggle Claude terminal       | *ea      |
| Focus Claude terminal        | *af      |
| Resume conversation          | *ar      |
| Continue last conversation   | *aR      |
| Select model                 | *am      |
| Add current buffer to Claude | *ab      |
| Send selection to Claude     | *as (v)  |

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

### Notebooks

In order to edit notebooks in neovim, you need `jupytext`. You can install it with
```bash
uv tool install jupytext
```

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

