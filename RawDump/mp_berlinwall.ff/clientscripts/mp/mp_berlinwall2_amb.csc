//
// file: mp_berlinwall_amb.csc
// description: clientside ambient script for mp_berlinwall: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	

	
		declareAmbientRoom( "default" );
			setAmbientRoomReverb( "default", "mp_cairo_outside", 1, 1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );

		
		declareAmbientRoom( "tunnel" );
			setAmbientRoomReverb( "tunnel", "mp_cairo_smallroom", 1, 1 );
			setAmbientRoomContext( "tunnel", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "small_room" );
			setAmbientRoomReverb( "small_room", "mp_cairo_medroom", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "alleyway" );
			setAmbientRoomReverb( "alleyway", "mp_cairo_stairwell", 1, 1 );
			setAmbientRoomContext( "alleyway", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "shed" );
			setAmbientRoomReverb( "shed", "mp_cairo_smallroom", 1, 1 );
			setAmbientRoomContext( "shed", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "distillery" );
			setAmbientRoomReverb( "distillery", "mp_cairo_lrgroom", 1, 1 );
			setAmbientRoomContext( "distillery", "ringoff_plr", "indoor" );						
			


//new rooms
	//record_store
	//pharmacy
	//coffeeshop
	//alleyway_north
	//clothing_shop
	//building_east_1
	//building_east_2
	//west_checkpoint
	//building_east_3
	//building_east_factory
	// mp_cairo_smallroom
	// mp_cairo_medroom	 
	// mp_cairo_lrgroom
	// mp_cairo_tile_room
	// mp_cairo_stairwell
	
			
		declareAmbientRoom( "record_store" );
			setAmbientRoomReverb( "record_store", "mp_cairo_medroom", 1, 1 );
			setAmbientRoomContext( "record_store", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "pharmacy" );
			setAmbientRoomReverb( "pharmacy", "mp_cairo_medroom", 1, 1 );
			setAmbientRoomContext( "pharmacy", "ringoff_plr", "indoor" );						
			
		declareAmbientRoom( "coffeeshop" );
			setAmbientRoomReverb( "coffeeshop", "mp_cairo_medroom", 1, 1 );
			setAmbientRoomContext( "coffeeshop", "ringoff_plr", "indoor" );

		declareAmbientRoom( "alleyway_north" );
			setAmbientRoomReverb( "alleyway_north", "mp_cairo_stairwell", 1, 1 );
			setAmbientRoomContext( "alleyway_north", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "clothing_shop" );
			setAmbientRoomReverb( "clothing_shop", "mp_cairo_smallroom", 1, 1 );
			setAmbientRoomContext( "clothing_shop", "ringoff_plr", "indoor" );						
			
		declareAmbientRoom( "building_east_1" );
			setAmbientRoomReverb( "building_east_1", "mp_cairo_lrgroom", 1, 1 );
			setAmbientRoomContext( "building_east_1", "ringoff_plr", "indoor" );

		declareAmbientRoom( "building_east_2" );
			setAmbientRoomReverb( "building_east_2", "mp_cairo_lrgroom", 1, 1 );
			setAmbientRoomContext( "building_east_2", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "west_checkpoint" );
			setAmbientRoomReverb( "west_checkpoint", "mp_cairo_smallroom", 1, 1 );
			setAmbientRoomContext( "west_checkpoint", "ringoff_plr", "indoor" );						
			
		declareAmbientRoom( "building_east_3" );
			setAmbientRoomReverb( "building_east_3", "mp_cairo_lrgroom", 1, 1 );
			setAmbientRoomContext( "building_east_3", "ringoff_plr", "indoor" );

		declareAmbientRoom( "building_east_factory" );
			setAmbientRoomReverb( "building_east_factory", "mp_cairo_lrgroom", 1, 1 );
			setAmbientRoomContext( "building_east_factory", "ringoff_plr", "indoor" );

		declareAmbientRoom( "culdesac" );
			setAmbientRoomTone( "culdesac", "amb_wind_culdesac", 1, 1.5);
			setAmbientRoomReverb( "culdesac", "mp_cairo_stairwell", 1, 1 );
			setAmbientRoomContext( "culdesac", "ringoff_plr", "outdoor" );			
			
		
		activateAmbientRoom( 0, "default", 0 );
		
		thread snd_start_autofx_audio();
		thread snd_play_loopers();
		thread snd_distant_rolling();
		
}
snd_play_loopers()
{
	//Level loops
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-1685, 458, 316), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-1099, -1839, 226), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-1372, -1240, 521), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-2000, -120, 319), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (120.9, 1285.5, 443.8), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (1932, 953.3, 504.4), .5 );	
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (1092, -1850, 253), .5 );				
	clientscripts\mp\_audio::playloopat( 0, "amb_basement", (1491, -2786, 143), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_radiator", (938, -1418, 131), .5 );	
	clientscripts\mp\_audio::playloopat( 0, "amb_radiator", (-83, -2401, 105), .5 );		
	clientscripts\mp\_audio::playloopat( 0, "amb_radiator", (90, -1921, 114), .5 );			
	clientscripts\mp\_audio::playloopat( 0, "amb_light_cigar", (-783, -1054, 87), .5 );	
	clientscripts\mp\_audio::playloopat( 0, "amb_water_heater", (1711, -1998, 151), .5 );	
	//clientscripts\mp\_audio::playloopat( 0, "amb_water_heater", (-148, -2429, 242), .5 );	
	
	clientscripts\mp\_audio::playloopat( 0, "amb_industrial_dist_1", (3096, -2072, 593), .5 );	

	
	

}	
snd_start_autofx_audio()
{
	snd_play_auto_fx ( "fx_mp_insect_swarm", "amb_flies");
	snd_play_auto_fx ( "fx_smk_vent", "amb_steam_hiss");
	snd_play_auto_fx ( "fx_mp_berlin_smk_vent", "amb_heating_vent");
	snd_play_auto_fx ( "fx_mp_water_drip_light_long", "amb_water_drip", 0, 0, 0, true );
	snd_play_auto_fx ( "fx_mp_water_drip_light_short", "amb_water_drip", 0, 0, 0, true );
	snd_play_auto_fx ( "fx_mp_berlin_smk_smolder_sm", "amb_fire_sml");
	
	snd_play_auto_fx ( "fx_light_floodlight_bright", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_light_fluorescent_tube_nobulb2", "amb_light_flourescent");	
	snd_play_auto_fx ( "fx_light_floodlight_dim", "amb_light_hum");
	snd_play_auto_fx ( "fx_mp_berlin_light_cone_tinhat", "amb_light_hum");
	snd_play_auto_fx ( "fx_light_godray_sm_ylw", "amb_light_hum");
	snd_play_auto_fx ( "fx_mp_berlin_pipe_steam_md", "amb_steam_hiss");
	snd_play_auto_fx ( "fx_mp_berlin_pipe_steam_sm", "amb_steam_hiss");

}

snd_play_auto_fx( fxid, alias, offsetx, offsety, offsetz, onground, area )
{
	for( i = 0; i < level.createFXent.size; i++ )
	{
		if( level.createFXent[i].v["fxid"] == fxid )
		{
			level.createFXent[i].soundEnt = spawnFakeEnt( 0 );
			
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
			setfakeentorg( 0, level.createFXent[i].soundEnt, origin );
			
			playloopsound( 0, level.createFXent[i].soundEnt, alias, .5 );

		}
	}
}
snd_play_auto_fx_area_emmiters()
{
	for( i = 0; i < level.createFXent.size; i++ )
	{	
		if( level.createFXent[i].soundEntArea > 1 )
		{
			//getentarray level.createFXent[i].soundEntArea
			
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
snd_distant_rolling()
{
	self endon ( "disconnect" );
	
	while (1)
	{
		pick_one = randomintrange (0,7);
	//	wait_time = randomintrange (1,6);
		wait_time = RandomFloatRange( 1, 4 );		
		
		if ( pick_one == 0 )
		{
			playsound(0,"amb_dist_exp_roller", (-1743,-4145,1378));
		}
		else if ( pick_one == 1 )
		{
			playsound(0,"amb_dist_exp_roller", (613,-3645,1478));
		}
		else if ( pick_one == 2 )
		{
			playsound(0,"amb_dist_exp_roller", (3567,-3145,1078));
		}
		else if ( pick_one == 3 )
		{
			playsound(0,"amb_dist_exp_roller", (4627,-1693,1306));
		}
		else if ( pick_one == 4 )
		{
			playsound(0,"amb_dist_exp_roller", (3680,931,1295));
		}
		else if ( pick_one == 5 )
		{
			playsound(0,"amb_dist_exp_roller", (2135,3996,2046));
		}
		else if ( pick_one == 6 )
		{
			playsound(0,"amb_dist_exp_roller", (-629,3319,1871));
		}								
		else
		{
			playsound(0,"amb_dist_exp_roller", (4008,2096,1971));
		}
				
		wait (wait_time);		
		
	}	
}	

