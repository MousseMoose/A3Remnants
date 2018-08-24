params [
	["_player",player],
	["_obj",objNull]
];

_rId = [_player,_obj] call mgrif_interface_addRespawnPosition;
_obj setVariable ["mgrif_respawnObjects_playerRespawnID",_rID];
_respawnPlayers pushBack (getPlayerUID _player);
_obj setVariable ["mgrif_respawnObjects_players",_respawnPlayers,true];
true
	
