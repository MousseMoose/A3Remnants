params [
	["_uid",""],
	["_name",""],
	["_owner",-1]
];

waitUntil{diag_log format["Waiting to init player %1",_name];sleep 1;!isNil "mgrif_var_server_initDone"};

diag_log format ["Auth Player initPlayerServer %1 %2 %3", _uid, _name, _owner];
[_uid ,_name, _owner] call mgrif_fnc_player_authProfile;
[_uid, _owner] call mgrif_fnc_player_authCharacter;

