waitUntil {!isNull player};
[] call mgrif_fnc_inventory_invEventHandler;
player addEventHandler ["Respawn",mgrif_fnc_inventory_invEventHandler];

mgrif_var_inventory_placeObjectInProgress = false;