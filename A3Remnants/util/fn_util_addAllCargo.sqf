/*private _container = _this select 0;
private _containerIndex = _this select 1;
private  _cargo = _this select 2;*/
params ["_container","_containerIndex","_cargo"];
{
    _container addItemCargoGlobal [_x, (((_cargo select _containerIndex) select 2) select 1) select _forEachIndex];
} forEach (((_cargo select _containerIndex) select 2) select 0);

{
    _container addMagazineAmmoCargo  [_x select 0,1, _x select 1];
	//diag_log ("adding " + str _x + " to container " + str _container + " " + typeOf _container);
	//p3 = _container;
} forEach ((_cargo select _containerIndex) select 1);

    	
{
    _container addWeaponCargoGlobal [(_x select 0),1];
    {
        if(_forEachIndex!=0) then {
           if(typename _x == "String") then {
	            _container addItemCargoGlobal [_x,1];
	        } else {
                if(count _x >0) then {
                    _container addMagazineAmmoCargo [_x select 0,1,_x select 1];
                };
	           
	        };
        };
        
    } foreach _x;
} foreach ((_cargo select _containerIndex) select 0);

{
   _container addBackPackCargoGlobal [_x, (((_cargo select _containerIndex) select 3) select 1) select _forEachIndex];
} forEach (((_cargo select _containerIndex) select 3) select 0);