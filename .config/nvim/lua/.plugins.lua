local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	
    --faster loading time
    use {'lewis6991/impatient.nvim', config = [[require('impatient')]]}

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Greeting window
    use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
    }

    -- Show indent 
    use "lukas-reineke/indent-blankline.nvim"

    -- parenthesis
    use 'luochen1990/rainbow'

    -- Auto pair
    use 'windwp/nvim-autopairs'

    -- notification plugin
    use({
      "rcarriga/nvim-notify",
      event = "BufEnter",
      config = function()
        vim.defer_fn(function() require('notify') end, 2000)
        vim.notify = require('notify')
      end
    })

    -- tpope package
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-obsession'

    -- color scheme
    use({"lifepillar/vim-gruvbox8", opt = true})

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
