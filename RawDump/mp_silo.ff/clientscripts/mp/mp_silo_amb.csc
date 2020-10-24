//
// file: mp_silo_amb.csc
// description: clientside ambient script for mp_silo: setup ambient sounds, etc.
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
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

//		activateAmbientPackage( 0, "_pkg", 0 );
//		activateAmbientRoom( 0, "_room", 0 );	

    declareAmbientRoom( "default" );
			setAmbientRoomTone( "default", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "default", "rv_mpsilo_default", 1, 1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
		
		declareAmbientRoom( "large_room" );
			setAmbientRoomTone( "large_room", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "large_room", "rv_mpsilo_large_room", 1, 1 );
			setAmbientRoomContext( "large_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "large_room_metal" );
			setAmbientRoomTone( "large_room_metal", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "large_room_metal", "rv_mpsilo_large_room_metal", 1, 1 );
			setAmbientRoomContext( "large_room_metal", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "small_room" );
		  setAmbientRoomTone( "small_room", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "small_room", "rv_mpsilo_small_room", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "silo" );
			setAmbientRoomTone( "silo", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "silo", "rv_mpsilo_silo", 1, 1 );
			setAmbientRoomContext( "silo", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "tunnel_small" );
			setAmbientRoomTone( "tunnel_small", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "tunnel_small", "rv_mpsilo_tunnel_small", 1, 1 );
			setAmbientRoomContext( "tunnel_small", "ringoff_plr", "indoor" );						
			
		declareAmbientRoom( "tunnel" );
		  setAmbientRoomTone( "tunnel", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "tunnel", "rv_mpsilo_tunnel", 1, 1 );
			setAmbientRoomContext( "tunnel", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "partial_room" );
			setAmbientRoomTone( "partial_room", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "partial_room", "rv_mpsilo_partial_room", 1, 1 );
			setAmbientRoomContext( "partial_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "partial_room_metal" );
			setAmbientRoomTone( "partial_room_metal", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "partial_room_metal", "rv_mpsilo_partial_room_metal", 1, 1 );
			setAmbientRoomContext( "partial_room_metal", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "alleyway" );
			setAmbientRoomTone( "alleyway", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "alleyway", "rv_mpsilo_alleyway", 1, 1 );
			setAmbientRoomContext( "alleyway", "ringoff_plr", "indoor" );

		activateAmbientRoom( 0, "default", 0 );
		thread snd_play_loopers();
}

snd_play_loopers()
{
	clientscripts\mp\_audio::playloopat( 0, "amb_battle_dist", (3035, -1017, 604), .5 );
	
}	
