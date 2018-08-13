// mgrif_fnc_
// Parameters:
//				_
// Description:
#define CASE_ENGINE 0 	// Engine EH fired
#define CASE_ROPE 1	  	// One of the Rope EHs fired

#define STATE_NOSAVE		0 //Engine is off and no Ropes attached
#define STATE_ENGINE		1 //Only Engine is on
#define STATE_ROPE			2 //Only Rope is attached
#define STATE_ENGINEROPE	3 //Ropes attached and Engine is on


//Set up variables
mgrif_var_veh_updateQueuePOS = [];
mgrif_var_veh_updateQueueDMG = [];
mgrif_var_veh_updateQueueMAG = [];
mgrif_var_veh_updateQueueCARGO = [];
//mgrif_var_veh_updateQueueCARGO = [[],[]];

mgrif_var_respawn_areas = [];


mgrif_var_player_updateQueueDMG = [];
mgrif_var_player_updateQueuePOS = [];
mgrif_var_player_updateQueueINV = [];
////mgrif_var_player_updateQueueINV = [[],[]];


[] spawn mgrif_fnc_player_updateLoopPos;
[] spawn mgrif_fnc_player_updateLoopInv;
[] spawn mgrif_fnc_player_updateLoopDMG;

//[] spawn {BlaBlaDebug = true;while {BlaBlaDebug} do {diag_log ("isNil? " + str isNil "mgrif_var_veh_updateQueueCARGO"); sleep 1; }};

[] spawn mgrif_fnc_veh_updateLoopPos;
[] spawn mgrif_fnc_veh_updateLoopDMG;
[] spawn mgrif_fnc_veh_updateLoopMag;
[] spawn mgrif_fnc_veh_updateLoopCargo;

//MPHit and MPKilled Handler functions for players and vehicles
mgrif_mphp =  compilefinal "if((_this select 0) getVariable ['mgrif_nothit',false]) then {
		    (_this select 0) setVariable ['mgrif_nothit',false];
		    mgrif_var_player_updateQueueDMG pushbackunique (_this select 0);
			sleep 3;
		    (_this select 0) setVariable ['mgrif_nothit',true];
		}  ";
mgrif_mpkp =  compilefinal "
								['playerKilled',[(_this select 0) getVariable ['mgrif_playerID',-1]],true] call mgrif_fnc_db_queryASYNC;
								_respawnPoints = [];
								{_respawnPoint = ([_x, 0, 150, 5, 0, 10, 0] call bis_fnc_findSafePos); _respawnPoint pushBack 0; _respawnPoints pushBack _respawnPoint} forEach mgrif_var_respawn_areas;
								{[_this#0, _x] call bis_fnc_addRespawnPosition} forEach _respawnPoints;
							";

mgrif_mphv = compilefinal "if((_this select 0) getVariable ['mgrif_nothit',true]) then {
	    (_this select 0) setVariable ['mgrif_nothit',false,true];
	    mgrif_var_veh_updateQueueDMG pushbackunique (_this select 0);
		sleep 3;
	    (_this select 0) setVariable ['mgrif_nothit',true,true];
	    } ";
mgrif_mpkv = compilefinal "['vehDestroyed',[(_this select 0) getVariable ['mgrif_vehicleID',-1]],true] call mgrif_fnc_db_queryASYNC;
    		(mgrif_var_veh_updateQueuePOS select ((_this select 0) getVariable 'mgrif_queuePos')) set [1,false];";

//set up eventHandlers
//Make sure disconnected players' inventories get updated to prevent duping
addMissionEventhandler["HandleDisconnect",{
        _unit  = _this select 0;
        _id = _unit getVariable ["mgrif_playerID",-1];
        if(_id>0) then {
            ["updatePlayerInv",[[_unit] call mgrif_fnc_player_getInventory,_id],true] spawn mgrif_fnc_db_queryASYNC;
            ["updatePlayerPos",[[position _unit,direction _unit,animationState _unit],_id],true] spawn mgrif_fnc_db_queryASYNC;
        };
        deleteVehicle (_unit);
		true
}];


addMissionEventhandler["EntityRespawned",{
    _this spawn {
        _unit = _this select 0;
		_uid = getPlayerUID _unit;
		_return = [_uid,position _unit] call mgrif_fnc_player_register;
		[_uid, owner _unit] call mgrif_fnc_player_authCharacter;
		
		
        //[_uid] call mgrif_fnc_player_register;
	    //_character = ["getCharacter",[_uid],false] call mgrif_fnc_db_queryASYNC;
		//_character = _character select 0;
		//[_this select 0,_character] call mgrif_fnc_player_create;
    };
}];




