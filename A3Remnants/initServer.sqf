if(isServer) then {
    mgrif_var_server_initDone = false;
    //initialise modules
	#include "interfaces\initInterfaces.sqf"
	#include "util\initUtil.sqf"
	#include "db\initDB.sqf"
	waitUntil {!isNil "mgrif_fnc_veh_switchSaveStatePos"};
	
	mgrif_const_worldID=1; //Stratis
	
	if(uiNameSpace getVariable ["mgrif_db_stuff",true]) then {
		"extDB3" callExtension "9:ADD_DATABASE:arma";
		"extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:arma:SQL_CUSTOM:SQL:projectMu.ini";
		test1 = "extDB3" callExtension format ["0:SQL:getWorldVehicles:%1",mgrif_const_worldID];
		uiNameSpace setVariable ["mgrif_db_stuff",false];
		}else{
			test1 = "extDB3" callExtension format ["0:SQL:getWorldVehicles:%1",mgrif_const_worldID];
		};
	test1 = call compile test1;
    
    
    
    mgrif_var_server_initDone = true;
    publicVariable "mgrif_var_server_initDone";
    [] spawn mgrif_fnc_veh_setUp;
	[] spawn mgrif_fnc_respawn_setUp;
};


//----------------Data
waitUntil{!isNil "mgrif_var_respawn_areas"};
mgrif_var_respawn_areas pushBack (getMarkerPos "mgrif_rs_0");