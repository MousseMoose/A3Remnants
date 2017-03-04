waitUntil{diag_log format["Waiting to init player %1",_this select 0];sleep 1;!isNil "mu_var_server_initDone"};

_unit = (_this select 0);
diag_log format ["Auth Player initPlayerServer %1 %2 %3",getPlayerUID _unit, name _unit, _unit];
[getPlayerUID _unit ,name _unit, _unit] call mu_fnc_player_auth;





_unit addMPEventHandler ["MPHit",{
    [_this select 0] spawn mu_mphp;
 }];


_unit addMPEventHandler ["MPKilled",{
	   _this spawn mu_mpkp;
}];
