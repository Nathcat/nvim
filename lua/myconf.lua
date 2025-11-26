vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function (args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.keymap.set("n", "<C-n>", ":NvimTreeFocus<Enter>")
vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<Enter>")
vim.keymap.set("n", "<C-e>", ":NvimTreeFindFile<Enter>")

local j_config = {
	name = "jdtls",
	cmd = {"/home/nathcat/Programs/jdtls/bin/jdtls"},
	root_dir = vim.fs.root(0, {"gradlew, .git, mvnw"}),
	settings = {
		java = {
			home = "/usr/lib/jvm/java-21"
		}
	},

	on_attach = function (client, bufnr)
		require ("jdtls.setup").add_commands()
	end,
}

require("jdtls").start_or_attach(j_config)
vim.lsp.enable("jdtls")
