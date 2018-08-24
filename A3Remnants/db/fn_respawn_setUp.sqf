// mgrif_fnc_veh_setUp
// Parameters:
//					none
// Description:		loads vehicles from the database and spawns them.



_respawns = ["getWorldRespawns",[mgrif_const_worldID],false] call mgrif_fnc_db_queryASYNC;
{
	_uids = ["getRespawnProfiles",[mgrif_const_worldID,(_x#0)],false] call mgrif_fnc_db_queryASYNC;
	_uids = _uids apply {_x#0};
	_respawn = createVehicle [_x#2,((_x#3)#0),[],0,"CAN_COLLIDE"];
	_respawn setDir ((_x#3)#1);
	_respawn setVariable ["mgrif_respawn_id",(_x#0)];
	mgrif_var_respawn_objects pushBack _respawn;
	[_respawn,_x#6,_uids,_x#0] call mgrif_interface_setUpRespawnObject;
} forEach _respawns;
