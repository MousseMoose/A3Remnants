// mgrif_fnc_
// Parameters:
//				_
// Description:

[_this#0,0] remoteExec ["mgrif_fnc_db_remoteTakePut", 2, false];
_target =_this#1;
if(_target isKindOf "Bag_Base") then {
    _target = objectParent _target;
    if(_target isKindOf "Man") then  {
         [_target,0] remoteExec ["mgrif_fnc_db_remoteTakePut", 2, false];
    };
} else {
   [_target,1] remoteExec ["mgrif_fnc_db_remoteTakePut", 2, false]; 
};