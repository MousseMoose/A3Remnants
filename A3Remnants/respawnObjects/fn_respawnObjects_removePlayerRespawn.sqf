params [
	["_player",player],
	["_obj",objNull]
];

[_player,(_obj getVariable "mgrif_respawnObjects_playerRespawnID")#1] call mgrif_interface_removeRespawnPosition;
_respawnPlayers = _obj getVariable "mgrif_respawnObjects_players";
_respawnPlayers = _respawnPlayers - [getPlayerUID _player]; //find + deleteAt

_obj setVariable ["mgrif_respawnObjects_players",_respawnPlayers,true];


true
	
