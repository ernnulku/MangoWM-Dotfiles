local map = vim.keymap.set
local del = vim.keymap.del

-- Disable built-in LazyVim conflicts first
pcall(del, "n", "<C-h>")
pcall(del, "n", "<C-j>")
pcall(del, "n", "<C-k>")
pcall(del, "n", "<C-l>")
pcall(del, "n", "<C-f>")
pcall(del, "n", "<C-b>")

-- File & App Controls
-- Smart Save: Prompts for a filename if the file is unnamed
map({ "n", "i", "v" }, "<C-s>", function()
  if vim.api.nvim_buf_get_name(0) == "" then
    local filename = vim.fn.input("Save as: ")
    if filename ~= "" then
      vim.cmd("write " .. filename)
    end
  else
    vim.cmd("w")
  end
end, { desc = "Save File" })

map("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close Buffer" })
map("n", "<C-q>", "<cmd>qa<CR>", { desc = "Quit Neovim" })
map("n", "<C-n>", "<cmd>enew<CR>", { desc = "New File" })
map("n", "<A-z>", "<cmd>set wrap!<CR>", { desc = "Toggle Word Wrap" })
map("n", "<C-h>", ":%s/", { desc = "Find and Replace" })

-- Window Splits & Focus
map("n", "<A-v>", "<cmd>vsplit<CR>", { desc = "Split Vertically" })
map("n", "<A-s>", "<cmd>split<CR>", { desc = "Split Horizontally" })
map("n", "<A-w>", "<C-w>w", { desc = "Focus Other Pane" })
map("n", "<A-x>", "<cmd>close<CR>", { desc = "Close Pane" })

-- Tabs & Navigation
map("n", "<F1>", "<cmd>bprevious<CR>", { desc = "Previous Tab" })
map("n", "<F2>", "<cmd>bnext<CR>", { desc = "Next Tab" })
map("n", "<S-Tab>", "<C-w>p", { desc = "Focus Editor" })

-- Editing Commands
map("n", "<C-d>", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "<C-g>", ":", { desc = "Go to Line" })
map("n", "<C-j>", "za", { desc = "Toggle Fold" })
map("n", "<C-u>", "zM", { desc = "Toggle Fold All" })

-- Undo / Redo
map("n", "<C-z>", "u", { desc = "Undo" })
map("i", "<C-z>", "<C-o>u", { desc = "Undo" })
map("n", "<C-y>", "<C-r>", { desc = "Redo" })

-- Commenting (Using <C-_> as terminals translate Ctrl+/ to Ctrl+_)
map({ "n", "v" }, "<C-_>", "gcc", { remap = true, desc = "Toggle Comment" })
map({ "n", "v" }, "<C-/>", "gcc", { remap = true, desc = "Toggle Comment" })

-- Copy / Cut / Paste
map("v", "<C-c>", '"+y', { desc = "Copy" })
map("v", "<C-x>", '"+d', { desc = "Cut" })
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste" })
map("i", "<C-v>", "<C-r>+", { desc = "Paste from Clipboard" })
map({ "n", "i", "v" }, "<C-a>", "<esc>ggVG", { desc = "Select All" })

-- Line Duplication
map("n", "<S-A-Down>", "<cmd>t.<CR>", { desc = "Duplicate Line Down" })
map("n", "<S-A-Up>", "<cmd>t.-1<CR>", { desc = "Duplicate Line Up" })

-- Search Movements
map("n", "<F3>", "n", { desc = "Find Next" })
map("n", "<S-F3>", "N", { desc = "Find Previous" })

-- Scrolling & Jump
map("n", "<PageUp>", "<C-u>", { desc = "Scroll Page Up" })
map("n", "<PageDown>", "<C-d>", { desc = "Scroll Page Down" })
map({ "n", "v" }, "<C-Home>", "gg", { desc = "Start of File" })
map({ "n", "v" }, "<C-End>", "G", { desc = "End of File" })
