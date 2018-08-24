params [
	["_obj",objNull]
];

_pos = getPosASL _obj;
_inter = lineIntersectsSurfaces  [_pos, _pos vectorAdd [0,0,-10],_obj];
detach _obj;
if(count _inter==0) exitWith {};

_obj setPosASL ((_inter#0)#0);