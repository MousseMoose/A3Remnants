params [
	["_target",player],
	["_caller",player],
	["_actionID",-1],
	["_args",[{},[]]]
];

private _obj = mgrif_var_inventory_placeObject;
detach _obj;
if (mgrif_var_inventory_placeObjectDelete) then {
	deleteVehicle _obj;
} else {
	[_obj] call mgrif_fnc_inventory_placeObjectOnSurface;
};
(_args#1) call (_args#0);
[] call mgrif_fnc_inventory_placeObjectCleanup;