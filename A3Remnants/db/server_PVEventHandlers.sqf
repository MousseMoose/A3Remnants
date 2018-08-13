/*if(isServer && !isDedicated) then {
    	 player addEventHandler ["Put", {
         mgrif_var_client_ehPutTake = [_this select 0,_this select 1];
         publicVariableServer "mgrif_var_client_ehPutTake";
    }];
    	
    };*/
 
/*
"mgrif_var_client_ehPutTake" addPublicVariableEventHandler {
    //Todo: objectParent backpacks
    _target =(_this select 1) select 1;
    [(_this select 1) select 0,((_this select 1) select 0) getVariable ["mgrif_playerID",-1],mgrif_var_player_updateQueueINV] call mgrif_fnc_db_addToCargoQueue;
    if(_target isKindOf "Bag_Base") then {
        _target = objectParent _target;
        if(_target isKindOf "Man") then  {
            [_target,_target getVariable ["mgrif_playerID",-1],mgrif_var_player_updateQueueINV] call mgrif_fnc_db_addToCargoQueue;
        };
    };
    [(_this select 1) select 1,((_this select 1) select 1) getVariable ["mgrif_vehicleID",-1],mgrif_var_veh_updateQueueCargo] call mgrif_fnc_db_addToCargoQueue;
    
};
*/
