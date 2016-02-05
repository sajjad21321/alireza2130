
udo(msg) then --after changed to moderator mode, set only sudo

    return list_all_plugins()

  end


  -- Re-enable a plugin for this chat

  if matches[1] == '+' and matches[3] == 'chat' then

    local receiver = get_receiver(msg)

    local plugin = matches[2]

    print("enable "..plugin..' on this chat')

    return reenable_plugin_on_chat(receiver, plugin)

  end


  -- Enable a plugin

  if matches[1] == '+' and is_sudo(msg) then --after changed to moderator mode, set only sudo

    local plugin_name = matches[2]

    print("enable: "..matches[2])

    return enable_plugin(plugin_name)

  end


  -- Disable a plugin on a chat

  if matches[1] == '-' and matches[3] == 'chat' then

    local plugin = matches[2]

    local receiver = get_receiver(msg)

    print("disable "..plugin..' on this chat')

    return disable_plugin_on_chat(receiver, plugin)

  end


  -- Disable a plugin

  if matches[1] == '-' and is_sudo(msg) then --after changed to moderator mode, set only sudo

    if matches[2] == 'plugins' then

     return 'This plugin can\'t be disabled'

    end

    print("disable: "..matches[2])

    return disable_plugin(matches[2])

  end


  -- Reload all the plugins!

  if matches[1] == '?' and is_sudo(msg) then --after changed to moderator mode, set only sudo

    return reload_plugins(true)

  end

end


return {

  description = "Plugin to manage other plugins. Enable, disable or reload.", 

  usage = {

      moderator = {

          "!plugins - [plugin] chat : disable plugin only this chat.",

          "!plugins + [plugin] chat : enable plugin only this chat.",

          },

      sudo = {

          "!plugins : list all plugins.",

          "!plugins + [plugin] : enable plugin.",

          "!plugins - [plugin] : disable plugin.",

          "!plugins ? : reloads all plugins." },

          },

  patterns = {

    "^!plugins$",

    "^!plugins? (+) ([%w_%.%-]+)$",

    "^!plugins? (-) ([%w_%.%-]+)$",

    "^!plugins? (+) ([%w_%.%-]+) (chat)",

    "^!plugins? (-) ([%w_%.%-]+) (chat)",

    "^!plugins? (?)$" },

  run = run,

  moderated = true, -- set to moderator mode

  --privileged = true

}


end
