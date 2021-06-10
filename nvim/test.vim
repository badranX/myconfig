for i in map(range(91,93) +range(97, 122), 'nr2char(v:val)')
	exec "inoremap `".i." <S-".i.">"
endfor

