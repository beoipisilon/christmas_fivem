
fx_version 'cerulean'
game 'gta5'

ui_page "page-side/index.html"

client_scripts {
    '@vrp/lib/utils.lua',
    'client-side/*'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'server-side/*'
}

files {
    'page-side/*',
    'page-side/**/*'
}                            

shared_script 'shared/shared.lua'