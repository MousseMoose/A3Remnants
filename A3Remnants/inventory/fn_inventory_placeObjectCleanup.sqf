(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",mgrif_var_inventory_placeObjectMouseZChanged];
player removeEventHandler ["killed", mgrif_var_inventory_placeObjectKilled];

mgrif_var_inventory_placeObjectCaller setVariable ["mgrif_inventory_placeObjectCBF",nil];
mgrif_var_inventory_placeObject = nil;
mgrif_var_inventory_placeObjectOffset = nil;
mgrif_var_inventory_placeObjectMouseZChanged = nil;
mgrif_var_inventory_placeObjectKilled = nil;
{mgrif_var_inventory_placeObjectCaller removeAction _x} forEach mgrif_var_inventory_placeObjectActions;
mgrif_var_inventory_placeObjectCaller = nil;
mgrif_var_inventory_placeObjectDelete = nil;
mgrif_var_inventory_placeObjectInProgress = false;