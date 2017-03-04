// mu_fnc_registerVeh
// Parameters:
//					_veh: vehicle to register.
// description:		registers a vehicle in the database

//TODO: BIS_fnc_param
_veh = _this select 0;


_type = typeOf _veh;
_pos = [position _veh, (direction _veh)];
_hit = (getAllHitPointsDamage _veh) select 2;
_fuel = fuel _veh;
_turrets = [_veh,[]] call BIS_fnc_getTurrets;
_turretMags= [_veh] call mu_fnc_util_getVehicleTurretMags;
_turretWeps= [_veh] call mu_fnc_util_getVehicleTurretWeps;
_cargo = [_veh] call mu_fnc_util_getAllCargoEB;
//_cargo pushback ([_x select 1] call mu_fnc_util_getAllCargo)} foreach (everyContainer_veh);
_cargoMisc=[]; // extra field for custom cargo
_vehLock=0; //either unlocked (0) or x-digit keyCode (subject to change)
_textures=[];
	_cusTex = _veh getVariable ["mu_cusTex",false]; 		//Specifies wether vehicle has textures defined in missionConfigFile
	_default = [];
	{_default pushBack ""} forEach getArray (configFile >> "cfgVehicles" >> (typeOf _veh) >> "hiddenSelections");
	_hiddenSelections = _veh getVariable ["mu_cusTexHS",_default];//Either array of numbers or paths, to allow for pre-defined paint-jobs (e.g. represented by integer to save space) or custom path.
_textures = [_cusTex,_hiddenSelections];
_components=[];
_garage=0;


_par = 	[	
			_type,
			mu_const_worldID,
			_pos,
			_hit,
			_fuel,
			_turretMags,
			_turretWeps,
			_cargo,
			_cargoMisc,
			_vehLock,
			_textures,
			_components,
			_garage
		];

_create = ["registerVehicle",_par,true] call mu_fnc_db_queryASYNC;
//TODO: add to queues, add eventHandlers

//["mu_fnc_srv_debugMYSQL","Query: Vehicle created",_create] call mu_fnc_srv_debugMYSQL;

