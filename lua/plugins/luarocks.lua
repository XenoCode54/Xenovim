return {
	"vhyrro/luarocks.nvim",
	priority = 1001, -- this plugin needs to run before anything else
	config = true,
	opts = {
		rocks = { "magick", "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
	},
}
