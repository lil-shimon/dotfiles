local nullls = require "null-ls"

nullls.setup {
	sources = {
		-- prettier
		nullls.builtins.formatting.prettier
	}
}
