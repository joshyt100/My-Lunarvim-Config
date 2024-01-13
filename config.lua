-- Read the docs: https://www.lunarvim.org/docs/configuration


-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.transparent_window = true
lvim.lsp.document_highlight = false
lvim.log.level = "error"
lvim.builtin.treesitter.highlight.enable = true


-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--require('lspconfig').emmet_ls.setup {}
-- Import the required LazyVim modules
-- LazyVim configuration
-- LazyVim configuration
-- LazyVim configuration
-- LazyVim configuration
-- -- Configure emmet_ls for HTML
--require('lspconfig').emmet_ls.setup {}
-- Configure emmet_ls for HTML
-- Configure emmet-ls for HTML with custom completion behavior
--require('lspconfig').emmet_ls.setup{}
-- chadrc.lua
-- ... (other configurations)

-- Emmet Language Server settings
-- -- lv-config.lua

-- ... (other configurations)
--
--Marksman
require("lvim.lsp.manager").setup("marksman")
lvim.plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
  },

  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  { "folke/tokyonight.nvim", name = "tokyonight" },
  { "luisiacc/gruvbox-baby", name = "gruvbox" },
  --tabnine
  {
    "tzachar/cmp-tabnine",
    event = "BufRead",
    build = "./install.sh",
  },
  "rebelot/kanagawa.nvim",
  "pineapplegiant/spaceduck",
  "nyngwang/nvimgelion",
  { "sainnhe/gruvbox-material", name = "gruvbox_other" }

}
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.format_on_save.enabled = true
lvim.colorscheme = "gruvbox-baby"
lvim.format_on_save.pattern = { "*.lua", "*.css", " *.html", "*.py", "*.cpp", "*.js" }
--vim.g.user_emmet_leader_key = ',' -- Customize the leader key according to your preference
lvim.builtin.treesitter.ensure_installed = {
  "python",
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

local pyright_opts = {
  single_file_support = true,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- openFilesOnly, workspace
        typeCheckingMode = "basic",   -- off, basic, strict
        useLibraryCodeForTypes = true,
      },
    },
  },
}


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }

lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)



local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }



require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }


-- binding for switching



-- Emmet Language Server setup
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "emmet-ls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("emmet_ls", {
  filetypes = { "astro", "html", "css", },

  -- cmd = { "/Users/chris/Library/Caches/fnm_multishells/65657_1672759387689/bin/ls_emmet", "--stdio" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
-- ... (other configurations)

-- Optional: Use the built-in auto-formatting and linting


-- lv-config.lua






-- All the treesitter parsers you want to install. If you want all of them, just
-- replace everything with "all".
lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "typescript",
}

-- Setup lsp.
-- Set a linter.


-- Additional Plugins
-- local null_ls = require("null-ls")
--local tsserver_flags = {}
--require("lvim.lsp.manager").setup("tsserver", {
--cmd = { "clangd", unpack(tsserver_flags) },
--on_attach = require("lvim.lsp").common_on_attach,
--on_init = require("lvim.lsp").common_on_init,
-- capabilities = capabilities,
--})

require("lvim.lsp.manager").setup "cssls"
require("lvim.lsp.manager").setup "asm_lsp"



local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({
  {
    command = "prettierd",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
      "json",
    }
  },
})





--local opts = {}
--require("lvim.lsp.manager").setup("eslint",opts)
--require("lvim.lsp.manager").setup("tailwindcss",opts)


lvim.builtin.treesitter.highlight.enable = true

-- auto install treesitter parsers
lvim.builtin.treesitter.ensure_installed = { "cpp", "c" }

-- Additional Plugins
table.insert(lvim.plugins, {
  "p00f/clangd_extensions.nvim",
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
  "--background-index",
  "--fallback-style=Google",
  "--all-scopes-completion",
  "--clang-tidy",
  "--log=error",
  "--suggest-missing-includes",
  "--cross-file-rename",
  "--completion-style=detailed",
  "--pch-storage=memory",     -- could also be disk
  "--folding-ranges",
  "--enable-config",          -- clangd 11+ supports reading from .clangd configuration file
  "--offset-encoding=utf-16", --temporary fix for null-ls
  -- "--limit-references=1000",
  -- "--limit-resutls=1000",
  -- "--malloc-trim",
  -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
  -- "--header-insertion=never",
  -- "--query-driver=<list-of-white-listed-complers>"
}

local provider = "clangd"

local custom_on_attach = function(client, bufnr)
  require("lvim.lsp").common_on_attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
  vim.keymap.set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
  vim.keymap.set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
  vim.keymap.set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
  vim.keymap.set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)

  require("clangd_extensions.inlay_hints").setup_autocmd()
  require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
  clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
  require("lvim.lsp").common_on_init(client, bufnr)
  require("clangd_extensions.config").setup {}
  require("clangd_extensions.ast").init()
  vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]]
end

local opts = {
  cmd = { provider, unpack(clangd_flags) },
  on_attach = custom_on_attach,
  on_init = custom_on_init,
}

require("lvim.lsp.manager").setup("clangd", opts)

-- install codelldb with :MasonInstall codelldb
-- configure nvim-dap (codelldb)
lvim.builtin.dap.on_config_done = function(dap)
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
      command = "codelldb",
      args = { "--port", "${port}" },

      -- On windows you may have to uncomment this:
      -- detached = false,
    },
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        local path
        vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" }, function(input)
          path = input
        end)
        vim.cmd [[redraw]]
        return path
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  dap.configurations.c = dap.configurations.cpp
end -- Additional Plugins