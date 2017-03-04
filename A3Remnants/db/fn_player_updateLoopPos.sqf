// mu_fnc_player_updateLoop
// Parameters: 
//					_unit: player object
// Description:		saves a player's position every 10 seconds


#define MU_UPDATEFREQ 10
_pos = [];
while {true} do
	{
		{
            	_id =  _x getVariable ["mu_playerID",-1];
				_pos = position _x;
                _pos = [_pos,direction _x,animationState _x];
                _par = [_pos, _id];
                if(_id>=0) then {
                    ["updatePlayerPos",_par,true] spawn mu_fnc_db_queryASYNC;
                    //["updateProfile",[getPlayerUID player,_id],true] spawn mu_fnc_db_queryASYNC;	
                }
		} forEach allPlayers;
		sleep MU_UPDATEFREQ;
	};