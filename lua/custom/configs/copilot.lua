
return function()
	vim.defer_fn(function()
		require("copilot").setup({
			cmp = {
				enabled = true,
				method = "getCompletionsCycling",
			},
			panel = {
				-- if true, it can interfere with completions in copilot-cmp
				enabled = true,
				autorefresh = true,
				keymap = {
					jump_prev = "g[",
					jump_next = "g]",
					accept = "<CR>",
					refresh = "gr",
					open = "<C-End>",
				},
			},
			suggestion = {
				-- if true, it can interfere with completions in copilot-cmp
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-k>",
					accept_word = false,
					accept_line = false,
					next = "<M-n>",
					prev = "<M-S-n>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				["dap-repl"] = false,
				["big_file_disabled_ft"] = false,
				markdown = true,
			},
		})
	end, 100)
end
