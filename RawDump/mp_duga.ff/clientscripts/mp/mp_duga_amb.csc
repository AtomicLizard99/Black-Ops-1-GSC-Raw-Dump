//
// file: mp_duga_amb.csc
// description: clientside ambient script for mp_duga: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	//************************************************************************************************
	//                                              Ambient Packages
	//************************************************************************************************

	//declare an ambientpackage, and populate it with elements
	//mandatory parameters are <package name>, <alias name>, <spawnMin>, <spawnMax>
	//followed by optional parameters <distMin>, <distMax>, <angleMin>, <angleMax>
	
	
	//************************************************************************************************
	//                                       ROOMS
	//************************************************************************************************

	//explicitly activate the base ambientpackage, which is used when not touching any ambientPackageTriggers
	//the other trigger based packages will be activated automatically when the player is touching them
	//the same pattern is followed for setting up ambientRooms
	

		

		
	declareAmbientRoom ("inside");
		Setambientroomtone ("inside", "amb_wind_inside", .5, 1);
		Setambientroomreverb ("inside", "smallroom", 1, 1);
		setAmbientRoomContext( "inside", "ringoff_plr", "indoor" );
		
	declareAmbientRoom ("stone_corr");
		Setambientroomreverb ("stone_corr", "stoneroom", 1, 1);
		setAmbientRoomContext( "stone_corr", "ringoff_plr", "indoor" );
		
	// Delete above rooms once new audio layer is bsp'd (Eckert 6/22)
	
	declareAmbientPackage( "hangar" );
	declareAmbientRoom ("hangar");
		Setambientroomreverb ("hangar", "hangar", 1, 1);
		setAmbientRoomContext( "hangar", "ringoff_plr", "indoor" );
		
	declareAmbientPackage( "outside" );	
    declareAmbientRoom ("outside");
		Setambientroomtone ("outside", "amb_wind_cold", .5, 1);
		Setambientroomreverb ("outside", "duga_outside", 1, 1);
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
	
	declareAmbientPackage( "duga_small_room" );			
	declareAmbientRoom ("duga_small_room");
		Setambientroomreverb ("duga_small_room", "duga_small_room", 1, 1);
		setAmbientRoomContext( "duga_small_room", "ringoff_plr", "indoor" );
		
	declareAmbientPackage( "duga_medium_room" );	
	declareAmbientRoom ("duga_medium_room");
		Setambientroomreverb ("duga_medium_room", "duga_medium_room", 1, 1);
		setAmbientRoomContext( "duga_medium_room", "ringoff_plr", "indoor" );
		
	declareAmbientPackage( "duga_large_room" );	
	declareAmbientRoom ("duga_large_room");
		Setambientroomreverb ("duga_large_room", "duga_large_room", 1, 1);
		setAmbientRoomContext( "duga_large_room", "ringoff_plr", "indoor" );
		
	declareAmbientPackage( "duga_hallway" );			
	declareAmbientRoom ("duga_hallway");
		Setambientroomreverb ("duga_hallway", "duga_hallway", 1, 1);
		setAmbientRoomContext( "duga_hallway", "ringoff_plr", "indoor" );
		
	declareAmbientPackage( "duga_partial_room" );			
	declareAmbientRoom ("duga_partial_room");
		Setambientroomreverb ("duga_partial_room", "duga_partial_room", 1, 1);
		setAmbientRoomContext( "duga_partial_room", "ringoff_plr", "indoor" );
		
	declareAmbientPackage( "duga_stone_corr" );			
    declareAmbientRoom ("duga_stone_corr");
		Setambientroomreverb ("duga_stone_corr", "duga_stone_corr", 1, 1);
		setAmbientRoomContext( "duga_stone_corr", "ringoff_plr", "indoor" );

		
		
	
		
	
	
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

//		activateAmbientPackage( 0, "_pkg", 0 );
		activateAmbientRoom( 0, "outside", 0 );		
}

