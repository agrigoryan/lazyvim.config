return {
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
      indent = { enabled = false },
      picker = {
        sources = {
          files = { ignored = true },
          explorer = { ignored = true, hidden = true },
          grep = { ignored = true },
          grep_word = { ignored = true },
          grep_buffers = { ignored = true },
        },
      },
    },
  },
}
