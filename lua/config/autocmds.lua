-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Re-sign treesitter parsers on macOS to fix codesigning crashes (com.apple.provenance xattr)
if vim.fn.has("mac") == 1 then
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("ts_codesign", { clear = true }),
    callback = function()
      local parser_dir = vim.fn.stdpath("data") .. "/site/parser"
      vim.system({
        "bash",
        "-c",
        string.format(
          'if xattr -l "%s"/*.so 2>/dev/null | grep -q provenance; then xattr -cr "%s"/*.so && codesign -fs - "%s"/*.so; fi',
          parser_dir,
          parser_dir,
          parser_dir
        ),
      })
    end,
  })
end
