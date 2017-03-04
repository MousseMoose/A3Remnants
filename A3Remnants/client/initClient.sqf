//necessary for more efficient MPEventhandlers
mu_mphp =  	compilefinal "";
mu_mpkp =  	compilefinal "";
mu_mphv =  	compilefinal "";
mu_mpkv =	compilefinal "";

//TODO: Used stacked version?
ingameUISetEventhandler ["action", "
	if(count _this>3) then {
	      switch (_this select 3) do {
	        case 'LoadVehicle': {
	            _this spawn {
	                [vehicle player,2,1] remoteExec ['mu_fnc_veh_switchSaveStatePos',2,false];
	            };
	        };
	        
	        case 'UnloadVehicle': {
	            _this spawn {
	                [vehicle player] remoteExec ['mu_fnc_db_remoteTouchdown',2,false];
	            };
	        };
	        
	        case 'UnloadAllVehicles': {
                
	            (getVehicleCargo (_this select 0)) spawn {
	                {[_x,2,0] remoteExec ['mu_fnc_db_remoteTouchdown',2,false]} forEach _this;
	            };
	        };
	        
	       
	    };  
    };
	
    false	
"];



