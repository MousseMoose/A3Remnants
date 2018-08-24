#define MGRIF_CONFIGROOT missionConfigFile

params [
	["_class",""],
	["_container",objNull]
];
_action = _class + "_action";
_config = MGRIF_CONFIGROOT >> "cfgMgrifInventoryActions" >> _action;

if (isClass _config) then {
	[_class,_action,_container] call call compile getText (_config >> "function");
};
