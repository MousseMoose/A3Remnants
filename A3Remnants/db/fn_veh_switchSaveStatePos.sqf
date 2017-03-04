// mu_fnc_veh_updateLoop
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
if((_veh getVariable ["mu_vehicleID",-1])>=0) then {
    _queuePos = _veh getVariable ["mu_queuePos",-1];
	_states =  _veh getVariable ["mu_vehSaveState", [0,0,0]];
	_states set [_mode,_value];
    if(((_states select 0)>0)||((_states select 1)>0)||((_states select 2)>0)) then {
        (mu_var_veh_updateQueuePOS select _queuePos) set [1,true];
    } else {
        (mu_var_veh_updateQueuePOS select _queuePos) set [1,false];
    };
	
};







/* OLD METHOD, pre VIV
 * 	[STATE0,STATE1,...]
 * 	STATE -> [ canSave (boolean), [NEXT0,NEXT1], identified by index
 *		NEXT -> [STATE_INDEX_X (case 0), STATE_INDEX_Y (case 1)] Selection based on CASE_
 *	No FSM used because of performance issues. FSM checks every frame.
 */
/*

#define STATE_NOSAVE		0 //Engine is off and no Ropes attached
#define STATE_ENGINE		1 //Only Engine is on
#define STATE_ROPE			2 //Only Rope is attached
#define STATE_ENGINEROPE	3 //Ropes attached and Engine is on
  
_queuePos = _veh getVariable ["mu_queuePos",-1];
_curState = _veh getVariable ["mu_saveStatePos",STATE_NOSAVE];
_nextState = (((mu_db_const_engineSaveStates select _curstate) select 1) select _mode) select _value;
_queueValue = (mu_db_const_engineSaveStates select _nextState) select 0;
(mu_var_veh_updateQueuePOS select _queuePos) set [1,_queueValue]; //enables or disables saving by updating value in queue
_veh setVariable ["mu_saveStatePos",_nextState]; //update state variable*/
