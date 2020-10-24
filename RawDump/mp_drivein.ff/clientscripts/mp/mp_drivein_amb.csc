//
// file: mp_drivein_amb.csc
// description: clientside ambient script for mp_drivein: setup ambient sounds, etc.
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
			setAmbientRoomReverb( "default", "rv_mpdrivein_default", 1, 1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
		
		declareAmbientRoom( "med_room" );
			setAmbientRoomTone( "med_room", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "med_room", "rv_mpdrivein_med_room", 1, 1 );
			setAmbientRoomContext( "med_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "large_room_metal" );
			setAmbientRoomTone( "large_room_metal", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "large_room_metal", "rv_mpdrivein_large_room_metal", 1, 1 );
			setAmbientRoomContext( "large_room_metal", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "small_room" );
		  setAmbientRoomTone( "small_room", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "small_room", "rv_mpdrivein_small_room", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "partial_room" );
			setAmbientRoomTone( "partial_room", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "partial_room", "rv_mpdrivein_partial_room", 1, 1 );
			setAmbientRoomContext( "partial_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "trailer" );
			setAmbientRoomTone( "trailer", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "trailer", "rv_mpdrivein_trailer", 1, 1 );
			setAmbientRoomContext( "trailer", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "bathroom" );
			setAmbientRoomTone( "bathroom", "amb_wind_inside", .55, 1);
			setAmbientRoomReverb( "bathroom", "rv_mpdrivein_bathroom", 1, 1 );
			setAmbientRoomContext( "bathroom", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "partial_room_ext" );
			setAmbientRoomTone( "partial_room_ext", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "partial_room_ext", "rv_mpdrivein_partial_room_ext", 1, 1 );
			setAmbientRoomContext( "partial_room_ext", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "partial_room_metal" );
			setAmbientRoomTone( "partial_room_metal", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "partial_room_metal", "rv_mpdrivein_partial_room_metal", 1, 1 );
			setAmbientRoomContext( "partial_room_metal", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "picnic_shelter" );
			setAmbientRoomTone( "picnic_shelter", "amb_wind_outside", .55, 1);
			setAmbientRoomReverb( "picnic_shelter", "rv_mpdrivein_picnic_shelter", 1, 1 );
			setAmbientRoomContext( "picnic_shelter", "ringoff_plr", "indoor" );

		activateAmbientRoom( 0, "default", 0 );
		
		thread snd_play_loopers();
		thread snd_start_autofx_audio();
}

snd_play_loopers()
{
//	clientscripts\mp\_audio::playloopat( 0, "amb_numbers", (-84.1, -1008, 254), .5 );	
}	



snd_start_autofx_audio()
{
	snd_level_play_auto_fx ( "fx_mp_drivein_bio_fly_swarm", "amb_flies", 0, 0, 0, false );
	snd_level_play_auto_fx ( "fx_mp_drivein_bio_moths_light", "amb_flies", 0, 0, 0, false );
	snd_level_play_auto_fx ( "fx_mp_drivein_light_fluorescent", "amb_light_buzz", 0, 0, 0, false );
	snd_level_play_auto_fx ( "fx_mp_drivein_light_flood", "amb_light_hum", 0, 0, 0, false );
	snd_level_play_auto_fx ( "fx_mp_drivein_light_tinhat", "amb_light_hum", 0, 0, 0, false );

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
snd_print_fx_id( fxid, type, ent )
{
/#
	if( getdvarint( #"debug_audio" ) > 0 )
	{
		printLn( "^5 ******* fxid; " + fxid + "^5 type; " + type );
	}	
#/			
}