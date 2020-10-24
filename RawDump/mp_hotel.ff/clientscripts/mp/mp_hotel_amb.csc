//
// file: mp_hotel_amb.csc
// description: clientside ambient script for mp_hotel: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{

	declareAmbientRoom("outside" );
	//	setAmbientRoomTone ("outside", "amb_wind_gen", 1.5, 1.5);
		setAmbientRoomReverb( "outside", "outdoor", 1, 1 );
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );

	declareAmbientRoom("bathroom" );
		setAmbientRoomTone ("bathroom", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "bathroom", "bathroom", 1, 1 );
		setAmbientRoomContext( "bathroom", "ringoff_plr", "indoor" );

	declareAmbientRoom("diningroom" );
		setAmbientRoomTone ("diningroom", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "diningroom", "largeroom", 1, 1 );
		setAmbientRoomContext( "diningroom", "ringoff_plr", "indoor" );	
		
	declareAmbientRoom("hallway" );
		setAmbientRoomTone ("hallway", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "hallway", "hallway", 1, 1 );
		setAmbientRoomContext( "hallway", "ringoff_plr", "indoor" );	

	declareAmbientRoom("openroom" );
		setAmbientRoomTone ("openroom", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "openroom", "stoneroom", 1, 1 );
		setAmbientRoomContext( "openroom", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("corridor" );
		setAmbientRoomReverb( "corridor", "hotel_stonecorridor", 1, 1 );
		setAmbientRoomContext( "corridor", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("smallroom" );
		setAmbientRoomReverb( "smallroom", "smallroom", 1, 1);
		setAmbientRoomContext( "smallroom", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("tinyroom" );
		setAmbientRoomTone ("tinyroom", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "tinyroom", "jungle_room_small", 1, 1 );
		setAmbientRoomContext( "tinyroom", "ringoff_plr", "indoor" );
		
		
		
		

//new amb rooms	

	declareAmbientRoom("corridor" );
		setAmbientRoomReverb( "corridor", "hotel_stonecorridor", 1, 1 );
		setAmbientRoomContext( "corridor", "ringoff_plr", "indoor" );
	
	declareAmbientRoom("outside" );
		setAmbientRoomReverb( "outside", "hotel_outside", 1, 1 );
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );


	declareAmbientRoom("high_roller" );
		setAmbientRoomTone ("high_roller", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "high_roller", "hotel_high_roller", 1, 1 );
		setAmbientRoomContext( "high_roller", "ringoff_plr", "indoor" );	
		
	declareAmbientRoom("casino" );
		setAmbientRoomTone ("casino", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "casino", "hotel_casino", 1, 1 );
		setAmbientRoomContext( "casino", "ringoff_plr", "indoor" );	

	declareAmbientRoom("main_hall" );
		setAmbientRoomTone ("main_hall", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "main_hall", "hotel_main_hall", 1, 1 );
		setAmbientRoomContext( "main_hall", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("entry" );
		setAmbientRoomTone ("entry", "amb_hotel_int_low", 1, 1);
		setAmbientRoomReverb( "entry", "hotel_entry", 1, 1 );
		setAmbientRoomContext( "entry", "ringoff_plr", "indoor" );
	
	declareAmbientRoom("entry_2" );
		setAmbientRoomTone ("entry_2", "amb_hotel_int_2_low", 1, 1);
		setAmbientRoomReverb( "entry_2", "hotel_entry", 1, 1 );
		setAmbientRoomContext( "entry_2", "ringoff_plr", "indoor" );	
		
		
		
	declareAmbientRoom("stone_room" );
		setAmbientRoomReverb( "stone_room", "hotel_stoneroom", 1, 1 );
		setAmbientRoomContext( "stone_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("poolbar" );
		setAmbientRoomReverb( "poolbar", "hotel_poolbar", 1, 1 );
		setAmbientRoomContext( "poolbar", "ringoff_plr", "outdoor" );

	declareAmbientRoom("stage" );
		setAmbientRoomTone ("entry", "amb_hotel_int_low", 1, 1);
		setAmbientRoomReverb( "stage", "hotel_stage", 1, 1 );
		setAmbientRoomContext( "stage", "ringoff_plr", "outdoor" );
	
	declareAmbientRoom("locker" );
		setAmbientRoomTone ("locker", "amb_roomtone_locker", .2, .3);
		setAmbientRoomReverb( "locker", "hotel_locker", 1, 1 );
		setAmbientRoomContext( "locker", "ringoff_plr", "indoor" );
	
	declareAmbientRoom("locker_outdoor" );
		setAmbientRoomReverb( "locker_outdoor", "hotel_locker_outdoor", 1, 1 );
		setAmbientRoomContext( "locker_outdoor", "ringoff_plr", "outdoor" );		
		
	declareAmbientRoom("lobby_front" );
		setAmbientRoomTone ("lobby_front", "amb_hotel_int_2", 1, 1);
		setAmbientRoomReverb( "lobby_front", "hotel_lobby_front", 1, 1 );
		setAmbientRoomContext( "lobby_front", "ringoff_plr", "indoor" );	
	
	declareAmbientRoom("lobby_rear" );
		setAmbientRoomTone ("lobby_rear", "amb_hotel_int_2", 1, 1);
		setAmbientRoomReverb( "lobby_rear", "hotel_lobby_rear", 1, 1 );
		setAmbientRoomContext( "lobby_rear", "ringoff_plr", "indoor" );	
	
	declareAmbientRoom("upstairs" );
		setAmbientRoomTone ("upstairs", "amb_hotel_int_2", 1, 1);
		setAmbientRoomReverb( "upstairs", "hotel_upstairs", 1, 1 );
		setAmbientRoomContext( "upstairs", "ringoff_plr", "indoor" );		

	declareAmbientRoom("elevador" );
		setAmbientRoomTone ("elevador", "amb_elevator_tone", .4, .4);
		setAmbientRoomReverb( "elevador", "hotel_elevador", 1, 1 );
		setAmbientRoomContext( "elevador", "ringoff_plr", "indoor" );		
		
	declareAmbientRoom("patio" );
		setAmbientRoomTone ("patio", "amb_hotel_int", 1, 1);
		setAmbientRoomReverb( "patio", "hotel_patio", 1, 1 );
		setAmbientRoomContext( "patio", "ringoff_plr", "indoor" );	


	
	thread snd_start_autofx_audio();
	thread snd_play_loopers();
			
	activateAmbientRoom( 0, "outside", 0 );	
}




snd_play_loopers()
{
	//Level loops
	clientscripts\mp\_audio::playloopat( 0, "amb_fire_med", (5545.6, -691.6, 7.1), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (2744.7, 453.4, 316.8), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (2976, 446.9, 315.3), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_flag", (3206, 450, 315), .5 );
	clientscripts\mp\_audio::playloopat( 0, "amb_light_buzz_chandelier", (4607, -666, 328), .5 );	
	
	
}	

snd_start_autofx_audio()
{

	snd_level_play_auto_fx ( "fx_steam_hotel_sauna", "amb_sauna_steam", 0, 0, 0, false );
 	snd_level_play_auto_fx ( "fx_water_faucet_drip_fast", "amb_water_drip", 0, 0, 0, true );
  	snd_level_play_auto_fx ( "fx_insects_swarm_md_light", "amb_flies", 0, 0, 0, false );	    		


  	snd_level_play_auto_fx ( "fx_mp_light_half_globe_hotel", "amb_light_flourescent", 0, 0, 0, false );
  	
  	snd_level_play_auto_fx ( "fx_light_overhead_sm_warm", "amb_light_buzz", 0, 0, 0, false );
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



