local M = {}

function M.setup(opts)
	opts = opts or {}
	local p = require("deep-space.palette")

	if type(opts.overrides) == "function" then
		opts.overrides(p)
	end

	require("deep-space.theme").apply(p)

	if vim.o.termguicolors ~= true then
		vim.o.termguicolors = true
	end

	M.palette = p
end

function M.load()
	require("deep-space").setup()
end

return M
