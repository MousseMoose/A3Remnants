params [
	["_obj",objNull],
	["_player",player],
	["_switch",true]
];
waitUntil{!isNil "mgrif_interface_addInteraction"};
waitUntil{!isNil "mgrif_interface_removeInteraction"};
waitUntil{!isNil {_obj getVariable "mgrif_respawnObjects_actionID"}};


_rId = _obj getVariable ["mgrif_respawnObjects_playerRespawnID",-1];
_respawnPlayers = _obj getVariable "mgrif_respawnObjects_players";
_respawnPlayers = _respawnPlayers - [getPlayerUID _player]; //find + deleteAt
_obj setVariable ["mgrif_respawnObjects_players",_respawnPlayers,true];
_obj setVariable ["mgrif_respawnObjects_playerRespawnID",nil];
[_obj,_obj getVariable "mgrif_respawnObjects_actionID"] call mgrif_interface_removeInteraction;

if(_switch) then {
	_iId = [_obj,"Assign Quarters",mgrif_fnc_respawnObjects_actionAssignQuarters] call mgrif_interface_addInteraction;
	_obj setVariable ["mgrif_respawnObjects_actionID",_iId];
};


true