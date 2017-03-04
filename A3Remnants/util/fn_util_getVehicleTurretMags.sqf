// mu_fnc_util_getVehicleTurretMags
// Parameters:
//				_veh: vehicle whose type is to be determined
// Description:	Returns turret magazines with driver magazines at the end

//DEPRECATED: Replaced by
params ["_veh"];
private ["_turrets","_turretMags","_mags","_add","_path","_curMag","_curCount","_driverTur"];
//_veh = _this select 0;
_turrets = [_veh,[]] call BIS_fnc_getTurrets;
_turretMags=[];
{
	//_x refers to current turret path
	//TODO: Include driver turret
	_mags = _veh MagazinesTurret _x;
	_add = [[],[]];
	_path = _x;
	{
		//_x refers to current magazine
		_curMag 	= _x;
		_curCount 	= _veh magazineTurretAmmo [_curMag, _path];
		(_add select 0) pushBack _curMag;
		(_add select 1) pushBack _curCount;
	} forEach _mags;
	_turretMags pushBack _add;
} forEach _turrets;
//account for driver turret
_driverTur = [[],[]];
{
	(_driverTur select 0) pushBack _x;
	(_driverTur select 1) pushBack (_veh magazineTurretAmmo [_x, [-1]]);
} forEach (_veh magazinesTurret [-1]);
_turretMags pushBack _driverTur;
_turretMags