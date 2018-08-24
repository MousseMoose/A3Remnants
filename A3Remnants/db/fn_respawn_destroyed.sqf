params [
	["_id",-1]
];

if(_id < 0) exitWith {false};
["respawnDestroyed",[_id],true] spawn mgrif_fnc_db_queryASYNC;
["respawnDestroyed2",[_id],true] spawn mgrif_fnc_db_queryASYNC;