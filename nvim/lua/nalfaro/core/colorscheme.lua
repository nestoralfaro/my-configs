local status, _ = pcall(vim.cmd, "colorscheme vscode")
if not status then
  print("vscode colorscheme not found.")
  return
end
