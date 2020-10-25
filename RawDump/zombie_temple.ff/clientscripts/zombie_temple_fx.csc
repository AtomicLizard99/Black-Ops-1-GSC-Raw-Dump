//
// file: zombie_temple_fx.gsc
// description: clientside fx script for zombie_temple: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_fx;
#include clientscripts\_music;

main()
{
	clientscripts\createfx\zombie_temple_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	precache_creek_fx();
	precache_fx_prop_anims();

	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
	//snigl: This is stomping the artist fog setting, and we dont have dogs.
	//level thread dog_start_monitor();
	//level thread dog_stop_monitor();
	//level notify( "dog_stop" ); //DCS: will reset on restart.

// setup the initial fog settings
	level thread cave_fog_off();

	waitforclient( 0 );
	wait( 3 );

	players = GetLocalPlayers();
	for ( i = 0; i < players.size; i++ )
	{
		play_fx_prop_anims( i );
	}

}

// load fx used by util scripts
precache_util_fx()
{	
	level._effect["fx_trail_blood_streak"]			= LoadFx("trail/fx_trail_blood_streak");
	
	//// Client only, not in csv?
	level._effect["eye_glow"]			 			        = LoadFx("misc/fx_zombie_eye_single");
	
	//_zombiemode.csc client only not in csv
	level._effect["headshot"] 						      = LoadFX("impacts/fx_flesh_hit");
	level._effect["headshot_nochunks"] 				  = LoadFX("misc/fx_zombie_bloodsplat");
	level._effect["bloodspurt"] 					      = LoadFX("misc/fx_zombie_bloodspurt");
	level._effect["animscript_gib_fx"] 		 		  = LoadFx("weapon/bullet/fx_flesh_gib_fatal_01"); 
	level._effect["animscript_gibtrail_fx"] 		= LoadFx("trail/fx_trail_blood_streak"); 
}

precache_scripted_fx()
{
	// They're on server
	//level._effect["poltergeist"]					= loadfx("misc/fx_zombie_couch_effect");	
	//level._effect["lght_marker"] 					= Loadfx("maps/zombie/fx_zombie_coast_marker");
	//level._effect["lght_marker_flare"] 	  = Loadfx("maps/zombie/fx_zombie_coast_marker_fl");
	//level._effect["switch_sparks"]				= loadfx("env/electrical/fx_elec_wire_spark_burst");	
	//level._effect["gushing_water"]				= loadfx("env/water/fx_water_pipe_gush_lg");		
	//level._effect["zomb_gib" ]					  = Loadfx( "maps/zombie/fx_zombie_dog_explosion" );

	//napalm zombie footstep
	level._effect["napalm_zombie_footstep"]			= LoadFX( "maps/zombie_temple/fx_ztem_napalm_zombie_ground2" );
	
	//Punji stick dust
	level._effect["punji_dust"]						      = LoadFX("maps/zombie_temple/fx_ztem_dust_punji");
	
	//Maze Wall Fx
	level._effect["maze_wall_impact"]			  = LoadFX("maps/zombie_temple/fx_ztem_dust_impact_maze");
	level._effect["maze_wall_raise"]			  = LoadFX("maps/zombie_temple/fx_ztem_dust_maze_raise");
	
	//Mini Zombie wall hit
	level._effect[ "rag_doll_gib_mini" ]			= loadfx( "maps/zombie_temple/fx_ztem_zombie_mini_squish" );
}


