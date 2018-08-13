// mgrif_fnc_
// Parameters:
//				_
// Description: 

mgrif_var_player_updateQueueDMG pushbackunique (_this select 0);
[ _this select 1,(_this select 1) getVariable ["mgrif_playerID",-1], mgrif_var_player_updateQueueINV] call mgrif_fnc_db_addToCargoQueue;
