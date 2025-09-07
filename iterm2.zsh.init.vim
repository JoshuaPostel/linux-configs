call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Fuzzy finder
" Optional
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" improves quickfix menu
Plug 'kevinhwang91/nvim-bqf'

" Plug 'folke/trouble.nvim'

" Plug 'nvim-treesitter/nvim-treesitter'


" GBrowse
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()

set clipboard=unnamedplus
colorscheme gruvbox
cnoreabbrev Cop s/^/#/ <bar> nohl
cnoreabbrev Cor s/^/\/\// <bar> nohl
cnoreabbrev Cop s/^/#/ <bar> nohl
cnoreabbrev Fmt <cmd>lua vim.lsp.buf.format()<CR>
cnoreabbrev Td call CocAction('diagnosticToggle')

"" autocomplete off by default and shortcut commands to turn on and off
cnoreabbrev Acoff lua require('cmp').setup.buffer { enabled = false }
cnoreabbrev Acon lua require('cmp').setup.buffer { enabled = true }

lua <<EOF
require('cmp').setup.buffer { enabled = false }
EOF

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" coc select autocomplete with enter
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#select_confirm() : "\<CR>"


"" Avoid showing extra messages when using completion
set shortmess+=c

set nu


" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF


lua <<EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>o', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', 'dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', 'dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>ed', '<cmd>lua vim.diagnostic.enable()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>dd', '<cmd>lua vim.diagnostic.disable()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>dd', '<cmd>lua vim.diagnostic.disable()<CR>', opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --vim.keymap.set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', {desc = "Go to references"})
  -- map("n", "gr", "<cmd>Telescope lsp_references<cr>") 
end


--vim.lsp.config('ruff', {
--  init_options = {
--    settings = {
--      -- Ruff language server settings go here
--    }
--  }
--})

vim.lsp.enable('ruff')

require'lspconfig'.pyright.setup{
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}



require'lspconfig'.rust_analyzer.setup {
  cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
  -- When using unix domain sockets, use something like:
  -- cmd = vim.lsp.rpc.connect("/Users/jp/.cargo/bin/ra-multiplex.sock"),
  settings = {
    ["rust-analyzer"] = {
      lspMux = {
        version = "1",
        method = "connect",
        server = "rust-analyzer",
        assist = {
            importGranularity = "module",
            importPrefix = "by_self",
        },
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
        checkOnSave = {
            command = "clippy"
        },
    	diagnostics = {
	    enable = false,
	},
      },
    },
  },
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

local nvim_lsp = require'lspconfig'




require('bqf').setup({
    auto_enable = true,
    auto_resize_height = true, -- highly recommended enable
--    preview = {
--        win_height = 12,
--        win_vheight = 24,
--        delay_syntax = 80,
--    },
    -- make `drop` and `tab drop` to become preferred
    func_map = {
        openc = '<CR>',
        split = '<C-h>',
        vsplit = '<C-v>',
    },
})
EOF

