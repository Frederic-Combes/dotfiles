-- Ensure leader is set before loading any plugin
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.termguicolors = true

-- set clipboard to global clipboard
vim.opt.clipboard:append("unnamedplus")

-- Mapping shortcuts, e.g. knov = keymap normal, operator pending, visual
local function kn(a, b, opts)
    opts = opts or {}
    vim.keymap.set("n", a, b, opts)
end

local function knov(a, b, opts)
    opts = opts or {}
    vim.keymap.set("n", a, b, opts)
    vim.keymap.set("o", a, b, opts)
    vim.keymap.set("v", a, b, opts)
end

local function knv(a, b, opts)
    opts = opts or {}
    vim.keymap.set("n", a, b, opts)
    vim.keymap.set("v", a, b, opts)
end

-- FIXME: map issue
-- - Vim keys not bound
--     o z h f
-- - Keyboard keys unused
--     x ^ $ b

-- Mapping for insertion
--   q: insert: q
knv("q", "i")
--   Q: insert at start: I
knv("Q", "I")
--   f: append: a
knv("f", "a")
--   F: append at end: A
knv("F", "A")

-- Mapping for motions
--   l: left: l
knov("l", "l")
--   j: right j
knov("j", "h")
--   i: up: i
knov("i", "k")
--   k: down k
knov("k", "j")
--   U: start of line: U
knov("U", "^")
--   O: end of line: O
knov("O", "$")
--   u: start of word: u
knov("u", "b")
--   o: end of word: o
knov("o", "e")
--   I: half screen up
knov("I", "<c-u>")
--   K: half screen down
knov("K", "<c-d>")
--   J: find backwards F
knov("J", "F")
--   L: find forwards f
knov("L", "f")

-- Mapping for actions
--   z: cut: z
knov("z", "x")
--   e: copy e
knov("e", "y")
--   a: paste: a
knov("a", "p")
--   s: delete: s
knov("s", "d")
--   d: change to: d
knov("d", "c")
--   r: replace: r
knov("r", "r")
--   y: undo: h
knov("y", "u")
--   Y: redo: <c-r>
knov("Y", "<c-r>")
-- P: macro recording: q
knv("P", "q")
-- p: macro replaying: @
knv("p", "@")

-- Exiting terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

if vim.g.vscode then
    -- VSCode extension is running, don't do nothing, it crashes often enough...
else
    vim.cmd("set number")
    vim.cmd("set relativenumber")

    vim.cmd.filetype("on")
    vim.cmd.filetype("plugin on")
    vim.cmd.syntax("on")

    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    vim.opt.scrolloff = 40

    -- NVIM only seetings
    require("config.lazy")
    require("config.quick-access")

    vim.cmd("autocmd TermOpen * startinsert")

    -- NVIM window management
    -- wijkl: Move to window
    kn("wi", "<c-w>k")
    kn("wj", "<c-w>h")
    kn("wk", "<c-w>j")
    kn("wl", "<c-w>l")
    -- wo: Vertical split window
    kn("wo", ":vsplit<cr><c-w>l")
    -- wu: Move next (bottom/right)
    kn("wu", "<c-W>w")
end
