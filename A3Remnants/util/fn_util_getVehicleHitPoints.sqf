// mu_fnc_util_getVehicleHitPoints
// Parameters:
//				_veh: vehicle whose type is to be determined
//				_config: current config path, used for recursive call to determine turret hitpoints
// Description:	Function used to determine the current damage of a vehicle's hitpoints.
//[hitpoints, [turrets]] -> turret: [TurretHitpoints, turrets]
private ["_veh", "_config","_hitPoints","_configHit","_turrets","_configTur"];
_veh = _this select 0;
_config = _this select 1;
_space = _this select 2; //use space saving option?
_hitPoints = [];
_configHit = _config >> "HitPoints";
for [{_i = 0},{_i<(count _configHit)},{_i=_i+1}] do {
		_hitPoints set [count _hitPoints, _veh getHit (getText ((_configHit select _i) >> "name"))];
	};
_turrets = [];
_configTur = _config >> "Turrets";
for [{_i = 0},{_i<(count _configTur)},{_i=_i+1}] do {
		{_hitPoints set [count _hitPoints, _x] } forEach ([_veh, _configTur select _i] call mu_fnc_util_getVehicleHitPoints);
	};
_hitPoints



