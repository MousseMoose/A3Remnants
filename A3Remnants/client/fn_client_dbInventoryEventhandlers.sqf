// mgrif_fnc_
// Parameters:
//				_
// Description:

_newUnit = _this select 0;
_oldUnit = player;
_oldGroup = group player;
selectPlayer _newUnit;
deleteVehicle _oldUnit;
deleteGroup _oldGroup;


//TODO: handleHeal with waituntil animationstate
player addEventhandler ["HandleHeal",{
    _this spawn {
    		uisleep 5;
    		_this remoteExec ['mgrif_fnc_db_remoteHandleHeal',2,false];
            false
            };
}];

player addEventhandler ["put",{
    		_this call mgrif_fnc_client_ehPutTake;
}];
player addEventhandler ["take",{
    		_this call mgrif_fnc_client_ehPutTake;
}];
player addEventHandler ["Respawn", {cutText ["Respawning","BLACK FADED"];
}];
cutText ["","BLACK IN"];
