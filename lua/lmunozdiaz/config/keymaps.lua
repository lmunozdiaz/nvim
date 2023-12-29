local keymap = vim.keymap.set

-- Consistent esc
keymap("i", "<C-c>", "<Esc>", { desc = "Ensure that C-c works just like Esc" })

-- Better paste
keymap("x", "p", "\"_dP", { desc = "Keep paste buffer" })

-- Better up/down
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })

-- Write
keymap("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>W", "<Cmd>wa<CR>", { desc = "Save files" })

-- Quit
keymap("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })
keymap("n", "<leader>Q", "<Cmd>q!<CR>", { desc = "Force quit" })

-- Start/end of line
keymap({ "n", "v" }, "H", "^", { desc = "To the first non-blank char of the line" })
keymap({ "n", "v" }, "L", "$", { desc = "To the end of the line" })

-- Move line
keymap("n", "<M-k>", "<Cmd>move .-2<CR>==", { desc = "Move up" })
keymap("n", "<M-j>", "<Cmd>move .+1<CR>==", { desc = "Move down" })
keymap("i", "<M-k>", "<Esc><Cmd>move .-2<CR>==gi", { desc = "Move up" })
keymap("i", "<M-j>", "<Esc><Cmd>move .+1<CR>==gi", { desc = "Move down" })
keymap("v", "<M-k>", ":move '<-2<cr>gv=gv", { desc = "Move up" })
keymap("v", "<M-j>", ":move '>+1<cr>gv=gv", { desc = "Move down" })

-- Join line 
keymap("n", "J", "mzJ`z", { desc = "Join current with next line and keep cursor position"})

-- Select
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select everything in the file" })

-- Split window
keymap("n", "<leader>-", "<C-W>s", { desc = "Split below" })
keymap("n", "<leader>|", "<C-W>v", { desc = "Split right" })

-- Move to window
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window
keymap("n", "<Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<Left>", "<Cmd>vertical resize -2<CR>", { desc = "Increase window width" })
keymap("n", "<Right>", "<Cmd>vertical resize +2<CR>", { desc = "Decrease window width" })

-- File Explorer
keymap("n", "<C-n>", "<Cmd>Neotree toggle<CR>")

-- File browser
keymap("n", "<leader>fb", "<Cmd>Telescope file_browser<CR>", { noremap = true, desc = "Open the file browser" })

-- Fuzzy finder
keymap("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Grep (root dir)"})
keymap("n", "<leader>fs", "<Cmd>Telescope git_files<CR>", { desc = "Grep (root dir)" })
keymap("n", "<leader>fw", "<Cmd>Telescope grep_string<CR>", { desc = "Find word" })
keymap("n", "<leader>fr", "<Cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
keymap("n", "<leader>fc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Fuzzy search" })
keymap("n", "<leader>fd", "<Cmd>Telescope diagnostics<CR>", { desc = "List diagnostics" })
keymap("n", "<leader>fR", "<Cmd>Telescope resume<CR>", { desc = "Resume" })

-- Terminal
keymap('t', '<Esc>', "<C-\\><C-n>", { desc = "Leave terminal mode" })
keymap("n", "<C-i>", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Float terminal" })
keymap("n", "<C-_>", "<Cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
keymap("n", "<C-|>", "<Cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })

-- Move to window from terminal
keymap('t', '<C-h>', "<C-\\><C-n><C-w>h")
keymap('t', '<C-j>', "<C-\\><C-n><C-w>j")
keymap('t', '<C-k>', "<C-\\><C-n><C-w>k")
keymap('t', '<C-l>', "<C-\\><C-n><C-w>l")

-- Saner behavior of n and N
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Shifting selections
keymap("v", ">", ">gv", { desc = "Visual shifting" })
keymap("v", "<", "<gv", { desc = "Visual shifting" })

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<Cmd>nohlsearch<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- Search
keymap("n", "<C-f>", ":/", { desc = "Basic search" })
keymap("n", "<leader>sl", ":s/", { desc = "Search and replace within current line" })
keymap("n", "<leader>sb", ":%s/", { desc = "Search and replace within the buffer" })

-- Git
keymap("n", "<leader>ng", "<CMD>Neogit<CR>", { desc = "Opens Neogit" })

