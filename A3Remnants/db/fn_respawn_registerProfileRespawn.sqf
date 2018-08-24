params [
	["_player",objNull],
	["_respawn",objNull]
];

_uid = getPlayerUID _player;
_rId = _respawn getVariable ['mgrif_respawn_id',-1];

if(_uid == "" || _rid < 0) exitWith {false};
["registerProfileRespawn",[_uid,_rid],true] spawn mgrif_fnc_db_queryASYNC;
true