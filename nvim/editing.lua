-- Auto-close brackets/quotes (treesitter-aware so it won't fight your code)
require("nvim-autopairs").setup({
  check_ts = true,
})

-- After confirming a function/method from nvim-cmp, insert the ( ) pair
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

-- Auto close & rename JSX/TSX (and HTML) tags — essential for TS React
require("nvim-ts-autotag").setup()
