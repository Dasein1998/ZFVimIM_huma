let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/huma.txt'
    let dbCountFile = '/misc/huma_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : 'huma',
                \ })
    call ZFVimIM_cloudRegister({
                \   'mode' : 'git',
                \   'dbId' : db['dbId'],
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'gitUserEmail' : get(g:, 'ZFVimIM_huma_gitUserEmail', get(g:, 'zf_git_user_email', '')),
                \   'gitUserName' : get(g:, 'ZFVimIM_huma_gitUserName', get(g:, 'zf_git_user_name', '')),
                \   'gitUserToken' : get(g:, 'ZFVimIM_huma_gitUserToken', get(g:, 'zf_git_user_token', '')),
                \ })
endfunction

augroup ZFVimIM_huma_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

