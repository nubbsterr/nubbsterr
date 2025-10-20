-- Core settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true
vim.opt.termguicolors = true  -- Enable true color support (required for many themes and transparency)
-- Colourscheme is set in plugins.lua!!!!!!!

-- LSP configuration
-- enable servers w/ nvim-lspconfig defaults

vim.lsp.config("bashls", { 
    cmd = { 'bash-language-server', 'start' },
    settings = {
        bashIde = {
            globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
        },
    },
  filetypes = { 'bash', 'sh' },
  root_markers = { '.git' },
})

vim.lsp.config("pyright", {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json',
        '.git',
    },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
            local params = {
                command = 'pyright.organizeimports',
                arguments = { vim.uri_from_bufnr(bufnr) },
            }

      -- Using client.request() directly because "pyright.organizeimports" is private
      -- (not advertised via capabilities), which client:exec_cmd() refuses to call.
      -- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
            client.request('workspace/executeCommand', params, nil, bufnr)
        end, {
            desc = 'Organize Imports',
        })
        vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightSetPythonPath', set_python_path, {
            desc = 'Reconfigure pyright with the provided python path',
            nargs = 1,
            complete = 'file',
        })
    end,
})

vim.lsp.config("clangd", {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac', -- AutoTools
        '.git',
    },
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true,
            },
        },
        offsetEncoding = { 'utf-8', 'utf-16' },
    },
    ---@param init_result ClangdInitializeResult
    on_init = function(client, init_result)
        if init_result.offsetEncoding then
            client.offset_encoding = init_result.offsetEncoding
        end
    end,
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
            switch_source_header(bufnr, client)
        end, { desc = 'Switch between source/header' })

        vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
            symbol_info(bufnr, client)
        end, { desc = 'Show symbol info' })
    end,
})

vim.lsp.enable('bashls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    -- Autocompletion on every keypress
    vim.lsp.completion.enable(true, args.data.client_id, bufnr, { autotrigger = true })
  end,
})

-- Diagnostics inline
vim.diagnostic.config({ virtual_text = true, signs = true })

-- Transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

-- Spellchecking
vim.cmd(':setlocal spell spelllang=en_us')

-- Keybinds
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and exit current buffer" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save current buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Exit current buffer" })
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Open Lazy.nvim menu" })
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open NetRW" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Fuzzy find files in current directory" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep (search text) across files" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List and switch open buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search Neovim help tags" })

-- Load plugins
require("plugins")
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  contrast = "hard", -- can be "hard", "soft" or empty string
  dim_inactive = false,
  transparent_mode = false,
})
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")
