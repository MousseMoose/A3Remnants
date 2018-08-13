// mgrif_fnc_player_updateLoopInv
// Parameters:
// Description:
// Run on: Server

#define TIMEWAIT 10


while {true} do {
	{
		//if( !isNull(_x) then { //
        _cargo = [[_x] call mgrif_fnc_util_getAllCargo];
        { _cargo pushback ([_x select 1] call mgrif_fnc_util_getAllCargo)} foreach (everyContainer _x);
		["updateVehCargoGMIB",[_cargo,_x getVariable ["mgrif_vehicleID",-1]],true] spawn mgrif_fnc_db_queryASYNC;
	}	forEach mgrif_var_veh_updateQueueCARGO;
	mgrif_var_veh_updateQueueCARGO = [];
	uiSleep TIMEWAIT;
};
