params [
	["_uid",""],
	["_rid",-1]
];

if(_uid == "" || _rid < 0) exitWith {false};
["registerProfileRespawn",[_uid,_rid],false] spawn mgrif_fnc_db_queryASYNC;
true