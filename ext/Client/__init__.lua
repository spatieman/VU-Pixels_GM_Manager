Events:Subscribe('Level:Loaded', function(levelName, gameMode)
announcedPlayer=0
end)

Events:Subscribe('Player:Respawn', function(player)
	if SharedUtils:GetCurrentGameMode() == "GunMaster0" then
if announcedPlayer==0 then
NetEvents:SendLocal('GM_message')
announcedPlayer=1
end
end
end)

Events:Subscribe('Level:Destroy', function()
announcedPlayer = {}
end)
