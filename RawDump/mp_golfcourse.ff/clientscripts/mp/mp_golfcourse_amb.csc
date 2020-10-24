//
// file: mp_golfcourse_amb.csc
// description: clientside ambient script for mp_golfcourse: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	
	
	declareAmbientRoom("outside" );
		setAmbientRoomReverb( "outside", "golfcourse_outside", 1, 1 );
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
	
	declareAmbientRoom("bar_room" );
		setAmbientRoomReverb( "bar_room", "golfcourse_bar_room", 1, 1 );
		setAmbientRoomContext( "bar_room", "ringoff_plr", "indoor" );	
		
		
	declareAmbientRoom("patio_room" );
		setAmbientRoomReverb( "patio_room", "golfcourse_patio_room", 1, 1 );
		setAmbientRoomContext( "patio_room", "ringoff_plr", "indoor" );
	
	
	declareAmbientRoom("proshop_room" );
		setAmbientRoomReverb( "proshop_room", "golfcourse_proshop_room", 1, 1 );
		setAmbientRoomContext( "proshop_room", "ringoff_plr", "indoor" );	
	
	
	declareAmbientRoom("bridge_room" );
		setAmbientRoomReverb( "bridge_room", "golfcourse_bridge_room", 1, 1 );
		setAmbientRoomContext( "bridge_room", "ringoff_plr", "outdoor" );
	
		
	declareAmbientRoom("shop_room" );
		setAmbientRoomReverb( "shop_room", "golfcourse_shop_room", 1, 1 );
		setAmbientRoomContext( "shop_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("gear_room" );
		setAmbientRoomReverb( "gear_room", "golfcourse_gear_room", 1, 1 );
		setAmbientRoomContext( "gear_room", "ringoff_plr", "indoor" );
		
		
	declareAmbientRoom("gaz_room" );
		setAmbientRoomReverb( "gaz_room", "golfcourse_gaz_room", 1, 1 );
		setAmbientRoomContext( "gaz_room", "ringoff_plr", "outdoor" );
		
		
	declareAmbientRoom("cove_room" );
		setAmbientRoomReverb( "cove_room", "golfcourse_cove_room", 1, 1 );
		setAmbientRoomContext( "cove_room", "ringoff_plr", "outdoor" );	
		
		
	activateAmbientRoom( 0, "outside", 0 );			
		
		thread snd_start_autofx_audio();
		thread snd_play_loopers();	

}
 

snd_play_loopers()
{
	clientscripts\mp\_audio::playloopat( 0, "amb_waterfall_high", (1067, 551, -214), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-1907, 639, 311), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (-2014, 652, 311), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_ac", (-3458, -1318, 192), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_ac", (-4780, 182, -17), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_fan_blower", (-4017, -1214, 191), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_fan_blower", (-3561, -1435, 191), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_fan_blower", (-1416, 993, -54), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_fan_blower", (-929, 1064, -68), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_fan_blower", (-4563, 912, -44), .5 );
	
}	



snd_start_autofx_audio()
{

	snd_level_play_auto_fx ( "fx_water_drip_light_short", "amb_water_drip", 0, 0, 0, true );
	snd_level_play_auto_fx ( "fx_light_overhead_sm_warm", "amb_light_buzz", 0, 0, 0, true );
	
	snd_level_play_auto_fx ( "fx_insects_swarm_md_light", "amb_flies", 0, 0, 0, true );
	

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