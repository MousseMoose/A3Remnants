// mgrif_fnc_eh_authPlayer
// Parameters:
//				_this passed by EH (uid and name of player)
// Description: handles player authentication. Updates their profile and then calls character creation

params [
	["_uid",""],
	["_name",""],
	["_owner",0]
];


_par = [_uid];
_profile = ["getProfile",_par,false] call mgrif_fnc_db_queryASYNC;

//check empty
if ((count _profile) != 0 ) then
	{
		//update profile
		_par = [
					_uid,
					_name
				];
		_profile = ["updateProfile",_par,true] call mgrif_fnc_db_queryASYNC;
	}
else
	{
		//register profile
		_par = [
			_uid,
			_name,
			0,
			0,
			0
				];
				
		_profile = ["registerProfile",_par,true] call mgrif_fnc_db_queryASYNC;
		
	};