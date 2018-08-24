//register player

params [
	["_uid",""],
	["_pos",[] call mgrif_fnc_respawn_getRandomDefault]
];              			

//inventory in format of mgrif_fnc_player_getInventory
private _inventory = [[["ItemMap"],["","","U_B_CombatUniform_mcam","V_Rangemaster_belt",""],[]],[[[],[],[[],[]],[[],[]]],[[],[],[[],[]],[[],[]]],[[],[],[[],[]],[[],[]]]]];
private _medical = [0,0,0,0,0,0,0,0,0,0,0];
private _skills = [];
private _par = [
                            _uid,
							0, //unit not yet implemented
                            mgrif_const_worldID,
                            [_pos,0,"STAND"],
                            _inventory,
							_medical,
                            _skills
                            ];
["registerCharacter",_par,false] call mgrif_fnc_db_queryASYNC;