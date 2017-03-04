// mu_fnc_util_getVehicleTurretWeps
// Parameters:
//				_veh: vehicle whose type is to be determined
// Description:	Returns turret weapons with driver weapons at the end
private ["_veh","_turrets","_turretWeps","_weps","_driverTur"];
_veh = _this select 0;
_turrets = [_veh,[]] call BIS_fnc_getTurrets;
_turretWeps=[];
{
	//_x refers to current turret path
	//TODO: Include driver turret
	_turretWeps pushBack (_veh WeaponsTurret _x);
} forEach _turrets;
//account for driver turret
_driverTur = [];
{
	_driverTur  pushBack _x;
} forEach (_veh weaponsTurret [-1]);
_turretWeps pushBack _driverTur;
_turretWeps