// mu_fnc_srv_debugMYSQL
// Parameters:
//				_query:String 		query specified in .ini
//				_params:Array		parameters for the query
//				_update:Boolean		
// Description: executes a query with specified parameters.
/*_query 	= [_this,0,"",[""]] call BIS_fnc_param; 
_params	= [_this,1,[],[[]]] call BIS_fnc_param; 
_update = [_this,2,false,[false]] call BIS_fnc_param;*/
/*params [["_query","defaultQuery","",[""]],
["_params",[],[],[[]]],
"_update"];*/
params [["_query","defaultQuery"],["_params",[]]],["_update",false]];

if(_update) then {_update = 1;} else {_update=2;};
{_query = format["%1:%2",_query,_x]} forEach _params;
_key = format["%1:SQL:%2",_update,_query];
diag_log format["DB CALL: extDB3 call %1",_key];
private _result = "extDB3" callExtension _key;
diag_log format ["%1 %2", _query, _result];
_result = call compile _result;

//if only "one way" update call, exit
if(_update==1) exitWith{};

//in case of error
if((_result select 0) == 0) exitWith {diag_log format["Error: %1, request %2",_result select 1, _key]};



//Prepare Unique ID
_key = _result select 1;

_queryResult = "";
_loop = true;

//Request and check if script has to wait for database result
while{_loop} do
{
	_queryResult = "extDB3" callExtension format["5:%1", _key];
	if (_queryResult isEqualTo "[3]") then
		{
            if(canSuspend) then {
                uisleep 0.1;
            };
			
		} else {
			_loop = false;
		};
		
	

};

//Request rest of message and append to query result String
while{true} do {
		_pipe = "extDB3" callExtension format["5:%1", _key];
		if(_pipe isEqualTo "") exitWith {_loop = false};
		_queryResult = _queryResult + _pipe;
	};
_queryResult = call compile _queryResult;
_queryResult = _queryResult select 1;
_queryResult;