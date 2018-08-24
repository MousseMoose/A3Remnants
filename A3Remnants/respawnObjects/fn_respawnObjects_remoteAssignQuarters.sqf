params [
	["_obj",objNull],
	["_player",player],
	["_switch",true]
	
];
waitUntil{!isNil "mgrif_interface_addInteraction"};
waitUntil{!isNil "mgrif_interface_removeInteraction"};
waitUntil{!isNil {_obj getVariable "mgrif_respawnObjects_actionID"}};
_rId = [_player,_obj] call bis_fnc_addRespawnPosition;
_obj setVariable ["mgrif_respawnObjects_playerRespawnID",_rID];
_respawnPlayers = _obj getVariable "mgrif_respawnObjects_players";
_respawnPlayers pushBack (getPlayerUID _player);
_obj setVariable ["mgrif_respawnObjects_players",_respawnPlayers,true];
[_obj,_obj getVariable "mgrif_respawnObjects_actionID"] call mgrif_interface_removeInteraction;

if(_switch) then {
	_iId = [_obj,"Unassign Quarters",mgrif_fnc_respawnObjects_actionUnAssignQuarters] call mgrif_interface_addInteraction;
	_obj setVariable ["mgrif_respawnObjects_actionID",_iId];
};

true
	
