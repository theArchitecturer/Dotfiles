local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    --faster loading time
    use 'lewis6991/impatient.nvim';

    -- pqg itself
    use 'savq/paq-nvim';

    -- greeting window
    use 'goolord/alpha-nvim';
    use 'kyazdani42/nvim-web-devicons';
    
    -- Show indent 
    use 'lukas-reineke/indent-blankline.nvim';

    -- parenthesis
    use 'luochen1990/rainbow';

    -- Auto pair
    use 'windwp/nvim-autopairs';

    -- notification plugin
    use 'rcarriga/nvim-notify';
      
    -- tpope package
    use 'tpope/vim-commentary';
    use 'tpope/vim-repeat';
    use 'tpope/vim-surround';
    use 'tpope/vim-unimpaired';
    use 'tpope/vim-obsession';

    -- file explorer
    use 'kyazdani42/nvim-tree.lua';

    -- color scheme
    use {'lifepillar/vim-gruvbox8', opt = true};
    use {'dracula/vim', opt = true};
    use {'navarasu/onedark.nvim', opt = true}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
