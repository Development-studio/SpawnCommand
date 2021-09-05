Cconfig = data.openConfig('.\\plugins\\SpawnCommand\\config.json', 'json', '{}')

if Cconfig:get('x') == nil then
    Cconfig:set('x', 100)
    Cconfig:set('y', 100)
    Cconfig:set('z', 100)
    Cconfig:set('dimid', 0)
end

X = Cconfig:get('x')
Y = Cconfig:get('y')
Z = Cconfig:get('z')
Dimid = Cconfig:get('dimid')

function reload()
    Cconfig:reload()
    X = Cconfig:get('x')
    Y = Cconfig:get('y')
    Z = Cconfig:get('z')
    Dimid = Cconfig:get('dimid')
end

-- mc.regPlayerCmd("spawn", "tp to spawn", function(pl) mc.runcmd('tp "' .. pl.name .. '" ' .. X .. ' ' .. Y .. ' ' .. Z .. ' ') end)
mc.regPlayerCmd("spawn", "tp to spawn", function(pl,args) pl:teleport(X,Y,Z,Dimid) end)


mc.regConsoleCmd("spawnreload", "spawnreload", function(pl)
    reload()
    colorLog("red", "Spawn Reloaded. Change to Dimid:"..Dimid..", x:" .. X .. " y:" .. Y.. " z:" .. Z, "\n")

end)

print('[\27[92mCRON\27[0m] \27[93mSpawnCMD loaded\27[0m')