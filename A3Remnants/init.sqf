if(hasInterface) then {
    waitUntil {!isNull(player)};
    waitUntil {!isNil "mgrif_var_server_initDone"};
    waitUntil {mgrif_var_server_initDone};
    [] execVM "util\initUtil.sqf";
    [] execVM "client\initClient.sqf";
    
}
