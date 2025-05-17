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
--     x ^ $ b t h m

-- Mapping for insertion
knv("q", "i") -- q: insert: i
knv("Q", "I") -- Q: insert at start: I
knv("f", "a") -- f: append: a
knv("F", "A") -- F: append at end: A

-- Mapping for motions
knov("l", "l")     -- l: left: l
knov("j", "h")     -- j: right h
knov("i", "k")     -- i: up: k
knov("k", "j")     -- k: down j
knov("U", "^")     -- U: start of line: ^
knov("O", "$")     -- O: end of line: $
knov("u", "b")     -- u: start of word: b
knov("o", "e")     -- o: end of word: e
knov("I", "<c-u>") -- I: half screen up C-u
knov("K", "<c-d>") -- K: half screen down C-d
knov("J", "F")     -- J: find backwards F
knov("L", "f")     -- L: find forwards f

-- Mapping for actions
knov(";", ".")     -- ;: repeat last insert action: .
knov("z", "x")     -- z: cut: x
knov("e", "y")     -- e: copy y
knov("a", "p")     -- a: paste: p
knov("s", "d")     -- s: delete: d
knov("d", "c")     -- d: change to: c
knov("r", "r")     -- r: replace: r
knov("y", "u")     -- y: undo: u
knov("Y", "<c-r>") -- Y: redo: <c-r>
knv("P", "q")      -- P: macro recording: q
knv("p", "@")      -- p: macro replaying: @

-- Operator pending mode mappings
vim.keymap.set("o", "q", "i") -- For {action} Inside {text object}
vim.keymap.set("o", "f", "a") -- For {action} Around {text object}


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
    vim.o.cursorline = true

    -- NVIM only settings
    require("config.lazy")
    require("config.quick-access")

    vim.keymap.set("n", "gj", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "gl", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>rk", vim.diagnostic.open_float)

    vim.keymap.set("n", "gi", vim.lsp.buf.declaration)
    vim.keymap.set("n", "gi", vim.lsp.buf.definition)
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>ra", vim.lsp.buf.code_action)
    vim.keymap.set("n", "S", vim.lsp.buf.hover)

    -- NVIM window management
    -- wijkl: Move to window
    kn("wi", "<c-w>k")
    kn("wj", "<c-w>h")
    kn("wk", "<c-w>j")
    kn("wl", "<c-w>l")
    kn("wo", ":vsplit<cr><c-w>l") -- wo: Vertical split window
    kn("wu", "<c-W>w")            -- wu: Move next (bottom/right)

    -- Mappings for Terminal
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- Exiting terminal mode
end
