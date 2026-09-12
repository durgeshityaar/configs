-- Subtle vertical indent guides (indent-blankline v3, module name "ibl").
require("ibl").setup({
  indent = { char = "│" },
  scope = { enabled = true, show_start = false, show_end = false },
})
