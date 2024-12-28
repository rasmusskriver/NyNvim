return {
	dir = "/home/rasmus/Projekter/NeovimPlugin",  -- Lokation af dit plugin
	config = function()
		-- package.loaded['scratch-buffer'] = nil
		require('scratch-buffer')	-- Direkte kald funktionen til at vise åbne buffere
		vim.api.nvim_set_keymap('n', '<leader>ob', ':lua ShowOpenBuffers()<CR>', { noremap = true, silent = true })
	end,
}
