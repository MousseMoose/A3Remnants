params [
	["_target",player],
	["_caller",player],
	["_actionID",-1],
	["_args",[]]
];


private _obj = mgrif_var_inventory_placeObject;

_pos = getPosASL _obj;
_inter = lineIntersectsSurfaces  [_pos, _pos vectorAdd [0,0,-10],_obj];

if(count _inter==0) exitWith {};
detach _obj;
_obj setPosASL ((_inter#0)#0);
(_args#1) call (_args#0); //callback
[] call mgrif_fnc_inventory_placeObjectCleanup;

