//
// file: mp_discovery_fx.gsc
// description: clientside fx script for mp_discovery: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 

// load fx used by util scripts
precache_util_fx()
{	

}

precache_scripted_fx()
{
}


// --- FX'S SECTION ---//
precache_createfx_fx()
{

	level._effect["fx_mp_discovery_aurore"] 							= loadfx("maps/mp_maps/fx_mp_discovery_aurore2");
	level._effect["fx_mp_discovery_aurore_cloud"] 				= loadfx("maps/mp_maps/fx_mp_discovery_aurore_cloud");

	level._effect["fx_mp_snow_gust_rooftop"] 							= loadfx("maps/mp_maps/fx_mp_snow_gust_rooftop_oo");
	level._effect["fx_mp_snow_gust_rooftop_oo_thin"] 			= loadfx("maps/mp_maps/fx_mp_snow_gust_rooftop_oo_thin");
	level._effect["fx_mp_snow_gust_ground_lg"] 						= loadfx("maps/mp_maps/fx_mp_snow_gust_ground_lg");
	level._effect["fx_mp_snow_gust_ground_lg_thin"] 			= loadfx("maps/mp_maps/fx_mp_snow_gust_ground_lg_thin");
	level._effect["fx_mp_snow_gust_ground_lg_oo"] 				= loadfx("maps/mp_maps/fx_mp_snow_gust_ground_lg_oo");
	level._effect["fx_mp_snow_gust_ground_lg_thin_oo"] 		= loadfx("maps/mp_maps/fx_mp_snow_gust_ground_lg_thin_oo");
	level._effect["fx_mp_snow_gust_ground_sm_os"] 				= loadfx("maps/mp_maps/fx_mp_snow_gust_ground_sm_fast_os");
	level._effect["fx_mp_snow_gust_door_low"] 						= loadfx("maps/mp_maps/fx_mp_snow_gust_door_low_no_snow");

	level._effect["fx_mp_snow_wall_hvy_loop_sm"] 					= loadfx("maps/mp_maps/fx_mp_snow_wall_hvy_loop_sm_oo");
	
	level._effect["fx_mp_elec_spark_burst_xsm_thin"]			= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin");
	
	level._effect["fx_pipe_steam_md"] 										= loadfx("env/smoke/fx_pipe_steam_md");
	level._effect["fx_fumes_vent_xsm_int"]								= loadfx("maps/mp_maps/fx_mp_fumes_vent_xsm_int");
	level._effect["fx_fumes_vent_sm_int"]									= loadfx("maps/mp_maps/fx_mp_fumes_vent_sm_int");
	
	level._effect["fx_fog_interior_md"]          					= loadfx("env/smoke/fx_fog_interior_md");
	level._effect["fx_snow_falling_ceiling"] 							= loadfx("maps/mp_maps/fx_mp_snow_falling_ceiling");	
	level._effect["fx_truck_headlight"] 					    		= loadfx("maps/mp_maps/fx_mp_headlight_truck");	
  level._effect["fx_snow_swirl_ambience"] 				   		= loadfx("maps/mp_maps/fx_mp_snow_gust_swirl_amb");	
  level._effect["fx_snow_puff"] 				            		= loadfx("maps/mp_maps/fx_mp_snow_puff");	
  level._effect["fx_spotlight_1"] 				            	= loadfx("maps/mp_maps/fx_mp_light_spot_1");	
  level._effect["fx_light_lantern_1"] 				         	= loadfx("maps/mp_maps/fx_mp_light_lantern_1");	  
  level._effect["fx_smoke_exhaust_truck"] 				     	= loadfx("maps/mp_maps/fx_mp_smk_exhaust_1");	 
  level._effect["fx_distortion_heat_truck"] 				   	= loadfx("maps/mp_maps/fx_mp_distortion_heat_engine");	
  level._effect["fx_distortion_heat_lamp"] 				    	= loadfx("maps/mp_maps/fx_mp_distortion_heat_lamp");
  level._effect["fx_smoke_exhaust_generator"] 		     	= loadfx("maps/mp_maps/fx_mp_smk_exhaust_2");	 
  level._effect["fx_smoke_clouds_distant"] 				     	= loadfx("maps/mp_maps/fx_mp_discovery_distant_clouds2");	   	        
  level._effect["fx_smoke_clouds_distant2"] 				   	= loadfx("maps/mp_maps/fx_mp_discovery_distant_clouds3");
  	
		
// Exploders for Ice falling
	level._effect["fx_mp_snow_wall_lg_os"] 								= loadfx("maps/mp_maps/fx_mp_snow_wall_lg_os");
	

}

