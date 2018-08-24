waitUntil {!isNull(player)};
waitUntil {!isNil "mgrif_var_server_initDone"};
waitUntil {mgrif_var_server_initDone};
[] execVM "util\initUtil.sqf";
[] execVM "client\initClient.sqf";
[] execVM "inventory\initInventory.sqf";
[] execVM "interfaces\initInterfaces.sqf";


[] spawn {waitUntil {!isNull (findDisplay 46)}; cutText["Spawning","BLACK FADED"];};

[true,"arsenalClosed",{[player,player,""] call mgrif_fnc_client_ehPutTake;}] call bis_fnc_addScriptedEventHandler;

waitUntil{!isNull player && !isNil "mgrif_var_server_initDone"};
[getPlayerUID player, name player,clientOwner] remoteExec ["mgrif_fnc_db_remoteInitPlayerServer", 2, false];