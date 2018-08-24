params [
	["_obj",objNull]
];

waitUntil {!isNil "mgrif_interface_addInteraction"};
waitUntil {!isNil {_obj getVariable "mgrif_respawnObjects_players"}};
_respawnPlayers = _obj getVariable "mgrif_respawnObjects_players";
_rid = -1;
if ((getPlayerUID player) in _respawnPlayers) then {
	_rid = [_obj,"Unassign Quarters",mgrif_fnc_respawnObjects_actionUnAssignQuarters] call mgrif_interface_addInteraction;
	_obj setVariable ["mgrif_respawnObjects_actionID",_rid];
} else {
	_rid = [_obj,"Assign Quarters",mgrif_fnc_respawnObjects_actionAssignQuarters]  call mgrif_interface_addInteraction;
};

_obj setVariable ["mgrif_respawnObjects_actionID",_rid];


