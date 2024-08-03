local config = {
	show_help = "yes",      -- Show help text for CopilotChatInPlace, default: yes
	debug = false,          -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
	disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
	language = "Japanese",  -- Copilot answer language settings when using default prompts. Default language is English.
	-- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
	-- temperature = 0.1,
	window = {
		layout = 'vertical',
		width = 0.4,
	},

	prompts = {
		Explain = {
			prompt = '/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text in Japanese.',
		},
		Fix = {
			prompt =
			'/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed. Reply in Japanese.',
		},
		Optimize = {
			prompt =
			'/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty. Reply in Japanese.',
		},
	}
}

require("CopilotChat").setup(config)
