// mgrif_fnc_vehDestroyed
// Parameters:
//					_vid: vehicleID of vehicle marked for deletion
// Description:		deletes a destroyed Vehicle from the database

_vid = _this select 0;

_strCreate = format ["[par_id=%1]", _vid];
_create = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQL ['arma3', 'deleteVeh', '%1']", _strCreate];
