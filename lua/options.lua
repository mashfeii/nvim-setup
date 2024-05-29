local cmd = vim.cmd            -- execute Vim commands
local g = vim.g
local exec = vim.api.nvim_exec -- execute Vimscript
local opt = vim.opt            -- global/buffer/windows-scoped options
-----------------------------------------------------------
-- Global
-----------------------------------------------------------
opt.colorcolumn = "80"            -- Разделитель на 80 символов
opt.textwidth = 80
opt.cursorline = true             -- Подсветка строки с курсором
opt.spelllang = { "en_us", "ru" } -- Словари рус eng
opt.number = true                 -- Включаем нумерацию строк
opt.relativenumber = true         -- Вкл. относительную нумерацию строк
opt.so = 7                        -- Курсор всегда в центре экрана
opt.undofile = true               -- Возможность отката назад
opt.splitright = true             -- vertical split вправо
opt.splitbelow = true             -- horizontal split вниз
opt.linebreak = true
opt.wrap = true
opt.foldcolumn = "1" -- '0' is not bad
opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "indent"
opt.termguicolors = true
-----------------------------------------------------------
-- Tabs and indets
-----------------------------------------------------------
cmd([[
filetype plugin on
syntax on
]])
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 2     -- shift 2 spaces when tab
opt.tabstop = 2        -- 1 tab == 2 spaces
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
-----------------------------------------------------------
-- Change light/dark colorscheme
-----------------------------------------------------------
local create_cmd = vim.api.nvim_create_user_command
create_cmd("ToggleBackground", function()
  if vim.o.background == "dark" then
    vim.cmd("set bg=light")
    -- cmd([[colorscheme tokyonight]])
    -- require("lualine").setup({
    -- 	options = {
    -- 		theme = "tokyonight",
    -- 	},
    -- })
  else
    vim.cmd("set bg=dark")
    -- cmd([[colorscheme nord]])
    -- require("lualine").setup({
    -- 	options = {
    -- 		theme = "nord",
    -- 	},
    -- })
  end
end, {})
create_cmd("CompileCPP", function()
  local function ends_with(str, ending)
    return ending == "" or str:sub(- #ending) == ending
  end
  local function get_file_name(file)
    return file:match("[^/]*.cpp$")
  end
  local fullPath = vim.fn.expand("%:t")

  if ends_with(fullPath, ".cpp") then
    local fileName = get_file_name(fullPath)
    local fileNameWithoutExtension = string.sub(fileName, 0, -5)
    require("toggleterm.terminal").Terminal
        :new({
          cmd = "g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 -o "
              .. fileNameWithoutExtension
              .. " "
              .. fileName
              .. " && ./"
              .. fileNameWithoutExtension,
          display_name = string.upper(fileName),
          direction = "float",
          float_opts = {
            border = "curved",
            title_pos = "center",
          },
          close_on_exit = false,
          auto_scroll = true,
        })
        :toggle()

    -- require("toggleterm").exec(
    --   "g++ -std=c++17 -Wall -Wextra -Wpedantic -O2 -o "
    --   .. fileNameWithoutExtension
    --   .. " "
    --   .. fileName
    --   .. " && ./"
    --   .. fileNameWithoutExtension,
    --   1,
    --   12
    -- )
  end
end, {})
-----------------------------------------------------------
-- Fix for `tab` button
-----------------------------------------------------------
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
        ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
        and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
