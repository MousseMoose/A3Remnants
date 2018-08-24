params [
	["_min",0],
	["_max",150]
];

_respawnPoint = [0,0,0];
_anchor = selectRandom mgrif_var_respawn_areas;
if(!isNil "_anchor") then {
	_respawnPoint = [_anchor, _min, _max, 5, 0, 10, 0] call bis_fnc_findSafePos;
};

_respawnPoint
