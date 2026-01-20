local v0 = {};
local v1 = game.GameId == 7766605450;
v0.RootPlaceId = v1 and 120148879522453 or 109983668079237;
v0.VoiceServersPlaceId = v1 and 73226809349189 or 128762245270197;
v0.IsContentCreatorGame = function() --[[ Line: 11 ]] --[[ Name: IsContentCreatorGame ]]
    return game.GameId == 8049249507;
end;
v0.IsDevGame = function() --[[ Line: 15 ]] --[[ Name: IsDevGame ]]
    return game.GameId == 7766605450;
end;
v0.IsProdGame = function() --[[ Line: 19 ]] --[[ Name: IsProdGame ]]
    return game.GameId == 7709344486;
end;
local v2 = v1 and 119602771011506 or 96342491571673;
v0.IsNewPlayersServer = function() --[[ Line: 25 ]] --[[ Name: IsNewPlayersServer ]]
    -- upvalues: v2 (copy)
    return game.PlaceId == v2;
end;
local v3 = v1 and 87093272648144 or 99606176102979;
v0.DuelsPlaceId = v3;
v0.AllPlaces = {
    v0.RootPlaceId, 
    v2, 
    v0.VoiceServersPlaceId, 
    v3
};
v0.IsDuelsServer = function() --[[ Line: 39 ]] --[[ Name: IsDuelsServer ]]
    -- upvalues: v3 (copy)
    return game.PlaceId == v3;
end;
v0.IsTsunamiServer = function() --[[ Line: 43 ]] --[[ Name: IsTsunamiServer ]]
    return false;
end;
v0.IsBiggerServer = function() --[[ Line: 47 ]] --[[ Name: IsBiggerServer ]]
    return false;
end;
return v0;