precache_createfx_fx()
{
	level._effect["fx_water_temple_geyser_ready"]		  = loadfx("env/water/fx_water_temple_geyser_ready");	
	level._effect["fx_fire_md"]							          = loadfx("env/fire/fx_fire_md");	
	level._effect["fx_fire_sm"]							          = loadfx("env/fire/fx_fire_sm");
	level._effect["fx_zombie_light_dust_motes_md"]		= loadfx("maps/zombie/fx_zombie_light_dust_motes_md");
	
	level._effect["fx_mp_insects_lantern"]				    = loadfx("maps/zombie/fx_mp_insects_lantern");
	level._effect["fx_dust_crumble_int_md"]				    = loadfx("env/dirt/fx_dust_crumble_int_md");
	
	level._effect["fx_zmb_light_incandescent"]			  = loadfx("maps/zombie/fx_zmb_light_incandescent");
	level._effect["fx_ztem_drips"]						        = loadfx("maps/zombie_temple/fx_ztem_drips");
	
	level._effect["fx_ztem_waterfall_mist"]				    = loadfx("maps/zombie_temple/fx_ztem_waterfall_mist");
	level._effect["fx_ztem_waterfall_mist_trap"]		  = loadfx("maps/zombie_temple/fx_ztem_waterfall_mist_trap");
	level._effect["fx_ztem_leaves_falling"]				    = loadfx("maps/zombie_temple/fx_ztem_leaves_falling");
	level._effect["fx_ztem_leaves_falling_wide"]		  = loadfx("maps/zombie_temple/fx_ztem_leaves_falling_wide");
	level._effect["fx_ztem_dust_motes_blowing_lg"]		= loadfx("maps/zombie_temple/fx_ztem_dust_motes_blowing_lg");
	level._effect["fx_ztem_butterflies"]				      = loadfx("maps/zombie_temple/fx_ztem_butterflies");
	level._effect["fx_ztem_tinhat_indoor"]				    = loadfx("maps/zombie_temple/fx_ztem_tinhat_indoor");
	level._effect["fx_ztem_godray_md"]					      = loadfx("maps/zombie_temple/fx_ztem_godray_md");
	level._effect["fx_ztem_fog_cave"]					        = loadfx("maps/zombie_temple/fx_ztem_fog_cave");
	level._effect["fx_ztem_fog_cave_lg"]				      = loadfx("maps/zombie_temple/fx_ztem_fog_cave_lg");
	level._effect["fx_ztem_fog_cave_drk"]				      = loadfx("maps/zombie_temple/fx_ztem_fog_cave_drk");
	level._effect["fx_ztem_fog_cave_drk2"]				    = loadfx("maps/zombie_temple/fx_ztem_fog_cave_drk2");
	level._effect["fx_ztem_spider"]						        = loadfx("maps/zombie_temple/fx_ztem_spider");
	level._effect["fx_ztem_birds"]						        = loadfx("maps/zombie_temple/fx_ztem_birds");
	level._effect["fx_ztem_fog_outdoor"]				      = loadfx("maps/zombie_temple/fx_ztem_fog_outdoor");
	level._effect["fx_ztem_fog_tunnels"]				      = loadfx("maps/zombie_temple/fx_ztem_fog_tunnels");
	level._effect["fx_ztem_fog_outdoor_lg"]				    = loadfx("maps/zombie_temple/fx_ztem_fog_outdoor_lg");
	level._effect["fx_ztem_power_on"]					        = loadfx("maps/zombie_temple/fx_ztem_power_on");
	level._effect["fx_ztem_power_onb"]					      = loadfx("maps/zombie_temple/fx_ztem_power_onb");
	level._effect["fx_ztem_dragonflies_lg"]				    = loadfx("maps/zombie_temple/fx_ztem_dragonflies_lg");
	
	level._effect["fx_slide_wake"] 						        = LoadFX("bio/player/fx_player_water_swim_wake");
	level._effect["fx_ztem_splash_3"] 					      = LoadFX("maps/zombie_temple/fx_ztem_splash_3");
	level._effect["fx_ztem_splash_4"] 					      = LoadFX("maps/zombie_temple/fx_ztem_splash_4");	
	level._effect["fx_ztem_splash_exploder"] 			    = LoadFX("maps/zombie_temple/fx_ztem_splash_exploder");
	level._effect["fx_ztem_water_wake_exploder"] 		  = LoadFX("maps/zombie_temple/fx_ztem_water_wake_exploder");
	
	level._effect["fx_pow_cave_water_splash_sm"] 		  = LoadFX("maps/pow/fx_pow_cave_water_splash_sm");
	level._effect["fx_ztem_pap"]						          = LoadFX("maps/zombie_temple/fx_ztem_pap");	
	level._effect["fx_ztem_pap_splash"]					      = LoadFX("maps/zombie_temple/fx_ztem_pap_splash");

	level._effect["fx_ztem_water_wake"]					      = loadfx("maps/zombie_temple/fx_ztem_water_wake");
	level._effect["fx_ztem_waterfall_body"]				    = loadfx("maps/zombie_temple/fx_ztem_waterfall_body");
	level._effect["fx_ztem_waterfall_body_b"]				  = loadfx("maps/zombie_temple/fx_ztem_waterfall_body_b");
	level._effect["fx_ztem_waterfall_trap"]				    = loadfx("maps/zombie_temple/fx_ztem_waterfall_trap");
	level._effect["fx_ztem_waterfall_notrap"]			    = loadfx("maps/zombie_temple/fx_ztem_waterfall_notrap");
	level._effect["fx_ztem_waterfall_trap_h"]			    = loadfx("maps/zombie_temple/fx_ztem_waterfall_trap_h");
	level._effect["fx_ztem_waterfall_drips"]			    = loadfx("maps/zombie_temple/fx_ztem_waterfall_drips");
	level._effect["fx_ztem_waterfall_low"]				    = loadfx("maps/zombie_temple/fx_ztem_waterfall_low");
	level._effect["fx_ztem_waterslide_splashes"]		  = loadfx("maps/zombie_temple/fx_ztem_waterslide_splashes");
	level._effect["fx_ztem_waterslide_splashes_wide"]	= loadfx("maps/zombie_temple/fx_ztem_waterslide_splashes_wide");	
	level._effect["fx_ztem_water_troff_power"]			  = loadfx("maps/zombie_temple/fx_ztem_water_troff_power");
	level._effect["fx_ztem_pap_stairs_splashes"]		  = loadfx("maps/zombie_temple/fx_ztem_pap_stairs_splashes");
	level._effect["fx_ztem_spikemore"]		            = loadfx("maps/zombie_temple/fx_ztem_spikemore");
	level._effect["fx_ztem_geyser"]						        = loadfx("maps/zombie_temple/fx_ztem_geyser");
	level._effect["fx_ztem_power_sparks"]				      = loadfx("maps/zombie_temple/fx_ztem_power_sparks");
	level._effect["fx_elec_wire_spark_burst_xsm"]		  = loadfx("env/electrical/fx_elec_wire_spark_burst_xsm");
	level._effect["fx_ztem_smk_ceiling_crawl"]			  = loadfx("maps/zombie_temple/fx_ztem_smk_ceiling_crawl");
	level._effect["fx_ztem_dust_crumble_int_md_runner"]	= loadfx("maps/zombie_temple/fx_ztem_dust_crumble_int_md_runner");
	level._effect["fx_ztem_ember_xsm"]					      = loadfx("maps/zombie_temple/fx_ztem_ember_xsm");
	level._effect["fx_ztem_dust_door_round"]					= loadfx("maps/zombie_temple/fx_ztem_dust_door_round");
	level._effect["fx_ztem_dust_impact_maze"]			    = loadfx("maps/zombie_temple/fx_ztem_dust_impact_maze");
	level._effect["fx_ztem_torch"]			              = loadfx("maps/zombie_temple/fx_ztem_torch");
	level._effect["fx_ztem_geyser_bloom"]			        = loadfx("maps/zombie_temple/fx_ztem_geyser_bloom");
	level._effect["fx_ztem_cart_stop"]			          = loadfx("maps/zombie_temple/fx_ztem_cart_stop");
	level._effect["fx_mp_dlc4_roof_spill"]			      = loadfx("maps/mp_maps/fx_mp_dlc4_roof_spill");	
	
	level._effect["fx_ztem_fountain_splash"]			    = loadfx("maps/zombie_temple/fx_ztem_fountain_splash");	
	level._effect["fx_ztem_waterfall_distort"]			  = loadfx("maps/zombie_temple/fx_ztem_waterfall_distort");	
	level._effect["fx_ztem_waterfall_bottom"]			    = loadfx("maps/zombie_temple/fx_ztem_waterfall_bottom");
	level._effect["fx_ztem_waterfall_b_bottom"]			  = loadfx("maps/zombie_temple/fx_ztem_waterfall_b_bottom");		
	level._effect["fx_ztem_cave_wtr_sld_bttm"]			  = loadfx("maps/zombie_temple/fx_ztem_cave_wtr_sld_bttm");
	level._effect["fx_ztem_pap_warning"]			        = loadfx("maps/zombie_temple/fx_ztem_pap_warning");
	
	level._effect["fx_ztem_dest_wood_barrier"]				= LoadFX("maps/zombie_temple/fx_ztem_dest_wood_barrier");		
	
//easter eggs		
	level._effect["fx_ztem_fireflies"]			          = loadfx("maps/zombie_temple/fx_ztem_fireflies");	
	level._effect["fx_ztem_tunnel_water_gush"]			  = loadfx("maps/zombie_temple/fx_ztem_tunnel_water_gush");
	level._effect["fx_ztem_tunnel_water_splash"]		  = loadfx("maps/zombie_temple/fx_ztem_tunnel_water_splash");
	level._effect["fx_ztem_leak_gas_jet"]		          = loadfx("maps/zombie_temple/fx_ztem_leak_gas_jet");	
	level._effect["fx_ztem_leak_flame_jet_runner"]		= loadfx("maps/zombie_temple/fx_ztem_leak_flame_jet_runner");			
	level._effect["fx_ztem_leak_water_jet_runner"]		= loadfx("maps/zombie_temple/fx_ztem_leak_water_jet_runner");	
	level._effect["fx_ztem_moon_eclipse"]		          = loadfx("maps/zombie_temple/fx_ztem_moon_eclipse");	
	level._effect["fx_ztem_star_shooting_runner"]		  = loadfx("maps/zombie_temple/fx_ztem_star_shooting_runner");
	level._effect["fx_ztem_crystal_hit_success"]		  = loadfx("maps/zombie_temple/fx_ztem_crystal_hit_success");
	level._effect["fx_ztem_crystal_hit_fail"]		      = loadfx("maps/zombie_temple/fx_ztem_crystal_hit_fail");		
	level._effect["fx_ztem_crystal_pause_success"]		= loadfx("maps/zombie_temple/fx_ztem_crystal_pause_success");
	level._effect["fx_ztem_crystal_pause_fail"]		    = loadfx("maps/zombie_temple/fx_ztem_crystal_pause_fail");	
	level._effect["fx_hot_sauce_trail"]						    = loadfx("maps/zombie_temple/fx_ztem_hot_sauce_trail");
	level._effect["fx_weak_sauce_trail"]			        = loadfx("maps/zombie_temple/fx_ztem_weak_sauce_trail");
	level._effect["fx_ztem_meteor_shrink"]			      = loadfx("maps/zombie_temple/fx_ztem_meteor_shrink");	
	level._effect["fx_ztem_hot_sauce_end"]			      = loadfx("maps/zombie_temple/fx_ztem_hot_sauce_end");
	level._effect["fx_ztem_weak_sauce_end"]			      = loadfx("maps/zombie_temple/fx_ztem_weak_sauce_end");	
	level._effect["fx_ztem_meteorite_trail_big"]			= loadfx("maps/zombie_temple/fx_ztem_meteorite_trail_big");
	level._effect["fx_ztem_meteorite_tell"]			      = loadfx("maps/zombie_temple/fx_ztem_meteorite_tell");	
	level._effect["fx_ztem_meteorite_shimmer"]			  = loadfx("maps/zombie_temple/fx_ztem_meteorite_shimmer");	
	level._effect["fx_ztem_meteorite_small_shimmer"]	= loadfx("maps/zombie_temple/fx_ztem_meteorite_small_shimmer");		
	level._effect["fx_ztem_meteorite_big_shimmer"]	  = loadfx("maps/zombie_temple/fx_ztem_meteorite_big_shimmer");					
	level._effect["fx_crystal_water_trail"]						= LoadFX("maps/zombie_temple/fx_ztem_meteorite_splash_run");
					
	
//weapon fx	
//	level._effect["fx_trail_crossbow_blink_grn_os"]	  = loadfx("weapon/crossbow/fx_trail_crossbow_blink_grn_os");																												
//	level._effect["fx_trail_crossbow_blink_red_os"]	  = loadfx("weapon/crossbow/fx_trail_crossbow_blink_red_os");		
																					
}
precache_creek_fx(){
	level._effect["fx_insect_swarm_lg"]					      = loadfx("maps/creek/fx_insect_swarm_lg");
	level._effect["fx_insect_swarm"]					        = loadfx("maps/creek/fx_insect_swarm");
	level._effect["fx_ztem_smoke_thick_indoor"]			  = loadfx("maps/zombie_temple/fx_ztem_smoke_thick_indoor");
}
/*
precache_waterslide_fx()
{
	level._effect["fx_slide_wake"] 					= LoadFX("bio/player/fx_player_water_swim_wake");	// looping
	level._effect["fx_slide_splash"]				= LoadFX("bio/player/fx_player_water_splash");		// one-shot
	level._effect["fx_slide_splash_2"]				= LoadFX("env/water/fx_water_splash_fountain_lg");	// looping
	level._effect["fx_ztem_splash_3"] 				= LoadFX("maps/pow/fx_pow_cave_water_splash");		// looping
	level._effect["fx_slide_water_fall"]			= LoadFX("maps/pow/fx_pow_cave_water_fall");		// looping
}

precache_minecart_fx()
{
	level._effect["fx_headlight"]  				= LoadFx("env/light/fx_flashlight_ai_spotlight");
//	level._effect["fx_spark_wheel"]			  	= LoadFx("env/electrical/fx_elec_wire_spark_dl_oneshot");
}

precache_zombie_temple_monkey_ai()
{
	level._effect["monkey_death"] 			= loadfx("maps/zombie/fx_zmb_monkey_death");
	level._effect["monkey_spawn"] 			= Loadfx("maps/zombie/fx_zombie_ape_spawn_dust");
	level._effect["monkey_eye_glow"]		= LLoadFx( "maps/zombie/fx_zmb_monkey_eyes" ); 
}


Zombie Temple Powerups
level._effect["zombie_kill"] = LoadFX("impacts/fx_flesh_hit_body_fatal_lg_exit_mp");
*/



