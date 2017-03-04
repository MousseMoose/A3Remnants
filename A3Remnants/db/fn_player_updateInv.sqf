// mu_fnc_player_updateInv
// Parameters:
//				_unit: 		passed by EH
//				_container: passed by EH
// Description:
// Run on: Server

#define MU_CONST_HALFUPDATEFREQ 5

_unit	   = _this select 0;
_container = _this select 1;


//Everytime the player puts/takes an item, this function gets called.
//In order to avoid having to save every single inventory change, inventory only gets saved 10 seconds after
//the last change.

//if container is saveable, add to queue
if(!(isNil {_container getVariable "mu_var_vehicleID"})) then {
	[_container] spawn mu_fnc_veh_addToCargoQueue;//TODO: function
};

mu_var_EH_TP_queueCounter = mu_var_EH_TP_queueCounter + 1;
if(mu_var_EH_TP_queueCounter==1) then {
	uiSleep MU_CONST_UPDATEFREQ;
	mu_update_player_inv = _unit call mu_fnc_player_getInventory;
};
		
mu_var_EH_TP_queueCounter = mu_var_EH_TP_queueCounter-1;

