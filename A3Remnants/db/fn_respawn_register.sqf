params [
	["_target",objNull],
	["_pos",[]]
];

if((count pos) < 3 || isNull _target) exitWith {false};
["registerRespawn",[mgrif_const_worldId,[_pos,getDir _target]],false] spawn mgrif_fnc_db_queryASYNC;