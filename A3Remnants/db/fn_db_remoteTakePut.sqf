// mgrif_fnc_
// Parameters:
//				_
// Description: Handles wether to update vehicle or player update queue

if((_this#1)==0) then {
    [_this#0, (_this#0) getVariable ["mgrif_playerID",-1], mgrif_var_player_updateQueueINV] call mgrif_fnc_db_addToCargoQueue;
} else {
	[_this#0, (_this#0) getVariable ["mgrif_vehicleID",-1], mgrif_var_veh_updateQueueCargo] call mgrif_fnc_db_addToCargoQueue;
};
