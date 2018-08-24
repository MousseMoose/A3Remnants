params [
	["_obj",objNull],
	["_capacity",1],
	["_players",[]],
	["_id",-1]
	
];

_obj setVariable ["mgrif_respawnObjects_capacity",_capacity,true];
_obj setVariable ["mgrif_respawnObjects_players",_players,true];
[_obj] remoteExec ["mgrif_fnc_respawnObjects_remoteSetActions",-2,_obj];


