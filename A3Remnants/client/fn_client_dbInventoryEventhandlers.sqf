// mu_fnc_
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
    		sleep 5;
    		_this remoteExec ['mu_fnc_db_remoteHandleHeal',2,false];
            false
            };
}];

player addEventhandler ["put",{
    		_this call mu_fnc_client_ehPutTake;
}];
player addEventhandler ["take",{
    		_this call mu_fnc_client_ehPutTake;
}];