// Pulls the fog in - Devil Dogs

dog_start_monitor()
{
	while( 1 )
	{
		level waittill( "dog_start" );

	start_dist = 0;
	half_dist = 302.622;
	half_height = 306.395;
	base_height = 344.622;
	fog_r = 0.501961;
	fog_g = 0.286275;
	fog_b = 0.227451;
	fog_scale = 1.20564;
	sun_col_r = 0.243137;
	sun_col_g = 0.270588;
	sun_col_b = 0.270588;
	sun_dir_x = 0.291692;
	sun_dir_y = -0.720765;
	sun_dir_z = 0.628819;
	sun_start_ang = 0;
	sun_stop_ang = 0;
	time = 7;
	max_fog_opacity = 0.65;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);

	}
}


//
// Pushes fog out - Devil Dogs

dog_stop_monitor()
{
	while( 1 )
	{
		level waittill( "dog_stop" );

	level.tweakfile = true;
	start_dist = 888.062;
	half_dist = 2714.58;
	half_height = 2242.93;
	base_height = 4338.83;
	fog_r = 0.266667;
	fog_g = 0.14902;
	fog_b = 0.0705882;
	fog_scale = 2.84504;
	sun_col_r = 0.901961;
	sun_col_g = 0.427451;
	sun_col_b = 0.156863;
	sun_dir_x = -0.854245;
	sun_dir_y = 0.337731;
	sun_dir_z = 0.395225;
	sun_start_ang = 20;
	sun_stop_ang = 99;
	time = 3;
	max_fog_opacity = 0.734468;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);;
	}
}

