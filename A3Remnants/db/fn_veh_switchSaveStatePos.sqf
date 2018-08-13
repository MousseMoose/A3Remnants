// mgrif_fnc_veh_updateLoop
// Parameters:
//				_veh: vehicle
//				_mode: Engine (0) or Rope (1) or ViV (2)
//				_value: 0 (on) or 1 (off)
//
// 

#define CASE_ENGINE 0 	// Engine EH fired
#define CASE_ROPE 1	  	// One of the Rope EHs fired
#define CASE_VIV 2		//Vehicle in Vehicle Transportation




_veh = _this select 0;
_mode = _this select 1;
_value = _this select 2;
//hint format["%1 %2 %3",_veh,_mode,_value];
diag_log format[" savestatepos %1 %2 %3",_veh,_mode,_value];
if((_veh getVariable ["mgrif_vehicleID",-1])>=0) then {
    _queuePos = _veh getVariable ["mgrif_queuePos",-1];
	_states =  _veh getVariable ["mgrif_vehSaveState", [0,0,0]];
	_states set [_mode,_value];
    if(((_states select 0)>0)||((_states select 1)>0)||((_states select 2)>0)) then {
        (mgrif_var_veh_updateQueuePOS select _queuePos) set [1,true];
    } else {
        (mgrif_var_veh_updateQueuePOS select _queuePos) set [1,false];
    };
	
};
