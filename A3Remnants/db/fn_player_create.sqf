/*	mu_fnc_createPlayer
 *	Parameters:
 *		_dbArr: 
 * Description:
 *
 */
 
 _unit = _this select 0;
 _dbArr = _this select 1;
 
	_pid 		= _dbArr select 0;
	_pos 		= _dbArr select 2;
    _inventory	= _dbArr select 3;
		_equipAll 		= _inventory select 0;
    		_asItms 	=  _equipAll select 0; //tactical swag
            _equip   	= _equipAll select 1; //All of your fancy hats
            _weapons 	= _equipAll select 2; //boom sticks
		_cargo	=  _inventory select 1;
    
    _med 	=  _dbArr select 4;
	_skills 	=  _dbArr select 5;
    	
        
    
 //set Player variable so player can be identified in the database
 _unit setVariable ["mu_playerID", _pid,true];
 _unit setVariable ["mu_nothit",true];
 
 //set Player position
 _unit setPos (_pos select 0);
 _unit setDir (_pos select 1);
 
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
    [_x,_forEachIndex,_cargo] call mu_fnc_util_addAllCargo;
} foreach [uniformContainer _unit,vestContainer _unit,backpackContainer _unit];

//Event Handlers

_unit setVariable ["mu_notFired",true];
_unit addEventHandler ["Fired",{
    [_this select 0] spawn {
    if((_this select 0) getVariable ["mu_notFired",false]) then {
    (_this select 0) setVariable ["mu_notFired",false];
    mu_var_player_updateQueueINV pushbackunique (_this select 0);
	sleep 3;
    (_this select 0) setVariable ["mu_notFired",true];
    }
} }];




//_unit setVariable ["mu_charReady",true];
//true


