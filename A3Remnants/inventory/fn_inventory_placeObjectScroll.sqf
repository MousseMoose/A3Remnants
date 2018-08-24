params [
	["_display",0],
	["_zValue",1]
];

_obj = mgrif_var_inventory_placeObject;
_coEff = 1;
if((_zValue)>0) then { _coEff = -1};
_height = (mgrif_var_inventory_placeObjectOffset#2) - 0.1*_coEff;
mgrif_var_inventory_placeObjectOffset set [2,_height];
detach _obj;
_obj attachTo [mgrif_var_inventory_placeObjectCaller,[0,2,_height]];