params [
	["_uid",""],
	["_owner",0]
];

_par = [_uid];
_character = ["getCharacter",_par,false] call mgrif_fnc_db_queryASYNC;
	
	
	
	
//checks wether player does not have an active player record.
if((count _character) == 0) then
	{
		 [_uid] call mgrif_fnc_player_register;
		 sleep 2;
		 _par = [_uid];
		_character = ["getCharacter",_par,false] call mgrif_fnc_db_queryASYNC;
	};       


diag_log format["retrieved character array: %1",_character];
_character = _character select 0;

//create new character
//TODO: correct current weapon


_unit = [_character,_uid] call mgrif_fnc_player_create;


_checkpos = (_character select 2) select 0;

//check Position
waitUntil {
    	sleep 1;
        (_checkpos distance (position _unit))<25
};
if(!isNil "mgrif_var_db_sleeptime") then { sleep mgrif_var_db_sleeptime;} else {sleep 1;};

//give client ownership and remoteexec final setup
(group _unit) setGroupOwner _owner;
//TODO: replace with better system
[_unit] remoteExec ["mgrif_fnc_client_dbInventoryEventhandlers", _owner, false];