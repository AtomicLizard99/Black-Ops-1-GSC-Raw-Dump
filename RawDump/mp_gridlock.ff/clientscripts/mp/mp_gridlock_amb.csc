//
// file: mp_gridlock_amb.csc
// description: clientside ambient script for mp_gridlock: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
		declareAmbientRoom( "gridlock_outside" );
			setAmbientRoomTone( "gridlock_outside", "amb_wind_outside", .5, .6 );
			setAmbientRoomReverb( "gridlock_outside", "gridlock_outside", 1, 1 );
			setAmbientRoomContext( "gridlock_outside", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "woods" );
			setAmbientRoomTone( "woods", "amb_wind_outside", .5, .6);
			setAmbientRoomReverb( "woods", "gridlock_woods", 1, 1 );
			setAmbientRoomContext( "woods", "ringoff_plr", "outdoor" );
		
		declareAmbientRoom( "under_pass" );
			setAmbientRoomTone( "under_pass", "amb_wind_outside_low", .6, .5 );
			setAmbientRoomReverb( "under_pass", "gridlock_under_pass", 1, 1 );
			setAmbientRoomContext( "under_pass", "ringoff_plr", "indoor" );
		
		declareAmbientRoom( "trailer" );
			setAmbientRoomReverb( "trailer", "gridlock_trailer", 1, 1 );
			setAmbientRoomContext( "trailer", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "hall" );
			setAmbientRoomReverb( "hall", "gridlock_hall", 1, 1 );
			setAmbientRoomContext( "hall", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "metal_room" );
			setAmbientRoomReverb( "metal_room", "gridlock_metal_room", 1, 1 );
			setAmbientRoomContext( "metal_room", "ringoff_plr", "indoor" );
		
		declareAmbientRoom( "stairwell" );
			setAmbientRoomReverb( "stairwell", "gridlock_stairwell", 1, 1 );
			setAmbientRoomContext( "stairwell", "ringoff_plr", "indoor" );
		
		declareAmbientRoom( "stone_room" );
			setAmbientRoomReverb( "stone_room", "gridlock_stone_room", 1, 1 );
			setAmbientRoomContext( "stone_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "bathroom" );
			setAmbientRoomReverb( "bathroom", "gridlock_bathroom", 1, 1 );
			setAmbientRoomContext( "bathroom", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "motel_wood_room" );
			setAmbientRoomReverb( "motel_wood_room", "gridlock_wood_room", 1, 1 );
			setAmbientRoomContext( "motel_wood_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "motel_upstairs" ); //slightly larger motel room
			setAmbientRoomReverb( "motel_upstairs", "gridlock_med_room", 1, 1 );
			setAmbientRoomContext( "motel_upstairs", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "cafe" );
			setAmbientRoomReverb( "cafe", "gridlock_med_room", 1, 1 );
			setAmbientRoomContext( "cafe", "ringoff_plr", "indoor" );
					
		declareAmbientRoom( "outdoor_stair" );  //outdoor stairs to walkway over road 
			setAmbientRoomReverb( "outdoor_stair", "gridlock_outdoor_stair", 1, 1 );
			setAmbientRoomContext( "outdoor_stair", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "metal_container" );  //outdoor stairs to walkway over road 
			setAmbientRoomReverb( "metal_container", "gridlock_metal_container", 1, 1 );
			setAmbientRoomContext( "metal_container", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "metal_corridor" );  //narrow metal corridor inside metal container
			setAmbientRoomReverb( "metal_corridor", "gridlock_metal_corridor", 1, 1 );
			setAmbientRoomContext( "metal_corridor", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "overhang" );  //underneath motel overhang in parking lot
			setAmbientRoomTone( "overhang", "amb_wind_outside_low", .6, .5 );
			setAmbientRoomReverb( "overhang", "gridlock_overhang", 1, 1 );
			setAmbientRoomContext( "overhang", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "alley" );  //alleys next to motel/garage
			setAmbientRoomTone( "alley", "amb_wind_outside_low", .6, .5 );
			setAmbientRoomReverb( "alley", "gridlock_alley", 1, 1 );
			setAmbientRoomContext( "alley", "ringoff_plr", "outdoor" );
		
		
	activateAmbientRoom( 0, "gridlock_outside", 0 );	
		
	thread snd_start_autofx_audio();
}


snd_start_autofx_audio()
{
    snd_level_play_auto_fx ( "fx_light_road_flare", "amb_flare", 0, 0, 0, false );
    snd_level_play_auto_fx ( "fx_ship_fire_smolder_area", "amb_rubble_fire", 0, 0, 0, false );
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

