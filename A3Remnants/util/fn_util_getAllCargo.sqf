params ["_container" ]; //_container = _this select 0;
private "_cargo";

if(isNull _container) exitWith {
     [[],[],[[],[]],[[],[]]]
    
};
_cargo = [
			weaponsItemsCargo 	_container,
			magazinesAmmoCargo 	_container,
			getItemCargo		_container,
            getBackPackCargo _container
		];
_cargo