// Sets interior fog eclipse

eclipse_fog_on()
{
		start_dist = 151.622;
		half_dist = 136.124;
		half_height = 392.122;
		base_height = -626.865;
		fog_r = 0.168627;
		fog_g = 0.168627;
		fog_b = 0.168627;
		fog_scale = 4.39448;
		sun_col_r = 0.376471;
		sun_col_g = 0.470588;
		sun_col_b = 0.513726;
		sun_dir_x = -0.893398;
		sun_dir_y = -0.219239;
		sun_dir_z = 0.392141;
		sun_start_ang = 11.4807;
		sun_stop_ang = 88.2474;
		time = 0;
		max_fog_opacity = 0.593122;
	
		setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
			sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
			sun_stop_ang, time, max_fog_opacity);
		

}

// Interior Cave fog (non-eclipse)

cave_fog_on()
{
	level.tweakfile = true;
	start_dist = 683.36;
	half_dist = 2628.91;
	half_height = 1277.89;
	base_height = 1540.34;
	fog_r = 0.345098;
	fog_g = 0.47451;
	fog_b = 0.541176;
	fog_scale = 4.0001;
	sun_col_r = 0.301961;
	sun_col_g = 0.380392;
	sun_col_b = 0.427451;
	sun_dir_x = -0.889059;
	sun_dir_y = 0.215284;
	sun_dir_z = 0.404014;
	sun_start_ang = 11.4807;
	sun_stop_ang = 37.3192;
	time = 5;
	max_fog_opacity = 0.369586;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);



	SetDvar("r_exposureTweak", "1");
	SetDvar("r_exposureValue", "1.15");
}

