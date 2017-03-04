//_container = _this select 0;
params ["_container"];
private _cargo;

_cargo = [[_container] call mu_fnc_util_getAllCargo];
{ _cargo pushback ([_x select 1] call mu_fnc_util_getAllCargo)} foreach (everyContainer _container);
_cargo