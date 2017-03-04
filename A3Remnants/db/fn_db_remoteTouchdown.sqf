// mu_fnc_
// Parameters:
//				_
// Description: Handles wether to update vehicle or player update queue

private ["_veh"];
_veh = _this select 0;
while{((position _veh) select 2)>7} do {
    diag_log format["Waiting for vehicle %1 to touch down",_veh];
    sleep 5;
};
diag_log format["Vehicle %1 touched down, switching savestate",_veh];
[_veh,2,0] call mu_fnc_veh_switchSaveStatePos;