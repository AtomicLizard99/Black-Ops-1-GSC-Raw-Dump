//
// file: mp_outskirts_amb.csc
// description: clientside ambient script for mp_outskirts: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{

		declareAmbientRoom( "default" );
			setAmbientRoomTone( "default", "amb_wind_outside", .2, .3 );
			setAmbientRoomReverb( "default", "rv_mpout_outdoor", 1, 1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
		
		declareAmbientRoom( "metal_shed" );
			setAmbientRoomReverb( "metal_shed", "rv_mpout_metal_shed", 1, 1 );
			setAmbientRoomContext( "metal_shed", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "small_room" );
			setAmbientRoomReverb( "small_room", "rv_mpout_livingroom", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "alleyway" );
		  setAmbientRoomTone( "alleyway", "amb_wind_outside", .2, .3 );
			setAmbientRoomReverb( "alleyway", "rv_mpout_alley", 1, 1 );
			setAmbientRoomContext( "alleyway", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "shed" );
			setAmbientRoomReverb( "shed", "rv_mpout_smallroom", 1, 1 );
			setAmbientRoomContext( "shed", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "metal_room" );
			setAmbientRoomReverb( "metal_room", "rv_mpout_fourwall", 1, 1 );
			setAmbientRoomContext( "metal_room", "ringoff_plr", "indoor" );						
			
		declareAmbientRoom( "enclosure" );
		  setAmbientRoomTone( "enclosure", "amb_wind_outside", .2, .3 );
			setAmbientRoomReverb( "enclosure", "rv_mpout_pentagon_heli_tarmac", 1, 1 );
			setAmbientRoomContext( "enclosure", "ringoff_plr", "outdoor" );

		activateAmbientRoom( 0, "default", 0 );
		
		thread snd_start_autofx_audio();
        thread snd_play_loopers ();
}


snd_play_loopers()
{
	//Level loops
	clientscripts\mp\_audio::playloopat( 0, "amb_steam_hiss", (-557, 211, 114), .5 );
	
}	



snd_start_autofx_audio()
{

	snd_level_play_auto_fx ( "fx_mp_outskirts_drip", "amb_water_drip", 0, 0, -0, true );
	snd_level_play_auto_fx ( "fx_water_drip_light_long", "amb_water_drip", 0, 0, 0, true );
	snd_level_play_auto_fx ( "fx_water_drip_light_short", "amb_water_drip", 0, 0, 0, true );	
	    snd_level_play_auto_fx ( "fx_mp_outskirts_floures_glow1", "amb_flourescent", 0, 0, -10, false );
	    snd_level_play_auto_fx ( "fx_mp_dlc3_outskirts_tinhat", "amb_light_buzz", 0, 0, -10, false );
	    snd_level_play_auto_fx ( "fx_mp_outskirts_heatlamp_distortion", "amb_space_heater", 0, 0, -10, false );	
	    snd_level_play_auto_fx ( "fx_fumes_vent_sm_int", "amb_vent", 0, 0, 0, false );		    
	    snd_level_play_auto_fx ( "fx_fumes_vent_xsm_int", "amb_vent", 0, 0, 0, false );

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