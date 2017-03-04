_veh = _this select 0;
_varName = _this select 1;
_queue = _this select 2;

if(_veh getVariable [_varName,false]) then {
    _veh setVariable [_varName,false,true];
    _queue pushbackunique _veh;
	sleep 3;
    _veh setVariable [_varName,true,true];
    }