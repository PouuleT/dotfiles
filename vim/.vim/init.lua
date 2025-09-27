vim.cmd('source ~/.vimrc')

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  view = {
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 100,
        height = 30,
        row = 5,
        col = 30,
      },
    },
  },
  renderer = {
    icons = {
      glyphs = {
        default = " ",
        symlink = "♢",
        bookmark = "♢",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "▸",
          open = "▾",
          empty = "ø",
          empty_open = "ø",
          symlink = "♢",
          symlink_open = "♢",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "!",
          renamed = "➜",
          untracked = "!",
          deleted = "x",
          ignored = "◌",
        },
      },
    },
  },
})

require("codecompanion").setup({
  display = {
    chat = {
      -- intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
      show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
      separator = "─", -- The separator between the different messages in the chat buffer
      show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
      -- show_settings = true, -- Show LLM settings at the top of the chat buffer?
      show_token_count = true, -- Show the token count for each response?
      start_in_insert_mode = false, -- Open the chat buffer in insert mode?
    },
  },
  opts = {
    log_level = "INFO",
  },
  chat = {
    show_settings = true,
  },
  strategies = {
    chat = {
      adapter = "ovhai", -- choose adapter here
    },
    inline = {
      adapter = "ovhai", -- choose adapter here
    },
  },
  action_palette = {
    width = 95,
    height = 10,
    prompt = "Prompt ", -- Prompt used for interactive LLM calls
    provider = "telescope", -- default|telescope|mini_pick
    opts = {
      show_default_actions = true, -- Show the default actions in the action palette?
      show_default_prompt_library = true, -- Show the default prompt library in the action palette?
      -- show_settings = true,
    },
  },
  adapters = {
    http = {
      opts = {
        show_defaults = false,
        show_model_choices = true,
      },
      ovhai = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://oai.endpoints.kepler.ai.cloud.ovh.net",
            api_key = 'cmd: cat ~/.config/ai-endpoint-ovh/token',
            chat_url = "/v1/chat/completions",
          },
          schema = {
            model = {
              default = "Meta-Llama-3_3-70B-Instruct",
            },
          },
        })
      end,
    },
  },
})

local telescope_actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = telescope_actions.close,
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ["<C-h>"] = telescope_actions.close,
        ["<C-l>"] = telescope_actions.close,
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
})

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

require('render-markdown').setup({
    file_types = { 'markdown', 'quarto', 'codecompanion' },
})
