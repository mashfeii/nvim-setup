local map = vim.api.nvim_set_keymap
local keymap = vim.keymap
local default_opts = { noremap = true, silent = true }

-- Системный буфер обмена shift - Y
map("v", "S-Y", '"+y', {})
-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
map("i", "jj", "<Esc>", { noremap = true })

-- Автоформат + сохранение по CTRL-s , как в нормальном, так и в insert режиме
keymap.set("i", "<C-s>", function()
	vim.lsp.buf.format()
	vim.api.nvim_command("write")
end, default_opts)
keymap.set("n", "<C-s>", function()
	vim.lsp.buf.format()
	vim.api.nvim_command("write")
end, default_opts)
keymap.set("n", "<leader>f", vim.lsp.buf.format, default_opts)
keymap.set("n", "<leader>em", vim.diagnostic.open_float, default_opts)

-- Go to start or end of line
keymap.set({ "n", "x" }, "<c-h>", "^")
keymap.set({ "n", "x" }, "<c-l>", "$")

-- Copy entire buffer.
keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })

-- Move current line up and down
keymap.set("n", "<c-k>", '<cmd>call utils#SwitchLine(line("."), "up")<cr>', { desc = "move line up" })
keymap.set("n", "<c-j>", '<cmd>call utils#SwitchLine(line("."), "down")<cr>', { desc = "move line down" })

map("n", "<leader>note", ":cd ~/.notes/<cr>", default_opts)
map("n", "<leader>code", ":cd ~/.codes/<cr>", default_opts)

-- По F1 очищаем последний поиск с подсветкой
map("n", "<F1>", ":nohl<CR>", default_opts)

-- shift + F1 = удалить пустые строки
map("n", "<F13>", ":g/^$/d<CR>", default_opts)

-- <S-F3> Открыть всю nvim конфигурацию для редактирования
map(
	"n",
	"<F15>",
	":e ~/.config/nvim/init.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/settings.lua<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>",
	{ noremap = true }
)

-- ";"Q - save all and quit
map("n", "<leader>Q", ":wqa<cr>", default_opts)
map("n", "<leader>q", ":wq<cr>", default_opts)
map("n", "<leader>w", ":w<cr>", default_opts)

map("n", "<leader>bg", ":ToggleBackground<cr>", default_opts)

-- <F4> Поиск слова под курсором
map("n", "<F4>", [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)

-- <S-F4> Поиск слова в модальном окошке
map("n", "<F16>", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-- <F5>,<F9> Compile and run C/CPP program
map("n", "<F5>", ":call CompileAndRun()<CR>", default_opts)
map("n", "<F9>", ":w<CR>:!clear<CR>:call CompileAndRun()<CR>", default_opts)
