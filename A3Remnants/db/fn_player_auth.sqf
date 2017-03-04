// mu_fnc_eh_authPlayer
// Parameters:
//				_this passed by EH (uid and name of player)
// Description: handles player authentication. Updates their profile and then calls character creation


		_uid	= _this select 0;
		_name	= _this select 1;
		_unit	= _this select 2;
        _client = owner _unit;
		_par = [_uid];
		_profile = ["getProfile",_par,false] call mu_fnc_db_queryASYNC;
		
		//check empty
		if ((count _profile) != 0 ) then
			{
				//update profile
				_par = [
							_uid,
							_name
						];
				_profile = ["updateProfile",_par,true] call mu_fnc_db_queryASYNC;
			}
		else
			{
				//register profile
				_par = [
					_uid,
					_name,
					0,
					0,
					0
						];
						
				_profile = ["registerProfile",_par,true] call mu_fnc_db_queryASYNC;
				
			};
			
		_par = [_uid];
		_character = ["getCharacter",_par,false] call mu_fnc_db_queryASYNC;
			
            
            
            
		//checks if player does not have an active player record.
		if((count _character) == 0) then
			{
                 [_uid] call mu_fnc_player_register;
			};
            
//after check, get player data
//TODO: Detach from auth
_par = [_uid];
_character = ["getCharacter",_par,false] call mu_fnc_db_queryASYNC;
diag_log format["retrieved character array: %1",_character];
_character = _character select 0;

//create new character
//TODO: correct current weapon
_unit = (createGroup blufor) createUnit ["C_Man_casual_1_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit disableAI "ANIM";
_unit playMoveNow ((_character select 2) select 2);
[_unit,_character] call mu_fnc_player_create;


_checkpos = (_character select 2) select 0;

//check Position
waitUntil {
    	sleep 1;
        (_checkpos distance (position _unit))<25
};
if(!isNil "mu_var_db_sleeptime") then { sleep mu_var_db_sleeptime;} else {sleep 1;};

//give client ownership and remoteexec final setup
(group _unit) setGroupOwner _client;
//TODO: replace with better system
[_unit] remoteExec ["mu_fnc_client_dbInventoryEventhandlers", _client, false];