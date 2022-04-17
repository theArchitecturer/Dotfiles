local util = require'utils.util'

require("bufferline").setup{}

local map_opts = {
    noremap = true,
    silent = true,
}
util.map('n', '[b', '<cmd>BufferLineCyclePrev<cr>', map_opts)
util.map('n', ']b', '<cmd>BufferLineCycleNext<cr>', map_opts)
