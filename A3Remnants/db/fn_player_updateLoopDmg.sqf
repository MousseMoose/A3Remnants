// mu_fnc_player_updateLoopInv
// Parameters:
// Description:
// Run on: Server

#define TIMEWAIT 10

while {true} do {
	{
		if( !isNull(_x)) then { // in case player is in queue, but already disconnected
			["updatePlayerMed",[(getAllHitPointsDamage _x) select 2,_x getVariable ["mu_playerID",-1]],true] spawn mu_fnc_db_queryASYNC;
		};
	}	forEach mu_var_player_updateQueueDMG;
	mu_var_player_updateQueueDMG = [];
	uiSleep TIMEWAIT;
};


/* Naive implementation
while {true} do {
    
    {
	    _id = _x getVariable ["mu_playerID",-1];
	    if(_id >-1) then {
	      _inv = [_x] call mu_fnc_player_getInventory;
			["updatePlayerInv",[_inv,_id],true] spawn mu_fnac_db_queryASYNC;
     
    }
    
    } forEach allPlayers;
    uiSleep TIMEWAIT;
};
*/