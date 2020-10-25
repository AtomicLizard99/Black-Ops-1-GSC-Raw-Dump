//
// file: mp_stadium_amb.csc
// description: clientside ambient script for mp_stadium: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	
	declareAmbientRoom("outside" );
		//setAmbientRoomtone ("outside", "outside", 1, 1);
		setAmbientRoomReverb( "outside", "stadium_outside", 1, 1 );
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
	
	declareAmbientRoom("rink_room" );
		setAmbientRoomReverb( "rink_room", "stadium_rink_room", 1, 1 );
		setAmbientRoomContext( "rink_room", "ringoff_plr", "indoor" );
		
		
	declareAmbientRoom("small_carpet" );
		setAmbientRoomReverb( "small_carpet", "stadium_small_carpet", 1, 1 );
		setAmbientRoomContext( "small_carpet", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("med_carpet" );
		setAmbientRoomReverb( "med_carpet", "stadium_med_carpet", 1, 1 );
		setAmbientRoomContext( "med_carpet", "ringoff_plr", "indoor" );
		
		
	declareAmbientRoom("small_tile" );
		setAmbientRoomReverb( "small_tile", "stadium_small_tile", 1, 1 );
		setAmbientRoomContext( "small_tile", "ringoff_plr", "indoor" );
	
	declareAmbientRoom("med_tile" );
		setAmbientRoomReverb( "med_tile", "stadium_med_tile", 1, 1 );
		setAmbientRoomContext( "med_tile", "ringoff_plr", "indoor" );
	
	declareAmbientRoom("tunnle_stone" );
		setAmbientRoomReverb( "tunnle_stone", "stadium_tunnle_stone", 1, 1 );
		setAmbientRoomContext( "tunnle_stone", "ringoff_plr", "indoor" );	
		
	declareAmbientRoom("gym_room" );
		setAmbientRoomReverb( "gym_room", "stadium_gym_room", 1, 1 );
		setAmbientRoomContext( "gym_room", "ringoff_plr", "indoor" );	
		
	declareAmbientRoom("concrete_room" );
		setAmbientRoomReverb( "concrete_room", "stadium_concrete_room", 1, 1 );
		setAmbientRoomContext( "concrete_room", "ringoff_plr", "indoor" );

	declareAmbientRoom("snack_shack" );
		setAmbientRoomReverb( "snack_shack", "stadium_snack_shack", 1, 1 );
		setAmbientRoomContext( "snack_shack", "ringoff_plr", "indoor" );	
		
	declareAmbientRoom("atrium" );
		setAmbientRoomReverb( "atrium", "stadium_atrium", 1, 1 );
		setAmbientRoomContext( "atrium", "ringoff_plr", "indoor" );	
		
	activateAmbientRoom( 0, "outside", 0 );	
		
		thread snd_start_autofx_audio();
		thread snd_play_loopers();
		
}














snd_play_loopers()
{
	//Level loops
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-68, 3130, 182), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_small_waterfall", (529, 1798, 90), .5 );
}	
snd_start_autofx_audio()
{

	//snd_play_auto_fx ( "fx_mp_water_drip_light_long", "amb_water_drip", 0, 0, 0, true );
	//level._effect["fx_leaves_falling_lite_w"]      						= loadfx("env/foliage/fx_leaves_falling_lite_w");	
	snd_play_auto_fx ( "fx_leaves_falling_lite_w", "amb_wind_tree_high", 0, 0, 0, false );	
	snd_play_auto_fx ( "fx_insects_swarm_md_light", "amb_flies", 0, 0, 15, false );
	snd_play_auto_fx ( "fx_mp_fumes_vent_md", "amb_heating_vent", 0, 0, 0, false );	
	snd_play_auto_fx ( "fx_mp_fumes_haze_md", "amb_exterior_vent", 0, 0, 0, false );
	snd_play_auto_fx ( "fx_mp_fumes_vent_sm", "amb_exterior_vent", 0, 0, 0, false );	
	

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

