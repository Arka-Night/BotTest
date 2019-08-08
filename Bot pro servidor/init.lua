local discordia = require("discordia")
local client = discordia.Client()
local prefix = "["
local pessoas = {}
local votos = {}
local votaram = {}
local i = 1
local y = 1

client:on('ready', function()
	-- client.user is the path for your bot
	print('Logado como '.. client.user.username)
end)

client:on('messageCreate', function(message)
    if message.content == prefix.."ola" then
        message.channel:send("ola! " .. message.author.username)

    else if message.content == prefix.."desligue" then
        if message.author.username == "rEiNbU gAi" then
            client:stop()

        end

    else if string.sub(message.content, 1, 4) == prefix.."say" and string.sub(message.content, 5, 5) == " " then
        local leng = string.len(message.content)
        message.channel:send(string.sub(message.content, 6, leng) .. " de " .. message.author.username)

    else if string.sub(message.content, 1, 6) == prefix.."votar" then
        if message.mentionedUsers.first and message.mentionedRoles.first == nil and message.mentionedEmojis.first == nil and message.mentionedChannels.first == nil then
            local pessoasavotar = message.mentionedUsers.first
            local javotou = false
            message.channel:send(pessoasavotar.mentionString)

            if pessoasavotar.mentionString ~= nil then
                for x = 1, #votaram, 1 do
                    if message.author.username == votaram[x] then
                        javotou = true
                        message.channel:send("Você já votou")
                    end
                
                end
                for x = 1, #pessoas, 1 do
                    if pessoas[x] == pessoasavotar.mentionString and javotou == false then
                        votos[x] = votos[x] + 1
                        message.channel:send("O usuário " .. message.author.mentionString .. " acabou de votar em: " .. pessoasavotar.mentionString)
                        votaram[y] = message.author.mentionString
                        y = y + 1

                    end

                end

            else
                message.channel:send("pessoas a votar: ")
                for x = 1, #pessoas, 1 do
                    message.channel:send(pessoas[x])

                end

            end
        end


    else if message.content == prefix.."help" then
        message.author:getPrivateChannel():send("Os comandos são: [ola, [say, [help e [votar")

    else if string.sub(message.content, 1, 4) == prefix.."add" and string.sub(message.content, 5, 5) == " " then
        if message.mentionedUsers.first and message.mentionedRoles.first == nil and message.mentionedEmojis.first == nil and message.mentionedChannels.first == nil then
            local pessoas1 = message.mentionedUsers.first
            local existe = false

            for x = 1, #pessoas, 1 do
                if pessoas[x] == pessoas1.mentionString then
                    existe = true
                
                end
            end

            if pessoas and existe == false then
                pessoas[i] = pessoas1.mentionString
                votos[i] = 0
                i = i + 1
                message.channel:send("Pessoa adicionada com sucesso: " .. pessoas[i-1])

            else
                message.channel:send("Você não mensionou ninguém ou a pessoa ja esta adicionada")

            end
        end

    else if message.content == prefix.."deleteall" then
        pessoas = {}
        votos ={}
        i = 1
        votaram = {}
        y = 1
        message.channel:send("Todo mundo deletado")

    end
    end
    end
    end
    end
    end
    end

end)

client:run('Bot NTA1MzY5ODU0MzgwMDgxMTgy.XUybCQ.am2U_Q496Nr_G8BKbUq0XjF25lQ')
