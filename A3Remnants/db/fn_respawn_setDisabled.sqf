params [
	["_id",-1],
	["_disabled",0]
];

if(_id < 0) exitWith {false};
["updateRespawnDisabled",[_id,_disabled],true] spawn mgrif_fnc_db_queryASYNC;