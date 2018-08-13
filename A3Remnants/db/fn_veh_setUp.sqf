// mgrif_fnc_veh_setUp
// Parameters:
//					none
// Description:		loads vehicles from the database and spawns them.



_vehicles = ["getWorldVehicles",[mgrif_const_worldID],false] call mgrif_fnc_db_queryASYNC;
for[{_i=0},{_i< (count _vehicles)},{_i=_i+1}] do
	{
		(_vehicles select _i) spawn mgrif_fnc_veh_spawnWorld;
	};
	
