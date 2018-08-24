/*	mgrif_fnc_createPlayer
 *	Parameters:
 *		_dbArr: 
 * Description:
 *
 */
 
 params [
	["_dbArr",[]],
	["_uid",""],
	["_owner",2],
	["_respawn",false],
	["_respawnList",[0,[],[],[],[]]]
 ];
 
 
_pid 		= _dbArr select 0;
_pos 		= _dbArr select 2;
	_dir = _pos#1;
_inventory	= _dbArr select 3;
	_equipAll 		= _inventory select 0;
		_asItms 	=  _equipAll select 0; //tactical swag
		_equip   	= _equipAll select 1; //All of your fancy hats
		_weapons 	= _equipAll select 2; //boom sticks
	_cargo	=  _inventory select 1;

_med 	=  _dbArr select 4;
_skills 	=  _dbArr select 5;

_group =   (createGroup blufor);  	
_unit = _group createUnit ["C_Man_casual_1_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit disableAI "WEAPONAIM";
switch (_pos#2) do {
    case "CROUCH": { _unit setUnitPos "MIDDLE"};
    case "PRONE": { _unit setUnitPos "DOWN"};
    default { _unit setUnitPos "UP" };
};		 
    
 //set Player variable so player can be identified in the database
 _unit setVariable ["mgrif_playerID", _pid,true];
 _unit setVariable ["mgrif_nothit",true];
 
 //set Player position
 _unit setPos (_pos select 0);
 _unit setDir _dir;
 _group setFormDir _dir;
 
 //set medical
{_unit setHitIndex [_forEachIndex,_x]} foreach _med;

//clear inventory
removeAllWeapons		_unit;
removeAllitems 			_unit;
removeAllAssignedItems 	_unit;
removeHeadgear			_unit;
removeGoggles			_unit;
removeUniform			_unit;
removeVest				_unit;
removeBackpack			_unit;

//add Weapons
{
    _weapon = _x select 0;
     _unit addWeaponGlobal _weapon;
    {
     	  
        if ((_forEachIndex!=0) && !(_x isEqualTo "") ) then {
         	_unit addWeaponItem [_weapon,_x];
        };
        
    } foreach _x;
} foreach _weapons;



 




//add Equipment
//diag_log format ["_equip %1",_equip];
	if(_equip select 0 != "") then { _unit addHeadGear 	(_equip select 0); };
    if(_equip select 1 != "") then { _unit addGoggles 	(_equip select 1); };
	if(_equip select 2 != "") then { _unit forceaddUniform	(_equip select 2); };
	if(_equip select 3 != "") then { _unit addVest		(_equip select 3); };
	if(_equip select 4 != "") then { _unit addBackpackGlobal	(_equip select 4); };

//add assigned Items
    
    {if(getNumber(configfile >> "cfgWeapons" >> _x >> "type") == 4096) then {_unit addWeapon _x} else {_unit linkItem _x};} foreach _asItms;
	
//add Cargo	
{
    [_x,_forEachIndex,_cargo] call mgrif_fnc_util_addAllCargo;
} foreach [uniformContainer _unit,vestContainer _unit,backpackContainer _unit];

//Event Handlers

_unit setVariable ["mgrif_notFired",true];
_unit addEventHandler ["Fired",{
    [_this select 0] spawn {
    if((_this select 0) getVariable ["mgrif_notFired",false]) then {
    (_this select 0) setVariable ["mgrif_notFired",false];
    mgrif_var_player_updateQueueINV pushbackunique (_this select 0);
	sleep 3;
    (_this select 0) setVariable ["mgrif_notFired",true];
    }
} }];


/*if(_respawn) then {
	_unit setVariable ["bis_fnc_getrespawnpositions_list",_respawnList,true];
} else {
	_respawns = ["getProfileRespawns",[mgrif_const_worldID,_uid],false] call mgrif_fnc_db_queryASYNC;
	_respawns = _respawns apply {_x#0};
	_respawns = mgrif_var_respawn_objects select {((_x) getVariable ["mgrif_respawn_id",-1]) in _respawns};
	//p3 = _respawns;
	
	{
		[_x,_unit] remoteExec ["mgrif_fnc_respawnObjects_remoteAssignQuarters",_owner];
		//[_unit,_x] call bis_fnc_addRespawnPosition;
	} forEach _respawns;
};*/




_unit addMPEventHandler ["MPHit",{
    [_this select 0] spawn mgrif_mphp;
 }];


_unit addMPEventHandler ["MPKilled",{
	   _this spawn mgrif_mpkp;
}];



_unit


