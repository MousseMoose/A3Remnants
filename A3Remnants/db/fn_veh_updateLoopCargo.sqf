// mu_fnc_player_updateLoopInv
// Parameters:
// Description:
// Run on: Server

#define TIMEWAIT 10


while {true} do {
	{
		//if( !isNull(_x) then { //
        _cargo = [[_x] call mu_fnc_util_getAllCargo];
        { _cargo pushback ([_x select 1] call mu_fnc_util_getAllCargo)} foreach (everyContainer _x);
		["updateVehCargoGMIB",[_cargo,_x getVariable ["mu_vehicleID",-1]],true] spawn mu_fnc_db_queryASYNC;
	}	forEach mu_var_veh_updateQueueCARGO;
	mu_var_veh_updateQueueCARGO = [];
	uiSleep TIMEWAIT;
};
