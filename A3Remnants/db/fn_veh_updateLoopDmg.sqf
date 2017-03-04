// mu_fnc_veh_updateLoopDmg
// Parameters:
//					_veh: vehicle
// Description: continuosly saves vehicle hitpoints
#define MU_UPDATEFREQ 10

while {true} do
	{
		{["updateVehHP",[(getAllHitPointsDamage _x) select 2,_x getVariable ["mu_vehicleID",-1]],true] spawn mu_fnc_db_queryASYNC; _x setVariable ["mu_nothit",true];} forEach mu_var_veh_updateQueueDMG;
		
        mu_var_veh_updateQueueDMG = [];
		sleep MU_UPDATEFREQ
	};