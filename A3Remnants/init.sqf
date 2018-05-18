if(hasInterface) then {
    waitUntil {!isNull(player)};
    waitUntil {!isNil "mu_var_server_initDone"};
    waitUntil {mu_var_server_initDone};
    [] execVM "util\initUtil.sqf";
    [] execVM "client\initClient.sqf";
    
}
