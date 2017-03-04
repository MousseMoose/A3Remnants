// mu_fnc_veh_updateLoop
// Parameters:
//
#define MU_UPDATEFREQ 10

while {true} do
	{
		{["updateVehMags",[[_x] call mu_fnc_util_getVehicleTurretMags,_x getVariable ["mu_vehicleID",-1]],true] spawn mu_fnc_db_queryASYNC;_x setVariable ["mu_notFired",true];} forEach mu_var_veh_updateQueueMAG;
        mu_var_veh_updateQueueMAG  = [];
		sleep MU_UPDATEFREQ;
	};