// Exterior Fog Setting (stomps anything in art.gsc)

cave_fog_off()
{
	level.tweakfile = true;	
	start_dist = 151.081;
  half_dist = 526.479;
  half_height = 461.457;
  base_height = -652.425;
  fog_r = 0.0784314;
  fog_g = 0.129412;
  fog_b = 0.105882;
  fog_scale = 5.97369;
  sun_col_r = 1;
  sun_col_g = 0.380392;
  sun_col_b = 0.109804;
  sun_dir_x = -0.893398;
  sun_dir_y = -0.219239;
  sun_dir_z = 0.392141;
  sun_start_ang = 11.4807;
  sun_stop_ang = 94.7812;
  time = 5;
  max_fog_opacity = 0.604413;

  setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
    sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
    sun_stop_ang, time, max_fog_opacity);


	SetDvar("r_exposureTweak", "1");
	SetDvar("r_exposureValue", "1.1");
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#using_animtree("fxanim_props"); 
precache_fx_prop_anims()
{
	level._fxanims = [];
	//level._fxanims[ "fxanim_gp_wirespark_med_anim" ] = %fxanim_gp_wirespark_med_anim;
	//level._fxanims[ "fxanim_gp_wirespark_long_anim" ] = %fxanim_gp_wirespark_long_anim;
	level._fxanims[ "fxanim_gp_chain01" ] = %fxanim_gp_chain01_anim;
	level._fxanims[ "fxanim_gp_chain02" ] = %fxanim_gp_chain02_anim;
	level._fxanims[ "fxanim_gp_chain03" ] = %fxanim_gp_chain03_anim;

	level.waits = [];
	level.speeds = [];

	for ( i = 0; i < 32; i++ )
	{
		level.waits[ i ] = RandomFloatRange( 0.1, 1.5 );
		level.speeds[ i ] = RandomFloatRange( 0.75, 1.4 );
	}
}

