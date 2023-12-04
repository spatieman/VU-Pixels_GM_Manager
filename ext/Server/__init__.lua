-- Check if there is a new version
require('__shared/UpdateCheck')  -- If you dont be nagged with it, put some -- in front of it, hehe
GMpresetName={"Standard","Standard reversed","Light weight","Heavy gear","Pistol run","Snipers heaven","US arms race","RU arms race","EU arms race"}

Events:Subscribe('Level:LoadingInfo', function(screenInfo)
    if screenInfo ~= "Registering entity resources" then
        return
    end

	if SharedUtils:GetCurrentGameMode() == "GunMaster0" then

::randomizer::
	math.randomseed(os.time())
	GMpresetTMP = math.random(1, 9)
	if GMpresetRND == nil then GMpresetRND = GMpresetTMP end
	if GMpresetTMP == GMpresetRND then goto randomizer

	else 
	GMpreset = GMpresetTMP
	GMpresetRND = GMpresetTMP -- Preset set for the next round to compare
	end

	RCON:SendCommand('vars.gunMasterWeaponsPreset', { tostring(GMpreset-1) }) 
	print('GunMaster preset:'..tostring(GMpresetName[GMpreset]..''))
end
end) 
-- -----------------

NetEvents:Subscribe('GM_message', function(player)
	ChatManager:SendMessage("GunMaster preset =" ..tostring(GMpresetName[GMpreset] )) 
end) 
