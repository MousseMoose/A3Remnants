// spawn Vehicle - World
// Parameters:  	
//					_dbArr	- 	passed Array from Database
//Access saved in different table
//Vehicle as Array [vehicleId, vehicleType, postitionArray, HitpointArray, TurretMagazines, [WeaponCargo, MagazineCargo, ItemCargo, BackpackCargo]]
//WorldID does not get supplied by DB

//initialise Variables
//TODO: Private[];
_dbArr 	=	_this;
//diag_log format ["spawnVehicle dbarr %1",_dbArr];

_vehicleID 		= _dbArr select 0; //vehicle ID
_type			= _dbArr select 1; //vehicle class Name
_pos			= _dbArr select 2; //position
_damage			= _dbArr select 3; //damage gets passed as an array WITH NO SUBARRAYS, i. e. no seperation between turrets. Example: [0,0,0,0,0,0,0]
_fuel			= _dbArr select 4; //fuel
_mags			= _dbArr select 5; //Magazines as array, with sub arrays for each turret. Driver Turret at the end.
_weps			= _dbArr select 6; //Same for weapons.
_cargoWMIB		= _dbArr select 7; //Weapon, Magazines, Items and Backpacks cargo
_cargoMisc		= _dbArr select 8; //unused for now
_lock			= _dbArr select 9; //locked status
_tex			= _dbArr select 10; //custom textures
_comp			= _dbArr select 11; //component info. e. g. removed benches on little bird

//seperate direction from position
_dir = _pos select 1;
_pos = _pos select 0;
if((_pos select 2)>10) then {
	_pos set [2,0]; 				//ground vehicle in case of in-flight disconnect.
	};
//spawn vehicle
_veh	=	_type createVehicle _pos;
//diag_log format["PRE: type _veh:%1",typeName _veh];
_veh setVariable ["mu_vehicleId", _vehicleID];
_veh setDir _dir;
_veh setFuel _fuel;


//define recursive function to apply hitpoint damage based on passed array
/* DEPRECATED, pre 1.50 method
_applyDmg = {
	private ["_dmgVeh","_damageIndex","_curConfig","_damagePassed","_i","_curHitPoints","_curTurrets"];
	_dmgVeh = _this select 0;
	_damageIndex = _this select 1;
	_curConfig = (_this select 2) ; //current turret (starts with driver turret) config
	_damagePassed = _this select 3;
	_curHitPoints = _curConfig >> "hitPoints"; //current turret hitpoints 
	
	for [{_i = 0},{_i < (count _curHitPoints)},{_i=_i+1}] do {
		_dmgVeh setHit [getText((_curHitPoints select _i) >> "name"), _damagePassed select _damageIndex];
		_damageIndex = _damageIndex + 1;
	};
	_curTurrets = _curConfig >> "turrets"; //current turret's turrets (yo dawg)
	if( (count (_curConfig >> "turrets"))>0) then {
		for[{_i = 0},{_i < (count _curTurrets)},{_i=_i+1}] do {
			//recursion. Finishes when no more turrets left
			_damageIndex = [_dmgVeh, _damageIndex, _curTurrets select _i, _damagePassed] call _applyDmg; //TODO: MAKE INTO GLOBAL FUNCTION IN UTIL/COMMON
		};
	};
	_damageIndex;
};
//start recursion
[_veh, 0, (configFile >> "cfgVehicles" >> _type), _damage] call _applyDmg;
*/
{_veh setHitIndex [_forEachIndex,_x]} foreach _damage;


_turrets = [_veh, []] call bis_fnc_getTurrets;


//recursive function to add weapons and ammo to turrets
_armTurrets = {
		private ["_i","_veh","_mags","_weps","_curConf","_curIndex","_curMags","_curWeps","_curConfMag","_curConfWep","_curTurrets","_turret"];
		_veh = _this select 0;
		_mags = _this select 1;
		_weps = _this select 2;
		_curConf= _this select 3;
		_curIndex = _this select 4;
		
		//determine wether turret is driver turret. Has to be determined because driver turret isn't included in BIS_fnc_getTurrets.
       	if(_curIndex!=0) then {
			_curMags = _mags select (_curIndex-1);
			_curWeps = _weps select (_curIndex-1);
			_turret = ([_veh, []] call bis_fnc_getTurrets) select (_curIndex-1); //select current turret based on current index
		} else {
			_curMags = _mags select (count _mags-1);
			_curWeps = _weps select (count _mags-1);
			_turret = [-1];
		};
		_curConfMag = _curConf >> "magazines"; //current turret's weapons
		_curConfWep = _curConf >> "weapons"; // ...mags
		_curTurrets = _curConf >> "turrets"; // turret's turrets (yo dawg);

		//clear weapons and magazines from turret
		{_veh  removeWeaponTurret [_x, _turret];} forEach (getArray _curConfWep);
		{_veh  removeMagazinesTurret [_x, _turret]} forEach (getArray _curConfMag);
		
		for [{_i = 0},{_i < (count (_curMags select 0))},{_i=_i+1}] do {
			//if((count (_curMags select 0))>0) then {
				_veh addMagazineTurret [(_curMags select 0) select _i, _turret];
				_veh setMagazineTurretAmmo [(_curMags select 0) select _i, (_curMags select 1) select _i,_turret];
			//};
		};
		
		for [{_i = 0},{_i < (count _curWeps)},{_i=_i+1}] do {
			if((count (_curWeps select 0))>0) then {
				_veh addWeaponTurret [(_curWeps select _i), _turret];
			};
		};
		
		for [{_i = 0},{_i < (count _curTurrets)},{_i=_i+1}] do {
			_curIndex = _curIndex+1;
			[_veh,_mags, _weps, _curTurrets select _i, _curIndex] call _armTurrets;
		};
		
	};
