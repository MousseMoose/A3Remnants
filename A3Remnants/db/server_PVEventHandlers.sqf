/*if(isServer && !isDedicated) then {
    	 player addEventHandler ["Put", {
         mu_var_client_ehPutTake = [_this select 0,_this select 1];
         publicVariableServer "mu_var_client_ehPutTake";
    }];
    	
    };*/
 
/*
"mu_var_client_ehPutTake" addPublicVariableEventHandler {
    //Todo: objectParent backpacks
    _target =(_this select 1) select 1;
    [(_this select 1) select 0,((_this select 1) select 0) getVariable ["mu_playerID",-1],mu_var_player_updateQueueINV] call mu_fnc_db_addToCargoQueue;
    if(_target isKindOf "Bag_Base") then {
        _target = objectParent _target;
        if(_target isKindOf "Man") then  {
            [_target,_target getVariable ["mu_playerID",-1],mu_var_player_updateQueueINV] call mu_fnc_db_addToCargoQueue;
        };
    };
    [(_this select 1) select 1,((_this select 1) select 1) getVariable ["mu_vehicleID",-1],mu_var_veh_updateQueueCargo] call mu_fnc_db_addToCargoQueue;
    
};
*/
