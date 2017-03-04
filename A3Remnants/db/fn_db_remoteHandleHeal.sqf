// mu_fnc_
// Parameters:
//				_
// Description: 

mu_var_player_updateQueueDMG pushbackunique (_this select 0);
[ _this select 1,(_this select 1) getVariable ["mu_playerID",-1], mu_var_player_updateQueueINV] call mu_fnc_db_addToCargoQueue;
