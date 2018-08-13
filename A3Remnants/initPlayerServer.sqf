waitUntil{diag_log format["Waiting to init player %1",_this select 0];sleep 1;!isNil "mgrif_var_server_initDone"};

_unit = (_this select 0);
diag_log format ["Auth Player initPlayerServer %1 %2 %3",getPlayerUID _unit, name _unit, owner _unit];
_uid = getPlayerUID _unit;
_owner = owner _unit;
[_uid ,name _unit, _owner] call mgrif_fnc_player_authProfile;
[_uid, _owner] call mgrif_fnc_player_authCharacter;





