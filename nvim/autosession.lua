require'auto-session'.setup {
  suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
  auto_restore_last_session = true,
  -- Close nvim-tree before saving the session so it doesn't get restored
  -- as a second pane on the next open. It re-opens fine with <C-n> when needed.
  pre_save_cmds  = { "NvimTreeClose" },
  post_save_cmds = { "NvimTreeClose" },
}
