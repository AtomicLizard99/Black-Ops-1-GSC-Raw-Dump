//
// file: mp_area51_amb.csc
// description: clientside ambient script for mp_area51: setup ambient sounds, etc.
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
			setAmbientRoomReverb( "default", "rv_mparea51_outdoor", 1, 1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
		
		declareAmbientRoom( "partial_room" );
		  setAmbientRoomTone( "partial_room", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "partial_room", "rv_mparea51_partial_room", 1, 1 );
			setAmbientRoomContext( "partial_room", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "partial_room_metal" );
		  setAmbientRoomTone( "partial_room_metal", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "partial_room_metal", "rv_mparea51_partial_room_metal", 1, 1 );
			setAmbientRoomContext( "partial_room_metal", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "alleyway" );
		  setAmbientRoomTone( "alleyway", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "alleyway", "rv_mparea51_alleyway", 1, 1 );
			setAmbientRoomContext( "alleyway", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "small_room" );
		  setAmbientRoomTone( "small_room", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "small_room", "rv_mparea51_small_room", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "large_room" );
		  setAmbientRoomTone( "large_room", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "large_room", "rv_mparea51_large_room", 1, 1 );
			setAmbientRoomContext( "large_room", "ringoff_plr", "indoor" );						
			
		declareAmbientRoom( "hangar" );
		  setAmbientRoomTone( "hangar", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "hangar", "rv_mparea51_hangar", 1, 1 );
			setAmbientRoomContext( "hangar", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "large_room_metal" );
			setAmbientRoomTone( "large_room_metal", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "large_room_metal", "rv_mparea51_large_room_metal", 1, 1 );
			setAmbientRoomContext( "large_room_metal", "ringoff_plr", "indoor" );

		activateAmbientRoom( 0, "default", 0 );
		
		thread snd_start_autofx_audio();
		thread snd_play_truck_loopers();
			
}

snd_start_autofx_audio()
{

	snd_level_play_auto_fx ( "fx_mp_area51_water_drip_sm", "amb_water_drip", 0, 0, 0, true );
	snd_level_play_auto_fx ( "fx_insects_swarm_md_light", "amb_flies", 0, 0, 0, false ); 
	snd_level_play_auto_fx ( "fx_pipe_steam_md", "amb_steam_hiss02", 0, 0, 0, false );
	
}

snd_level_play_auto_fx( fxid, alias, offsetx, offsety, offsetz, onground, area )
{
	for( i = 0; i < level.createFXent.size; i++ )
	{
		if( level.createFXent[i].v["fxid"] == fxid )
		{
			
			if (isdefined (area))
			{
				level.createFXent[i].soundEntArea = area;
			}	
			
			origin = level.createFXent[i].v["origin"];
			
			if (isdefined (offsetx) && offsetx > 0 )
			{
				//add offset to origin
				origin = origin + (offsetx,0,0);
			}
			if (isdefined (offsety) && offsetx > 0 )
			{
				//add offset to origin
				origin = origin + (0,offsety,0);
			}
			if (isdefined (offsetz) && offsetx > 0 )
			{
				//add offset to origin
				origin = origin + (0,0,offsetz);
			}
			if (isdefined (onground) && onground )
			{
				//check to ground move origin to ground + offest to ensure is above ground
			trace = undefined; 
			d = undefined; 

			FxOrigin = origin; 
			trace = bullettrace( FxOrigin, FxOrigin -( 0, 0, 100000 ), false, undefined ); 

			d = distance( FxOrigin, trace["position"] ); 
			
			origin =  trace["position"];
					
			}	
			
			
	    	soundloopemitter( alias, origin );			
		

		}
	}
}
snd_play_auto_fx_area_emmiters()
{
	for( i = 0; i < level.createFXent.size; i++ )
	{	
		if( level.createFXent[i].soundEntArea > 1 )
		{

			
		}	
	}	
}	

snd_play_truck_loopers()
{
	clientscripts\mp\_audio::playloopat( 0, "veh_truck_engine_idle", (-1479.4, -1827.5, 80.2), .5 );
	clientscripts\mp\_audio::playloopat( 0, "veh_truck_engine_idle", (-501.2, 2571.1, 102.0), .5 );
	clientscripts\mp\_audio::playloopat( 0, "veh_truck_engine_idle", (1562.3, 202.5, 98.5), .5 );
	
}
