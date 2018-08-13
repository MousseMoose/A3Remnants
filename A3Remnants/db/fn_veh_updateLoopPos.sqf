// mgrif_fnc_veh_updateLoop
// Parameters:
//
#define mgrif_UPDATEFREQ 10

//hint format["Entering Update Loop"];
_pos = [];
while {true} do
	{
		{
			if(_x select 1) then {
				_veh = _x select 0;
				_vehID = _veh getVariable "mgrif_vehicleID";
				_pos = [position _veh, (direction _veh)];
				["updateVehPosFuel",[_pos,fuel _veh, _veh getVariable ["mgrif_vehicleId",-1]],true] spawn mgrif_fnc_db_queryASYNC;
				//hint format ["SAVING: %1,%2,%3",_pos,fuel _veh, _veh getVariable ["mgrif_vehicleId",-1]]];
			}
		} forEach mgrif_var_veh_updateQueuePOS;
		sleep mgrif_UPDATEFREQ;
	};