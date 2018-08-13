// mgrif_fnc_util_getVehicleType
// Parameters:
//				_veh: vehicle whose type is to be determined
// Description:	as config returns wrong hitpoint counts, this script works with arrays indicating hitpoints as strings to be used with configFile. This function determines which is to be used for the vehicle in question

_veh = _this select 0;

_ret='';

if(_veh isKindOf 'car') then
	{
        if(_veh isKindOf 'truck') then
			{
		        
		        	_ret = 'truck';
		    }
        else
        	{
             		_ret = 'car' ; 
            };
                	
    };
    
if(_veh isKindOf 'Wheeled_APC_F') then
	{
		        _ret = 'APCWheel';
    };
    
if(_veh isKindOf 'Tank') then
	{
        _ret ='Tank';      	
    };
    

if(_veh isKindOf 'Helicopter') then
	{
        _ret ='Heli';      	
    };
    
if(_veh isKindOf 'Ship') then
	{
        _ret ='Ship' ;     	
    };
    
if(_veh isKindOf 'Plane') then
	{
        _ret ='Plane';      	
    };

if(_veh isKindOf 'StaticWeapon') then
	{
        _ret ='Static';     	
    };
 
_ret
    
    
/*
if() then
	{
        	
    };
    */