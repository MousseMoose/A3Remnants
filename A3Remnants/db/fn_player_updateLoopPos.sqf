// mgrif_fnc_player_updateLoop
// Parameters: 
//					_unit: player object
// Description:		saves a player's position every 10 seconds


#define mgrif_UPDATEFREQ 10
_pos = [];
while {true} do
	{
		{
            	_id =  _x getVariable ["mgrif_playerID",-1];
				_pos = position _x;
                _pos = [_pos,direction _x,stance _x];
                _par = [_pos, _id];
                if(_id>=0) then {
                    ["updatePlayerPos",_par,true] spawn mgrif_fnc_db_queryASYNC;
                    //["updateProfile",[getPlayerUID player,_id],true] spawn mgrif_fnc_db_queryASYNC;	
                }
		} forEach allPlayers;
		sleep mgrif_UPDATEFREQ;
	};