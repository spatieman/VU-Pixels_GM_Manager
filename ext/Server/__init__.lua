-- Check if there is a new version
require('__shared/UpdateCheck')  -- If you dant be nagged with it, put some -- in front of it, hehe

local onetimeonly = {}

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo ~= "Registering entity resources" then
        return
    end

	if SharedUtils:GetCurrentGameMode() == "GunMaster0" then

::random::
	math.randomseed(os.time())
	GMpresetTMP = math.random(0, 8)
	if GMpresetRND == nil then GMpresetRND = GMpresetTMP end
	if GMpresetTMP == GMpresetRND then 
	goto random

	else 
	GMpreset = GMpresetTMP
	GMpresetRND = GMpresetTMP -- Preset set for the next round to compare
	end
	    
	    if GMpreset == 0 then GMpresetName = "Standard"
	elseif GMpreset == 1 then GMpresetName = "Standard reversed"
	elseif GMpreset == 2 then GMpresetName = "Light weight"
	elseif GMpreset == 3 then GMpresetName = "Heavy gear"
	elseif GMpreset == 4 then GMpresetName = "Pistol run"
	elseif GMpreset == 5 then GMpresetName = "Snipers heaven"
	elseif GMpreset == 6 then GMpresetName = "US arms race"
	elseif GMpreset == 7 then GMpresetName = "RU arms race"
	elseif GMpreset == 8 then GMpresetName = "EU arms race"
end

	RCON:SendCommand('vars.gunMasterWeaponsPreset', { tostring(GMpreset) }) 
	print('GunMaster preset:'..GMpreset..' - Presetname:'..GMpresetName..'')
end
end) 

-- ---------------------------
Events:Subscribe('Player:Respawn', function(player, recipientMask, message,info,yell) 

	if SharedUtils:GetCurrentGameMode() == "GunMaster0" then
	if onetimeonly ~= nil then  
	onetimeonly = nil

	ChatManager:SendMessage("GunMaster preset = " ..GMpreset.. " - Presetname:" ..GMpresetName ) 

end
end
end)

Events:Subscribe('Level:Destroy', function()
onetimeonly = {}
end)   
