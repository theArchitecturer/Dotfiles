local util = require("utils.util")

local options = {
    noremap = true,
    silent = true
}
util.map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
util.map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
util.map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
util.map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
util.map("n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands()<cr>", options)

-- default
require'telescope'.setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            width = 0.95,
            height = 0.9,
            preview_width = 0.6,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
    }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')
