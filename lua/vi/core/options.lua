local o = vim.opt
local g = vim.g

o.laststatus = 0

-- Line number
o.relativenumber = true
o.number = true
o.signcolumn = "yes:1"
o.conceallevel = 2

o.showtabline = 1

-- Hide cmd line
o.cmdheight = 0

-- Tabs
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- Lines
o.wrap = false

-- Search
o.iskeyword:append("-")
o.smartcase = true

-- Cursor
o.sidescrolloff = 10 -- Keep N symbols to left/right of cursor
o.scrolloff = 10     -- Keep N lines to above/bottom of cursor
o.cursorline = false
o.mouse = ""

-- Performance improvements
o.redrawtime = 10000
o.maxmempattern = 20000

-- Clipboard will be changed if wayland and wl-copy is available
if os.getenv("WAYLAND_DISPLAY") and vim.fn.executable("wl-copy") == 1 then
  o.clipboard = "unnamedplus" -- use system clipboard
  g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy --foreground --type text/plain",
      ["*"] = "wl-copy --foreground --type text/plain",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline",
    },
    cache_enabled = 1,
  }
end

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("yank-highlight", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Return cursor to last position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("restore-pos", { clear = true }),
  desc = "Restore last cursor position",
  callback = function()
    if vim.o.diff then
      return
    end
    local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
    local last_line = vim.api.nvim_buf_line_count(0)

    local row = last_pos[1]
    if row < 1 or row > last_line then
      return
    end
    pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
  end,
})