play_fx_prop_anims(localClientNum)
{
	fxanim_chains = GetEntArray( localClientNum, "fxanim_gp_chain01_mod", "targetname" ); 

	for ( i = 0; i < fxanim_chains.size; i++ )
	{
		fxanim_chains[i] thread fxanim_think( localClientNum, "fxanim_gp_chain01", 1, 1 );
	}

	fxanim_chains = GetEntArray( localClientNum, "fxanim_gp_chain02_mod", "targetname" ); 

	for ( i = 0; i < fxanim_chains.size; i++ )
	{
		fxanim_chains[i] thread fxanim_think( localClientNum, "fxanim_gp_chain02", 1, 1 );
	}

	fxanim_chains = GetEntArray( localClientNum, "fxanim_gp_chain03_mod", "targetname" ); 

	for ( i = 0; i < fxanim_chains.size; i++ )
	{
		fxanim_chains[i] thread fxanim_think( localClientNum, "fxanim_gp_chain03", level.waits[i], 1 );
	}
}

fxanim_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );

	self waittill_dobj( localClientNum );
	
	self UseAnimTree( #animtree );
	wait( wait_time );

	self SetAnim( level._fxanims[ anim_index ], 1.0, 0.0, speed );
}

waittill_dobj(localClientNum)
{
	while( isdefined( self ) && !(self hasdobj(localClientNum)) )
	{
		wait(0.01);
	}
}

