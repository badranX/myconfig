vim.api.nvim_create_autocmd(
    'vimEnter',
    {
        pattern='*',
        ---command='!clear ; g++ %; if [ -f a.out ]; then time ./a.out; rm a.out; fi'
	callback=function(ev)
	main_term_buf_name = "MainTermX:term"
	vim.cmd('execute "tabnew" | execute "term" | execute "file '.. main_term_buf_name .. '"')

	---| nnoremap <buffer> <Space><Space> :tabfirst<CR> |  execute "tabfirst"')

vim.keymap.set({'n'}, '<Space><Space>', function(input)
if vim.fn.tabpagenr() == 1 then
	vim.cmd("b#")
else
	vim.cmd("tabfirst")
	end

end, { buffer = true })

	vim.cmd("nnoremap <Leader><Space> :tablast<CR>:b " .. main_term_buf_name .. "<CR>")
	vim.cmd("tabfirst")
  	  end

    }
)



--- another operation


local function buffer_exists_by_name(name)
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(bufnr) == name then
      return true
    end
  end
  return false
end

vim.api.nvim_create_user_command(
  'Thisterm',
	function(input)
		local cur_buf = vim.api.nvim_get_current_buf()
		local bnum = vim.api.nvim_buf_get_number(cur_buf)
		local bname = vim.fn.expand('%')
		local buf_name =  bname .. ':term'
		local bufs = vim.api.nvim_list_bufs()
		print("buf_name: ", buf_name)
		--if buffer_exists_by_name(buf_name) then
		if false then
			vim.cmd('execute "b ' .. buf_name .. '"')
		else
			vim.cmd('execute "nnoremap <buffer> <Space>e :b ' .. buf_name .. '<CR>"')
			vim.cmd('execute "edit term://%:p:h//bash" | execute "file ' .. buf_name .. '" | execute "nnoremap <buffer> <Space>e :b' .. bnum ..'<CR>"')
		end
	---	vim.call('fzf#vim#files', '~/projects', input.bang)
	end,
	{bang = true}
)

--- another operation
--
--
--


	-- vim.keymap.set('n', '<Leader>e', ':b term.' .. vim.fn.expand('%') .. '<CR>')
	function is_term(bufname)
    	    if string.sub(bufname, 1, #"term:") == "term:" or string.sub(bufname, -#":term") == ":term" then
	    	    return true
		end
		return false
	end

	function is_no_term(bufname)
    	    if not is_term(bufname) then
	    	    return true
		end
		return false
	end

	function list_bufs(filter_fn)
  	  	  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
			 ---print(bufnr)
				bufname = vim.api.nvim_buf_get_name(bufnr)
			
			is_listed = vim.bo[bufnr].buflisted
    	    	    	    if is_listed and filter_fn(bufname) then
			    	    last_path_item = vim.fs.basename(bufname)
			    	    print(bufnr, '*'.. last_path_item .. '*', bufname)
				    end

			end
		print('\n')
		---vim.cmd("normal :b ")
		local fname = vim.fn.input("b ", "", "file")
		vim.cmd('b ' .. fname)
	end

	vim.api.nvim_create_user_command(
  	  'Terms',
		function(input)
			list_bufs(is_term)
		end,
		{bang = true}
	)

	vim.api.nvim_create_user_command(
  	  'Buffers',
		function(input)
			list_bufs(is_no_term)
		end,
		{bang = true}
	)



	vim.api.nvim_create_user_command(
  	  'Comp',
		function(input)
			list_bufs(is_no_term)
		end,
		{bang = true}
	)
