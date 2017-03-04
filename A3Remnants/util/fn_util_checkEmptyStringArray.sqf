//OLD, NOT NEEDED
// mu_fnc_util_checkEmptyString
// Parameters:
//				_strCheck - String that gets compared to an empty string
// Description: Checks if String is empty. If so, it gets replaced with "*", which is needed for database purposes

//_arrCheck = _this select 0;
params ["_arrCheck"];
//diag_log format ['_arrCheck IS %1', _arrCheck];
for[{i=0},{i<count (_arrCheck)},{i=i+1}] do
	{
        _strCheck = _arrcheck select i;
        
		if(_strCheck == "") then
			{
				_arrCheck set  [i,"*"];
			};
	};
_arrCheck