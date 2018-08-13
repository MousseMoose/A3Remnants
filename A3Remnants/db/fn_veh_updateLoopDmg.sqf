// mgrif_fnc_veh_updateLoopDmg
// Parameters:
//					_veh: vehicle
// Description: continuosly saves vehicle hitpoints
#define mgrif_UPDATEFREQ 10

while {true} do
	{
		{["updateVehHP",[(getAllHitPointsDamage _x) select 2,_x getVariable ["mgrif_vehicleID",-1]],true] spawn mgrif_fnc_db_queryASYNC; _x setVariable ["mgrif_nothit",true];} forEach mgrif_var_veh_updateQueueDMG;
		
        mgrif_var_veh_updateQueueDMG = [];
		sleep mgrif_UPDATEFREQ
	};