[_veh, _mags, _weps, (configFile >> "cfgVehicles" >> _type),0] call _armTurrets;


//remove preset equipment from cargo
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
	
//add Cargo (Weapons, Magazines, Backpacks)
/*
for [{_i=0},{_i < count ((_cargoWMIB select 0) select 0)},{_i=_i+1}] do
	{
								//	  All cargo ->  WeaponCargo -> class name  |  All cargo -> WeaponCargo -> weapon count
		_veh addWeaponCargoGlobal [(((_cargoWMIB select 0) select 0) select _i),(((_cargoWMIB select 0) select 1) select _i)]; //TODO: handle weapon attachments somehow
	};
	
for [{_i=0},{_i < count ((_cargoWMIB select 1) select 0)},{_i=_i+1}] do
	{
		_veh addMagazineCargoGlobal [(((_cargoWMIB select 1) select 0) select _i),(((_cargoWMIB select 1) select 1) select _i)]; //TODO: handle magazine ammo counts with magazinesAmmoCargo
	};
	
for [{_i=0},{_i < count ((_cargoWMIB select 2) select 0)},{_i=_i+1}] do
	{
		_veh addItemCargoGlobal [(((_cargoWMIB select 2) select 0) select _i),(((_cargoWMIB select 2) select 1) select _i)];
	};
	
for [{_i=0},{_i < count ((_cargoWMIB select 3) select 0)},{_i=_i+1}] do
	{
		_veh addBackPackCargoGlobal [(((_cargoWMIB select 3) select 0) select _i),(((_cargoWMIB select 3) select 1) select _i)]; //TODO: handle backpack contents with everyBackpack
	};	
*/

[_veh,0,_cargoWMIB] call mu_fnc_util_addAllCargo;
_cargoWMIB deleteAt 0;
{[_x select 1,_forEachIndex,_cargoWMIB] call mu_fnc_util_addAllCargo;} foreach (everyContainer _veh);


//insert object reference
_tex pushBack _veh;
_tex call mu_fnc_util_applyTextures;



//set up position and damage save loop
_queuePos = mu_var_veh_updateQueuePOS pushBack [_veh,false];
_veh setVariable ["mu_queuePos", _queuePos];
_veh setVariable ["mu_vehSaveState",[0,0,0]];

//Engine: if engine is started/turned off, switch save state accordingly (vehicle, CASE_ENGINE, 0 or 1 depending on engine state)
//TODO: Consider Edge case: Vehicle rolling but engine off
//Note: isEngineOn is used as remote firing of the EH returns the OPPOSITE value for some reason
_veh addEventHandler ["Engine",{_value = 0;if(isEngineOn (_this select 0)) then {_value = 1} else {_value = 0};[_this select 0,0,_value] spawn mu_fnc_veh_switchSaveStatePos;}];
//Ropes: If attached vehicles has saveState (can be saved in DB), switch save state (vehicle, CASE_ROPE, 1)
_veh addEventHandler ["ropeAttach",{if((_this select 2) getVariable ["mu_saveStatePos",-1]>-1) then {[_this select 2,1,1] call mu_fnc_veh_switchSaveStatePos}}];
_veh addEventHandler ["ropeBreak",{if((_this select 2) getVariable ["mu_saveStatePos",-1]>-1) then{[_this select 2,1,0] call mu_fnc_veh_switchSaveStatePos}}];


_veh setVariable ["mu_nothit",true,true];
_veh addMPEventHandler ["MPHit",{ 
       _this spawn mu_mphv;
 }];


_veh addMPEventHandler ["MPKilled",{
    	_this spawn mu_mpkv;
}];

_veh setVariable ["mu_notFired",true,true];
_veh addEventHandler ["Fired",{
    [_this select 0] spawn {
    if((_this select 0) getVariable ["mu_notFired",false]) then {
    (_this select 0) setVariable ["mu_notFired",false,true];
    mu_var_veh_updateQueueMAG pushbackunique (_this select 0);
	sleep 3;
    (_this select 0) setVariable ["mu_notFired",true,true];
    }
} }];

//_veh addEventHandler ["killed",{[((_this select 0) getVariable "mu_vehicleID")] call mu_fnc_veh_destroyed}]; //destroyed

