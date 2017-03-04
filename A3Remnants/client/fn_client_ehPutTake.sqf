// mu_fnc_
// Parameters:
//				_
// Description:

[_this  select 0,(_this select 0) getVariable ["mu_playerID",-1],0] remoteExec ["mu_fnc_db_remoteTakePut", 2, false];
_target =_this select 1;
if(_target isKindOf "Bag_Base") then {
    _target = objectParent _target;
    if(_target isKindOf "Man") then  {
         [_target,_target getVariable ["mu_playerID",-1],0] remoteExec ["mu_fnc_db_remoteTakePut", 2, false];
    };
} else {
   [_target,_target getVariable ["mu_playerID",-1],1] remoteExec ["mu_fnc_db_remoteTakePut", 2, false]; 
};