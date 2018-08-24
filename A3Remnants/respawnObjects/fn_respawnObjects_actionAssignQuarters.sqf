params [
	["_obj",objNull],
	["_player",player],
	["_interactionID",-1]
];

_respawnPlayers = _obj getVariable "mgrif_respawnObjects_players";
if((getPlayerUID _player) in _respawnPlayers || (_obj getVariable "mgrif_respawnObjects_capacity") <= (count _respawnPlayers)) exitWith {hint "All Quarters are assigned";false};
[player,_obj] call mgrif_fnc_respawnObjects_addPlayerRespawn;
[_obj,_interactionID] call mgrif_interface_removeInteraction;
_iId = [_obj,"Unassign Quarters",mgrif_fnc_respawnObjects_actionUnAssignQuarters] call mgrif_interface_addInteraction;
_obj setVariable ["mgrif_respawnObjects_actionID",_iId];
true
	