// fx prop anim effects
#using_animtree( "fxanim_props_dlc2" );
precache_fx_prop_anims()
{
	level.discovery_fxanims = [];
	level.discovery_fxanims["icebridge01_back_anim"] = %fxanim_mp_icebridge01_back_anim;
	level.discovery_fxanims["icebridge01_front_anim"] = %fxanim_mp_icebridge01_front_anim;
	level.discovery_fxanims["icebridge02_anim"] = %fxanim_mp_icebridge02_anim;
	level.discovery_fxanims["icebridge03_anim"] = %fxanim_mp_icebridge03_anim;
	level.discovery_fxanims["icebridge04_anim"] = %fxanim_mp_icebridge04_anim;
	level.discovery_fxanims["icebridge05_anim"] = %fxanim_mp_icebridge05_anim;
}

play_fx_prop_anims( localClientNum )
{
	dynamic_paths = GetEntArray( localClientNum, "dynamic_path_client", "targetname" );
	array_thread( dynamic_paths, ::fxanim_think, localClientNum );

	if ( IsDemoPlaying() )
	{
		array_thread( dynamic_paths, ::fxanim_demo_think, localClientNum );
	}

/#
	for ( ;; )
	{
		level waittill( "dynamic_path_reset" );
		wait( 0.1 );

		array_thread( dynamic_paths, ::fxanim_think, localClientNum );
	}
#/
}

fxanim_think( localClientNum )
{
	//self endon( "death" );
	//self endon( "entityshutdown" );
	//self endon( "delete" );

	remove = true;

/#
	level endon( "dynamic_path_reset" );
	remove = false;
#/

	if ( IsDemoPlaying() )
	{
		self endon( "demo_reset" );
		remove = false;
		self.destroy_time = -1;
	}

	if ( !IsDefined( self.script_noteworthy ) )
	{
		return;
	}

	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );

	anim_length = GetAnimLength( level.discovery_fxanims[ self.script_noteworthy ] );
	anim_rate = 1.0;

	event = level waittill_any_return( self.script_noteworthy, self.script_noteworthy + "_delete" );

	if ( event == self.script_noteworthy )
	{
		if ( IsDemoPlaying() )
		{
			self.destroy_time = level.serverTime;
		}

		if ( IsDefined( self.script_fxid ) )
		{
			clientscripts\mp\_fx::exploder( localClientNum, Int( self.script_fxid ) );
		}

		self SetAnimRestart( level.discovery_fxanims[ self.script_noteworthy ], 1.0, 0.0, anim_rate );
		wait( anim_length / anim_rate );
	}

	if ( remove )
	{
		self delete();
	}
}

fxanim_demo_think( localClientNum )
{
	for ( ;; )
	{
		level waittill( "demo_jump" + localClientNum, time ); 

		if ( time < self.destroy_time )
		{
			self notify( "demo_reset" );
			self ClearAnim( level.discovery_fxanims[ self.script_noteworthy ], 0 );
			self thread fxanim_think( localClientNum );
		}
	}
}

main()
{
	clientscripts\mp\createfx\mp_discovery_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}

	precache_fx_prop_anims();
	
	waitforclient(0);

	players = GetLocalPlayers();

	for ( i = 0; i < players.size; i++ )
	{
		play_fx_prop_anims( i );
	}
}

