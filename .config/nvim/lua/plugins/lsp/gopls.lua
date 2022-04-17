local util = require "lspconfig/util"
local general = require 'plugins.lsp.general'

local M = {}

M.setup_fn = function (opts)
    opts.filetypes = {'go', 'gomod'}
    opts.root_dir = util.root_pattern("go.work", "go.mod", ".git")
    opts.settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    }
end
-- M.setup = general.setup

-- M.setup.cmd = {"gopls"}
-- M.setup.filetypes = {"go", "gomod"}
-- M.setup.root_dir = util.root_pattern("go.work", "go.mod", ".git")
-- M.setup.settings = {
    --         gopls = {
        --             analyses = {
            --                 unusedparams = true,
            --             },
            --             staticcheck = true,
            --     },
            -- }

local path = require 'nvim-lsp-installer.path'
local install_root_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

require('go').setup({
    gopls_cmd = {install_root_dir .. '/go/gopls'},
    filstruct = 'gopls',
    dap_debug = true,
    dap_debug_gui = true
})

            -- require("go.format").goimport()  -- goimport + gofmt
            -- Run gofmt + goimport on save
            vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

            return M
