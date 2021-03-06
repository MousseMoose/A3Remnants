// mgrif_fnc_player_updateInv
// Parameters:
//				_unit: 		passed by EH
//				_container: passed by EH
// Description:
// Run on: Server

#define mgrif_CONST_HALFUPDATEFREQ 5

_unit	   = _this select 0;
_container = _this select 1;


//Everytime the player puts/takes an item, this function gets called.
//In order to avoid having to save every single inventory change, inventory only gets saved 10 seconds after
//the last change.

//if container is saveable, add to queue
if(!(isNil {_container getVariable "mgrif_var_vehicleID"})) then {
	[_container] spawn mgrif_fnc_veh_addToCargoQueue;//TODO: function
};

mgrif_var_EH_TP_queueCounter = mgrif_var_EH_TP_queueCounter + 1;
if(mgrif_var_EH_TP_queueCounter==1) then {
	uiSleep mgrif_CONST_UPDATEFREQ;
	mgrif_update_player_inv = _unit call mgrif_fnc_player_getInventory;
};
		
mgrif_var_EH_TP_queueCounter = mgrif_var_EH_TP_queueCounter-1;

