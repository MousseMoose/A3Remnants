//register player
private _uid = _this select 0;
private _pos = [[5022.01,5900.3,0.00140381],0,"amovpknlmstpslowwrfldnon"];                 			

//inventory in format of mu_fnc_player_getInventory
private _inventory = [[["ItemMap"],["","","U_B_CombatUniform_mcam","V_Rangemaster_belt",""],[]],[[[],[],[[],[]],[[],[]]],[[],[],[[],[]],[[],[]]],[[],[],[[],[]],[[],[]]]]];
private _medical = [0,0,0,0,0,0,0,0,0,0,0];
private _skills = [];
private _par = [
                            _uid,
							0, //unit not yet implemented
                            mu_const_worldID,
                            _pos,
                            _inventory,
							_medical,
                            _skills
                            ];
["registerCharacter",_par,false] call mu_fnc_db_queryASYNC;