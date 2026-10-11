-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")



-- Чорно-біла тема
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.signcolumn = "no"

vim.api.nvim_set_hl(0, "Normal", {
  fg = "#FFFFFF",
  bg = "#000000",
})

vim.api.nvim_set_hl(0, "NormalFloat", {
  fg = "#FFFFFF",
  bg = "#000000",
})

vim.api.nvim_set_hl(0, "FloatBorder", {
  fg = "#FFFFFF",
  bg = "#000000",
})

vim.api.nvim_set_hl(0, "WinSeparator", {
  fg = "#FFFFFF",
  bg = "#000000",
})

-- F5: запуск Python
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  local file = vim.fn.expand("%:p")
  vim.cmd("botright 12split | terminal python3 "
    .. vim.fn.shellescape(file))
end, { desc = "Run Python" })

-- F5: компіляція та запуск C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set("n", "<F5>", function()
      vim.cmd("write")
      local file = vim.fn.expand("%:p")
      local output = "/tmp/nvim_program"

      vim.cmd("botright 12split | terminal g++ "
        .. vim.fn.shellescape(file)
        .. " -std=c++17 -o "
        .. vim.fn.shellescape(output)
        .. " && " .. vim.fn.shellescape(output))
    end, { buffer = true, desc = "Compile and run C++" })
  end,
})

-- Автоматичний запуск Neo-tree
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree left")
  end,
})
