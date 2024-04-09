local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local opt = vim.opt -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- Global
-----------------------------------------------------------
opt.colorcolumn = "110" -- Разделитель на 80 символов
opt.textwidth = 110
opt.cursorline = true -- Подсветка строки с курсором
opt.spelllang = { "en_us", "ru" } -- Словари рус eng
opt.number = true -- Включаем нумерацию строк
opt.relativenumber = true -- Вкл. относительную нумерацию строк
-- opt.so = 999                      -- Курсор всегда в центре экрана
opt.so = 7 -- Курсор всегда в центре экрана
opt.undofile = true -- Возможность отката назад
opt.splitright = true -- vertical split вправо
opt.splitbelow = true -- horizontal split вниз
opt.linebreak = true
opt.wrap = true
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "indent"
opt.termguicolors = true
opt.langmap =
	-----------------------------------------------------------
	-- Tabs and indets
	-----------------------------------------------------------
	cmd([[
filetype plugin on
syntax on
]])
cmd([[colorscheme tokyonight]])
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 3 -- shift 4 spaces when tab
opt.tabstop = 3 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
opt.autoindent = true
opt.wildignore = "*.out, *.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
opt.showcmd = true
opt.showmode = true
opt.wildmenu = true
opt.wildmode = "list:longest"

-----------------------------------------------------------
-- Run CPP compiler
-----------------------------------------------------------
exec(
	[[
function! CompileAndRun()
  let fileName = expand('%:t')
  if fileName =~ '\.cpp$'
    let exeName = substitute(fileName, '\.cpp$', '', '')
    execute 'w | !g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 -o ' . exeName . ' ' . fileName
    if v:shell_error == 0
      let cmd = "x-terminal-emulator -e bash -c './" . exeName . "; read -p \"Press enter to exit...\"'"
      call system(cmd)
      redraw!
    endif
  else
    echo 'Not a C++ file'
  endif
endfunction
]],
	true
)

local create_cmd = vim.api.nvim_create_user_command
create_cmd("ToggleBackground", function()
	if vim.o.background == "dark" then
		vim.cmd("set bg=light")
	else
		vim.cmd("set bg=dark")
	end
end, {})
