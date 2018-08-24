class db {
		file = "db";

		class db_queryASYNC {};
		class db_addToCargoQueue {};	
		class db_remoteTakePut {};
		class db_remoteHandleHeal {};
		class db_remoteTouchdown {};
		class db_remoteInitPlayerServer {};
		
		class veh_destroyed {};
		//class veh_getHitpoints {};
		class veh_register {};
		class veh_setUp {};
		class veh_spawnWorld {};
		class veh_switchSaveStatePos {};
		class veh_updateLoopDmg {};
		class veh_updateLoopMag {};
		class veh_updateLoopPos {};
		class veh_updateLoopCargo {};

		class player_authProfile {};
		class player_authCharacter {};
		class player_getInventory {};
		class player_create {};
		class player_register {};
		
		
		class player_updateLoopPos {};
		class player_updateLoopInv {};
		class player_updateLoopDmg {};
		
		class respawn_register {};
		class respawn_registerProfileRespawn {};
		class respawn_deleteProfileRespawn {};
		class respawn_destroyed {};
		class respawn_setUp {};
		class respawn_setDisabled {};
		class respawn_getRandomDefault {};
		
	};