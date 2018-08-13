params [
	["_target",objNull],
	["_pos",[]]
];

if((count pos) < 3 || isNull _target) exitWith {false};
[_target, _pos] call bis_fnc_addRespawnPosition;
["registerRespawn",[mgrif_const_worldId,_pos],false] spawn mgrif_fnc_db_queryASYNC;