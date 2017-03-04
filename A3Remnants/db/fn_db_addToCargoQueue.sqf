// mu_fnc_
// Parameters:
//				_
// Description:

//if _id >=0 (is not a temporary object) then pushback reference to queue unless it's already added
if((_this select 1) >=0) then {(_this select 2) pushbackunique (_this select 0);};

/* Old, and surprisingly slower method, flawed idea that int comparison takes up significantly shorter amount of time than Object comparison
_veh = _this select 0;
_id = _this select 1;
_queue = _this select 2;// should have form [[reference1,reference2,...],[index1,index2,...]]
//hint format ["Attempting to add: %1 %2 %3",_veh,_id_queue];
if(_id>=0) then {
	if(((_queue select 1) pushBackUnique _id)>=0) then { //if successfully uniquely added
		(_queue select 0) pushBack _veh;
        hint format ["Added to queue: %1",(_queue select 1)];
	};
};
*/