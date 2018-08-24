params [
	["_player",objNull],
	["_respawn",objNull]
];
_uid = getPlayerUID _player;
_id = _respawn getVariable ['mgrif_respawn_id',-1];
if(_id < 0) exitWith {false};
["deleteProfileRespawn",[_uid,_id],true] spawn mgrif_fnc_db_queryASYNC;
true