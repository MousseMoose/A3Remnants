//respawn
mgrif_interface_addRespawnPosition = compileFinal "
													[(_this#0), (_this#1)] remoteExec ['mgrif_fnc_respawn_registerProfileRespawn',2];
													_this call bis_fnc_addRespawnPosition";
mgrif_interface_setUpRespawnObject = compileFinal "_this call mgrif_fnc_respawnObjects_setUpRespawnObject";
mgrif_interface_removeRespawnPosition = compileFinal "
													_index = ((player getVariable 'bis_fnc_getrespawnpositions_list')#1) find (_this#1);
													_respawn = ((player getVariable 'bis_fnc_getrespawnpositions_list')#2) select _index;
													_respawn = call compile _respawn;

													[(_this#0), _respawn] remoteExec ['mgrif_fnc_respawn_deleteProfileRespawn',2];
													_this call bis_fnc_removeRespawnPosition";

mgrif_interface_placeObject = compileFinal "_this call mgrif_fnc_inventory_placeObject";
mgrif_interface_addInteraction = compileFinal "(_this#0) addAction (_this select [1, (count _this) -1])";
mgrif_interface_removeInteraction = compileFinal "(_this#0) removeAction (_this#1)";