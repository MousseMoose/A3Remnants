// mu_fnc_veh_updateLoop
// Parameters:
//
#define MU_UPDATEFREQ 10

//hint format["Entering Update Loop"];
_pos = [];
while {true} do
	{
		{
			if(_x select 1) then {
				_veh = _x select 0;
				_vehID = _veh getVariable "mu_vehicleID";
				_pos = [position _veh, (direction _veh)];
				["updateVehPosFuel",[_pos,fuel _veh, _veh getVariable ["mu_vehicleId",-1]],true] spawn mu_fnc_db_queryASYNC;
				//hint format ["SAVING: %1,%2,%3",_pos,fuel _veh, _veh getVariable ["mu_vehicleId",-1]]];
			}
		} forEach mu_var_veh_updateQueuePOS;
		sleep MU_UPDATEFREQ;
	};