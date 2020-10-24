//
// file: mp_discovery_amb.csc
// description: clientside ambient script for mp_discovery: setup ambient sounds, etc.
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
	
		DeclareAmbientRoom ("outside"); 
		SetAmbientRoomtone ("outside", "amb_wind_room_out", 1.5, 1.1);
 		SetAmbientRoomreverb ("outside", "discovery_outside", 1, 1);
 		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
	
		declareAmbientRoom ("corrugated_room");
		Setambientroomtone ("corrugated_room", "amb_wind_room_in", .5, 1);
		Setambientroomreverb ("corrugated_room", "discovery_room_small", 1, 1);
		setAmbientRoomContext( "corrugated_room", "ringoff_plr", "indoor" );
		
		declareAmbientRoom ("open_hangar");
		Setambientroomtone ("open_hangar", "amb_wind_room_heli", .5, 1);
		Setambientroomreverb ("open_hangar", "discovery_steel_hangar", 1, 1);
		setAmbientRoomContext( "open_hangar", "ringoff_plr", "outdoor" );
		
		declareAmbientRoom ("cave");
		Setambientroomtone ("cave", "amb_cave_int", .5, 1);
		Setambientroomreverb ("cave", "discovery_cave", 1, 1);
		setAmbientRoomContext( "cave", "ringoff_plr", "indoor" );
	
		declareAmbientRoom ("under_catwalk");
		Setambientroomtone ("under_catwalk", "amb_wind_room_heli", .5, 1);
		Setambientroomreverb ("under_catwalk", "discovery_overhang", 1, 1);
		setAmbientRoomContext( "under_catwalk", "ringoff_plr", "outdoor" );
	
		declareAmbientRoom ("under_bridge_approach");
		Setambientroomtone ("under_bridge_approach", "amb_wind_room_heli", .5, 1);
		Setambientroomreverb ("under_bridge_approach", "discovery_trench", 1, 1);
		setAmbientRoomContext( "under_bridge_approach", "ringoff_plr", "outdoor" );
	
		declareAmbientRoom ("under_bridge");
		Setambientroomtone ("under_bridge", "amb_wind_room_heli", .5, 1);
		Setambientroomreverb ("under_bridge", "discovery_cave", 1, 1);
		setAmbientRoomContext( "under_bridge", "ringoff_plr", "outdoor" );
	
	
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

//		activateAmbientPackage( 0, "_pkg", 0 );
		activateAmbientRoom( 0, "outside", 0 );		
		
		thread snd_start_autofx_audio();
		thread snd_play_loopers();
	
}
	
snd_play_loopers()
{
	//Level loops
	clientscripts\mp\_audio::playloopat( 0, "amb_snowcat", (-577, 2010, 139), .5 );
}	
		
		
snd_start_autofx_audio()
{
	snd_play_auto_fx ( "fx_mp_elec_spark_burst_xsm_thin", "amb_spark_small");
	snd_play_auto_fx ( "fx_elec_burst_shower_sm_runner", "amb_spark_small");
	snd_play_auto_fx ( "fx_fumes_vent_xsm_int", "amb_steam_hiss_vent", 0, 0, 0, true );
	snd_play_auto_fx ( "fx_fumes_vent_sm_int", "amb_steam_hiss_vent", 0, 0, 0, true );
	snd_play_auto_fx ( "fx_mp_elec_spark_burst_xsm_thin", "amb_spark_small");
	snd_play_auto_fx ( "fx_mp_elec_spark_burst_lg", "amb_spark_small");
	snd_play_auto_fx ( "fx_pipe_steam_md", "amb_steam_hiss");	
	snd_play_auto_fx ( "fx_fumes_vent_xsm_int", "amb_steam_hiss_vent");
	snd_play_auto_fx ( "fx_fumes_vent_sm_int", "amb_steam_hiss_vent");
	snd_play_auto_fx ( "fx_fumes_haze_md", "amb_steam_hiss_vent");
	snd_play_auto_fx ( "fx_water_drip_light_short", "amb_water_drip");
	snd_play_auto_fx ( "fx_fumes_haze_md", "amb_steam_hiss_vent");
	snd_play_auto_fx ( "fx_light_lantern_1", "amb_lantern_close");	

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


