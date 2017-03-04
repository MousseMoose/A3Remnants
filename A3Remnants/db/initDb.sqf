// mu_fnc_
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
mu_var_veh_updateQueuePOS = [];
mu_var_veh_updateQueueDMG = [];
mu_var_veh_updateQueueMAG = [];
mu_var_veh_updateQueueCARGO = [];
//mu_var_veh_updateQueueCARGO = [[],[]];


mu_var_player_updateQueueDMG = [];
mu_var_player_updateQueuePOS = [];
mu_var_player_updateQueueINV = [];
////mu_var_player_updateQueueINV = [[],[]];


[] spawn mu_fnc_player_updateLoopPos;
[] spawn mu_fnc_player_updateLoopInv;
[] spawn mu_fnc_player_updateLoopDMG;

[] spawn mu_fnc_veh_updateLoopPos;
[] spawn mu_fnc_veh_updateLoopDMG;
[] spawn mu_fnc_veh_updateLoopMag;
[] spawn mu_fnc_veh_updateLoopCargo;

//MPHit and MPKilled Handler functions for players and vehicles
mu_mphp =  compilefinal "if((_this select 0) getVariable ['mu_nothit',false]) then {
		    (_this select 0) setVariable ['mu_nothit',false];
		    mu_var_player_updateQueueDMG pushbackunique (_this select 0);
			sleep 3;
		    (_this select 0) setVariable ['mu_nothit',true];
		}  ";
mu_mpkp =  compilefinal "['playerKilled',[(_this select 0) getVariable ['mu_playerID',-1]],true] call mu_fnc_db_queryASYNC;";

mu_mphv = compilefinal "if((_this select 0) getVariable ['mu_nothit',true]) then {
	    (_this select 0) setVariable ['mu_nothit',false,true];
	    mu_var_veh_updateQueueDMG pushbackunique (_this select 0);
		sleep 3;
	    (_this select 0) setVariable ['mu_nothit',true,true];
	    } ";
mu_mpkv = compilefinal "['vehDestroyed',[(_this select 0) getVariable ['mu_vehicleID',-1]],true] call mu_fnc_db_queryASYNC;
    		(mu_var_veh_updateQueuePOS select ((_this select 0) getVariable 'mu_queuePos')) set [1,false];";

//set up eventHandlers
//Make sure disconnected players' inventories get updated to prevent duping
addMissionEventhandler["HandleDisconnect",{
        _unit  = _this select 0;
        _id = _unit getVariable ["mu_playerID",-1];
        if(_id>0) then {
            ["updatePlayerInv",[[_unit] call mu_fnc_player_getInventory,_id],true] spawn mu_fnc_db_queryASYNC;
            ["updatePlayerPos",[[position _unit,direction _unit,animationState _unit],_id],true] spawn mu_fnc_db_queryASYNC;
        };
        deleteVehicle (_unit);
		true
}];


addMissionEventhandler["EntityRespawned",{
    _this spawn {
        _unit = _this select 0;
        [getPlayerUID _unit ,name _unit, _unit] call mu_fnc_player_auth;
        //[_uid] call mu_fnc_player_register;
	    //_character = ["getCharacter",[_uid],false] call mu_fnc_db_queryASYNC;
		//_character = _character select 0;
		//[_this select 0,_character] call mu_fnc_player_create;
    };
}];




