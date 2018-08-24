params [
	["_obj",objNull],
	["_offset",[0,0,0]],
	["_callbackSucceed",[{},[]]],
	["_callbackFail",[{},[]]],
	["_deleteOnFail",false]
];

if(mgrif_var_inventory_placeObjectInProgress) exitWith {
	hint "Already placing something";
	if(_deleteOnFail) then {
		deleteVehicle _obj;
	}
};

mgrif_var_inventory_placeObjectInProgress = true;
mgrif_var_inventory_placeObjectDelete = _deleteOnFail;
mgrif_var_inventory_placeObject = _obj;
mgrif_var_inventory_placeObjectCaller = player;
mgrif_var_inventory_placeObjectOffset = _offset;
mgrif_var_inventory_placeObjectMouseZChanged = 
	(findDisplay 46) displayAddEventHandler ["MouseZChanged",mgrif_fnc_inventory_placeObjectScroll];
_obj attachTo [player,_offset];
player setVariable ["mgrif_inventory_placeObjectCBF",_callbackFail];
mgrif_var_inventory_placeObjectKilled = player addEventHandler ["Killed",{[player, player,-1,(_this#0) getVariable "mgrif_inventory_placeObjectCBF"] spawn mgrif_fnc_inventory_placeObjectCancel}]; 

_action1 = mgrif_var_inventory_placeObjectCaller addAction["Confirm",mgrif_fnc_inventory_placeObjectConfirm,_callbackSucceed,1.5,false,true];
_action2 = mgrif_var_inventory_placeObjectCaller addAction["Cancel",mgrif_fnc_inventory_placeObjectCancel,_callbackFail,1.5,false,true];
mgrif_var_inventory_placeObjectActions = [_action1,_action2];

