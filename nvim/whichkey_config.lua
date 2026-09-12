-- Press <leader> and wait: a popup shows the available follow-up keys.
require("which-key").setup({})

-- Label the key groups so the popup reads nicely.
local ok, wk = pcall(require, "which-key")
if ok and wk.add then
  wk.add({
    { "<leader>G", group = "Go" },
    { "<leader>a", group = "AI (Claude Code)" },
    { "<leader>o", group = "Octo (GitHub PRs)" },
    { "<leader>b", group = "Buffer" },
    { "<leader>d", group = "Debug (DAP)" },
    { "<leader>h", group = "Git (hunks + review)" },
    { "<leader>t", group = "Trouble" },
    { "<leader>x", group = "Trouble (alt)" },
  })
end
