//
// file: mp_zoo_amb.csc
// description: clientside ambient script for mp_zoo: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
		declareAmbientRoom( "default" );
			setAmbientRoomTone( "default", "amb_wind_outside", 1, 1 );
			setAmbientRoomReverb( "default", "zoo_outside", 1, 1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom("walkway" );
			//this is for open-air walkways surrounded by walls or rooms that are fully open on one side
			setAmbientRoomTone( "walkway", "amb_wind_outside", 1, 1 );
			setAmbientRoomReverb( "walkway", "zoo_walkway", 1, 1 );
			setAmbientRoomContext( "walkway", "ringoff_plr", "outdoor" );
	
		declareAmbientRoom("walkway_tunnel" );
			//this is for walkways/tunnels that have a tunnel sound rather than the regular outside wind
			setAmbientRoomTone( "walkway_tunnel", "amb_tunnel", 1, 1 );
			setAmbientRoomReverb( "walkway_tunnel", "zoo_walkway", 1, 1 );
			setAmbientRoomContext( "walkway_tunnel", "ringoff_plr", "indoor" );
			
		declareAmbientRoom("concrete_room" );
			setAmbientRoomReverb( "concrete_room", "zoo_concrete_room", 1, 1 );
			setAmbientRoomContext( "concrete_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom("small_room" );
			setAmbientRoomReverb( "small_room", "zoo_small_room", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );	
			
		declareAmbientRoom("trapezoid_small_room" );
			setAmbientRoomReverb( "trapezoid_small_room", "zoo_concrete_room", 1, 1 );
			setAmbientRoomContext( "trapezoid_small_room", "ringoff_plr", "indoor" );	
			
		declareAmbientRoom("trapezoid_large_room" );
			setAmbientRoomReverb( "trapezoid_large_room", "zoo_concrete_room", 1, 1 );
			setAmbientRoomContext( "trapezoid_large_room", "ringoff_plr", "indoor" );				
			
		declareAmbientRoom("small_wood_room" );
			setAmbientRoomReverb( "small_wood_room", "zoo_wood_room", 1, 1 );
			setAmbientRoomContext( "small_wood_room", "ringoff_plr", "indoor" );			

		declareAmbientRoom("stairwell" );
			setAmbientRoomReverb( "stairwell", "zoo_stairwell", 1, 1 );
			setAmbientRoomContext( "stairwell", "ringoff_plr", "indoor" );
			
		declareAmbientRoom("underground_room" );
			setAmbientRoomTone( "underground_room", "amb_tunnel", 1, 1 );
			setAmbientRoomReverb( "underground_room", "zoo_underground_room", 1, 1 );
			setAmbientRoomContext( "underground_room", "ringoff_plr", "indoor" );

		declareAmbientRoom("underground_tunnel" );
			setAmbientRoomTone( "underground_tunnel", "amb_tunnel", 1, 1 );
			setAmbientRoomReverb( "underground_tunnel", "zoo_underground_tunnel", 1, 1 );
			setAmbientRoomContext( "underground_tunnel", "ringoff_plr", "indoor" );
			
		declareAmbientRoom("tight_space" );
			setAmbientRoomReverb( "tight_space", "zoo_tight_space", 1, 1 );
			setAmbientRoomContext( "tight_space", "ringoff_plr", "indoor" );

		declareAmbientRoom("monorail_cars" );
			setAmbientRoomTone( "monorail_cars", "amb_tunnel", 1, 1 );
			setAmbientRoomReverb( "monorail_cars", "zoo_monorail_car", 1, 1 );
			setAmbientRoomContext( "monorail_cars", "ringoff_plr", "indoor" );
					
	activateAmbientRoom( 0, "default", 0 );	
	
	thread snd_start_autofx_audio();	
}



//snd_play_loopers()
//{
	//Level loops
//	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-1685, 458, 316), .5 );
	
//}


snd_start_autofx_audio()
{

	snd_level_play_auto_fx ( "fx_water_drip_light_short", "amb_water_drip", 0, 0, 0, true );
	snd_level_play_auto_fx ( "fx_water_drip_light_long", "amb_water_drip", 0, 0, 0, true );	
	snd_level_play_auto_fx ( "fx_mp_dlc3_outskirts_tinhat", "amb_light_buzz", 0, 0, -10, false );
	snd_level_play_auto_fx ( "fx_mp_outskirts_floures_glow1", "amb_flourescent", 0, 0, -10, false );	
	snd_level_play_auto_fx ( "fx_insects_swarm_md_light", "amb_flies", 0, 0, -10, false );	
	snd_level_play_auto_fx ( "fx_insects_moths_light_source_md", "amb_moth_light", 0, 0, -10, false );
	
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