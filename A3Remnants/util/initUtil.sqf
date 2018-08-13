//Functions shared by client and server
//Params: none

//Utility
/*
mgrif_fnc_util_checkEmptyString				= compile preprocessfileLineNumbers "common\mgrif_fnc_util_checkEmptyString.sqf";
mgrif_fnc_util_checkEmptyStringArray			= compile preprocessfileLineNumbers "common\mgrif_fnc_util_checkEmptyStringArray.sqf";
mgrif_fnc_util_getVehicleType					= compile preprocessfileLineNumbers "common\mgrif_fnc_util_getVehicleType.sqf";
mgrif_fnc_util_getVehicleHitPoints				= compile preprocessfileLineNumbers "common\mgrif_fnc_util_getVehicleHitPoints.sqf";
mgrif_fnc_util_getVehicleTurretMags			= compile preprocessfileLineNumbers "common\mgrif_fnc_util_getVehicleTurretMags.sqf";
mgrif_fnc_util_getVehicleTurretWeps			= compile preprocessfileLineNumbers "common\mgrif_fnc_util_getVehicleTurretWeps.sqf";
mgrif_fnc_util_applyTextures					= compile preprocessfileLineNumbers "common\mgrif_fnc_util_applyTextures.sqf";
*/
//Initialise Variables

//vehicle parts
	mgrif_const_veh_hpStatic		=	['HitBody'];
	mgrif_const_veh_hpTruck		=	['HitBody',"HitEngine",'HitFuel','HitGlass1','HitGlass2','HitGlass3','HitGlass4','HitGlass5','HitGlass6','HitLGlass','HitRGlass','HitLFWheel','HitLF2Wheel','HitLBWheel','HitLMWheel','HitRFWheel','HitRF2Wheel','HitRBWheel','HitRMWheel'];
	mgrif_const_veh_hpCar			=	['HitBody',"HitEngine",'HitFuel','HitGlass1','HitGlass2','HitGlass3','HitGlass4','HitGlass5','HitGlass6','HitLGlass','HitRGlass','HitLFWheel','HitLF2Wheel','HitRFWheel','HitRF2Wheel'];
	mgrif_const_veh_hpAPCWheel		=	['HitBody','HitEngine','HitFuel','HitLBWheel','HitLF2Wheel','HitLFWheel','HitLMWheel','HitRBWheel','HitRF2Wheel','HitRFWheel','HitRMWheel'];
	//mgrif_const_veh_hpAPCTrack		=	['HitEngine','HitHull','HitLTrack','HitRTrack'];
	mgrif_const_veh_hpTank			=	['HitEngine','HitHull','HitLTrack','HitRTrack'];
	mgrif_const_veh_hpShip			=	['HitBody','HitEngine'];
	mgrif_const_veh_hpHeli			=	['HitHull','HitAvionics','HitEngine','HitFuel','HitVRotor','HitHRotor','HitGlass1','HitGlass2','HitGlass3','HitGlass4','HitGlass5','HitGlass6','HitGlass7','HitGlass8','HitGlass9','HitGlass10','HitLGlass','HitRGlass'];
	mgrif_const_veh_hpPlane		=	['HitHull'];


