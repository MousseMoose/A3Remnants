
//private _unit = _this select 0;

params ["_unit"];

private _count = 0;
private _weapons = [];
private _weaponsitems = weaponsitems _unit;

if(primaryweapon _unit !="") then {
    _count = _count +1;
};

if(secondaryweapon _unit !="") then {
    _count = _count +1;
};

if(handgunweapon _unit !="") then {
    _count = _count +1;
};

for[{_i = 0},{_i < _count},{_i=_i+1}] do {
    //disregard Binocs
    //TODO: make optional
    if(getNumber(configfile >> "cfgWeapons" >> ((_weaponsitems select _i) select 0) >> "type") == 4096) then {
        _weaponsitems deleteAt _i;
    };
    
    _weapons pushBack (_weaponsitems select _i);
};

_weapons