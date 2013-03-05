let s:save_cpo = &cpo
set cpo&vim

" for quickrun config like follows
"   augroup NameIsUpToYou
"   	autocmd BufWinEnter,BufNewFile *_spec.coffee set filetype=coffee.vows
"   augroup END
"   let g:quickrun_config['coffee.vows'] = {'command': 'vows', 'args': '--spec',
"           \ 'hook/coffee_vows_filter/enable': 1,

let s:hook = {
      \   'name': 'coffee_vows_filter',
      \   'kind': 'hook',
      \   'config': {
      \     'enable': 0,
      \   },
      \ }


function! s:hook.on_output(session, context)
  let data = a:context.data
  let a:context.data = substitute(data, "\<Char-0x1b>[\\d\\+m", '', 'g' )
endfunction

function! quickrun#hook#coffee_vows_filter#new()
  return deepcopy(s:hook)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
