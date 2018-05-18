// mu_fnc_
// Parameters:
//				_
// Description: Handles wether to update vehicle or player update queue

if((_this#1)==0) then {
    [_this#0, (_this#0) getVariable ["mu_playerID",-1], mu_var_player_updateQueueINV] call mu_fnc_db_addToCargoQueue;
} else {
	[_this#0, (_this#0) getVariable ["mu_vehicleID",-1], mu_var_veh_updateQueueCargo] call mu_fnc_db_addToCargoQueue;
};
