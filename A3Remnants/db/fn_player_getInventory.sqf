// mgrif_fnc_player_preparePlayerInvVar
// Parameters: _units: player object
// Description: gets relevant player inventory infos and packs them in an array to be sent to the server
	_unit = _this select 0;
	_inv =[
													[	//equip
														(assignedItems _unit),
														
														[
															headgear _unit,
															goggles _unit,
															uniform _unit,
															vest _unit,
															backpack _unit
														],
														
														([_unit] call mgrif_fnc_util_assignedWeapons)
													],
													
													
													[
															[(uniformContainer _unit)] call mgrif_fnc_util_getAllCargo,
															[(vestContainer _unit)] call mgrif_fnc_util_getAllCargo,
															[(backpackContainer _unit)] call mgrif_fnc_util_getAllCargo
													]
												];
	_inv