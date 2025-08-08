local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n", "<leader>r?d",
    function() vim.cmd.RustLsp('debuggables') end, { silent = true, buffer = bufnr })
vim.keymap.set(
    "n", "<leader>rp",
    function() vim.cmd.RustLsp { 'debuggables', bang = true } end, { silent = true, buffer = bufnr })
-- vim.keymap.set(
--     "n", "<leader>rd",
--     function() vim.cmd.RustLsp('debuggables') end, { silent = true, buffer = bufnr })
vim.keymap.set(
    "n", "<leader>rr",
    function() vim.cmd.RustLsp('run') end, { silent = true, buffer = bufnr })
vim.keymap.set(
    "n", "<leader>r?r",
    function() vim.cmd.RustLsp('runnables') end, { silent = true, buffer = bufnr })
vim.keymap.set(
    "n", "<leader>r?t",
    function() vim.cmd.RustLsp('testables') end, { silent = true, buffer = bufnr })
vim.keymap.set(
    "n", "<leader>rc",
    function() vim.cmd.RustLsp('codeAction')
 end, { silent = true, buffer = bufnr })

