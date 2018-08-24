params [
	["_obj",objNull],
	["_player",player],
	["_interactionID",-1]
];


//hint str (_obj getVariable "mgrif_respawnObjects_playerRespawnID");
//[_player,(_obj getVariable "mgrif_respawnObjects_playerRespawnID")#1] call mgrif_interface_removeRespawnPosition;
[_player,_obj] call mgrif_fnc_respawnObjects_removePlayerRespawn;
[_obj,_interactionID] call mgrif_interface_removeInteraction;
_iId = [_obj,"Assign Quarters",mgrif_fnc_respawnObjects_actionAssignQuarters] call mgrif_interface_addInteraction;
_obj setVariable ["mgrif_respawnObjects_actionID",_iId];

true
	
