//necessary for more efficient MPEventhandlers
mgrif_mphp =  	compilefinal "";
mgrif_mpkp =  	compilefinal "";
mgrif_mphv =  	compilefinal "";
mgrif_mpkv =	compilefinal "";

//TODO: Used stacked version?
ingameUISetEventhandler ["action", "
	if(count _this>3) then {
	      switch (_this select 3) do {
	        case 'LoadVehicle': {
	            _this spawn {
	                [vehicle player,2,1] remoteExec ['mgrif_fnc_veh_switchSaveStatePos',2,false];
	            };
	        };
	        
	        case 'UnloadVehicle': {
	            _this spawn {
	                [vehicle player] remoteExec ['mgrif_fnc_db_remoteTouchdown',2,false];
	            };
	        };
	        
	        case 'UnloadAllVehicles': {
                
	            (getVehicleCargo (_this select 0)) spawn {
	                {[_x,2,0] remoteExec ['mgrif_fnc_db_remoteTouchdown',2,false]} forEach _this;
	            };
	        };
	        
	       
	    };  
    };
	
    false	
"];



