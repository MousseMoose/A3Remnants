//OLD, NOT NEEDED
// mgrif_fnc_util_checkEmptyString
// Parameters:
//				_strCheck - String that gets compared to an empty string
// Description: Checks if String is empty. If so, it gets replaced with '*', which is needed for database purposes

//_strCheck = _this select 0;
params["strCheck"];
//diag_log format ['_strCheck IS %1', _strCheck];
if(_strCheck == "") then
	{
		_strCheck = "*";
	};

_strCheck