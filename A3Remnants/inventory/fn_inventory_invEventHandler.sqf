player addEventhandler ["InventoryOpened",{ 
	[] spawn {
		waitUntil{!isNull (findDisplay 602)};
			_display = (findDisplay 602);
		   (_display displayCtrl 633) ctrlAddEventHandler ["LBDblClick", {[lbData [ctrlIDC (_this#0),_this#1],uniformContainer player] call mgrif_fnc_inventory_inventoryAction}]; //uniform
		   (_display displayCtrl 619) ctrlAddEventHandler ["LBDblClick", {[lbData [ctrlIDC (_this#0),_this#1],backpackContainer player] call mgrif_fnc_inventory_inventoryAction}]; //backpack
		   (_display displayCtrl 638) ctrlAddEventHandler ["LBDblClick", {[lbData [ctrlIDC (_this#0),_this#1],vestContainer player] call mgrif_fnc_inventory_inventoryAction}];  //vest
	};  
}];
