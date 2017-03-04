if(isServer) then {
    mu_var_server_initDone = false;
    //initialise modules
	[] execVM "util\initUtil.sqf";
	[] execVM "db\initDB.sqf";
	waitUntil {!isNil "mu_fnc_veh_switchSaveStatePos"};
	
	mu_const_worldID=1; //Stratis
	
	if(uiNameSpace getVariable ["mu_db_stuff",true]) then {
		"extDB3" callExtension "9:ADD_DATABASE:arma";
		"extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:arma:SQL_CUSTOM:SQL:projectMu.ini";
		test1 = "extDB3" callExtension format ["0:SQL:getWorldVehicles:%1",mu_const_worldID];
		uiNameSpace setVariable ["mu_db_stuff",false];
		}else{
			test1 = "extDB3" callExtension format ["0:SQL:getWorldVehicles:%1",mu_const_worldID];
		};
	test1 = call compile test1;
    
    
    
    mu_var_server_initDone = true;
    publicVariable "mu_var_server_initDone";
    [] spawn mu_fnc_veh_setUp;
};