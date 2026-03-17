fx_version 'cerulean'
game 'gta5'

name 'sx-givecar'

shared_scripts {
    '@ox_lib/init.lua',
    '@lation_ui/init.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}