return {
	init_options = {
		index = {
			threads = 64;
		};
		clang = {
			excludeArgs = { "-frounding-math"} ;
		};
	},
	root_dir = function() return vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]) end,
}


