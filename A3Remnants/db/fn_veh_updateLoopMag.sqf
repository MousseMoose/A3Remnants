// mgrif_fnc_veh_updateLoop
// Parameters:
//
#define mgrif_UPDATEFREQ 10

while {true} do
	{
		{["updateVehMags",[[_x] call mgrif_fnc_util_getVehicleTurretMags,_x getVariable ["mgrif_vehicleID",-1]],true] spawn mgrif_fnc_db_queryASYNC;_x setVariable ["mgrif_notFired",true];} forEach mgrif_var_veh_updateQueueMAG;
        mgrif_var_veh_updateQueueMAG  = [];
		sleep mgrif_UPDATEFREQ;
	};