local M = {}

function M.setup()
	local whichkey = require"which-key"
	local conf = {
		window = {
			border = "single",
			position = "bottom",
		},
	}
	local n_opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = t,
		nowait = false,
		noremap = true,
	}
	local n_mappings = {
		c = {
			name = "Navigate Tabs",
			c = { "<cmd>tabp<cr>", "Previous Tab" },
			d = { "<cmd>tabn<cr>", "Previous Tab" },
		},
        m = {
            name = "Make",
            m = {"<cmd>copen<cr>" , "Open"},
            c = {"<cmd>cclose<cr>", "Close"},
            t = {"<cmd>cw<cr>"    , "Toggle"},
            n = {"<cmd>cnext<cr>" , "Next"},
            p = {"<cmd>cprev<cr>" , "Prev"},
        },
		e = {
			name = "File Explorer",
            f = { "<cmd>NvimTreeFocus<cr>", "Focus" },
			r = { "<cmd>NvimTreeRefresh<cr>", "Refresh" },
			t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
		},
		w = {
			name = "Views",
			f = { "<cmd>vsplit<cr>", "Split Vertical" },
			g = { "<cmd>split<cr>", "Split Horizontal" },
		},
		f = {
			name = "Telescope",
			f = { "<cmd>Telescope find_files<cr>", "Find Files" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
			h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
			e = { 
				name = "History",
				s = { "<cmd>Telescope search_history<cr>", "Search History" },
				c = { "<cmd>Telescope command_history<cr>", "Command History" },
			},
		},
		t = {
			name = "Terminal",
			t = { "<cmd>ToggleTerm size=40 direction=horizontal<cr>", "Toggle" },
		},
	}

	whichkey.setup(confg)
	whichkey.register(n_mappings, n_opts) -- Normal Mappings
	
	vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
	vim.g.mapleader = " " -- <leader> = <space>
	vim.g.maplocalleader = " " -- local context, same thing as above.
end

return M
