/* mgrif_fnc_util_applyTextures
 * Parameters:
 *				_mission:	boolean, determines wether skin is defined in missionNameSpace
 *				_textures:  array of Numbers (index of skin in cfg) and Strings (custom path)
 *				_veh:		object, vehicle
 *				
 */
 
/*_mission = _this  select 0;
_textures = _this select 1;
_veh = _this select 2;*/
params ["_mission","_textures","_veh"];

for [{_i=0},{_i<(count _textures)},{_i=_i+1}]do {
	_config = configFile;
	_curTex = _textures select _i;
	if(typeName _curTex == "NUMBER") then {
		if(_mission) then { _config = missionConfigFile}; //check if texture profile is defined in missionConfigFile
		/* Access and apply skin based on config. 
		*	example: _curTex = 1,_i = 0
		*	configFile
		*		cfgVehicleSkins
		*			B_ATV_F
		*				SomeOtherSkin (index 0)
		*				SkinBluFor (index 1)
		*					textures <- getArray
		*	It would apply the first (because _i=0) texture taken from  SkinBluFor >> textures to the first (because _i = 0) hiddenSelection 
		*/
		_veh setObjectTextureGlobal[_i, (getArray(((configFile >> "cfgVehicleSkins" >> (typeOf _veh)) select _curTex) >> "textures") select _i)];
	} else { //Custom String used for applying texture
		if(!(_curTex == "")) then {
			_veh setObjectTextureGlobal[_i, _curTex];
		};
	};
};
