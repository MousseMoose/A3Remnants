// mu_fnc_
// Parameters:
//				_
// Description: Handles wether to update vehicle or player update queue

if((_this select 2)==0) then {
    [_this select 0, _this select 1, mu_var_player_updateQueueINV] call mu_fnc_db_addToCargoQueue;
} else {
    [_this select 0, _this select 1, mu_var_veh_updateQueueCargo] call mu_fnc_db_addToCargoQueue;
};
