//
// file: mp_zoo_fx.gsc
// description: clientside fx script for mp_zoo: setup, special fx functions, etc.
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


// --- FX SECTION ---//
precache_createfx_fx()
{
	level._effect["fx_pipe_steam_md"]                         = loadfx("env/smoke/fx_pipe_steam_md");
	level._effect["fx_mp_fumes_haze_md"]                      = loadfx("maps/mp_maps/fx_mp_fumes_haze_md");
	
	level._effect["fx_mp_berlin_smoke_stack"]			      			= loadfx("maps/mp_maps/fx_mp_berlin_smoke_stack");
	
	level._effect["fx_mp_fog_ground_md"]											= loadfx("maps/mp_maps/fx_mp_fog_ground_md");	
	level._effect["fx_fog_rolling_ground_md"]          				= loadfx("env/smoke/fx_fog_rolling_ground_md_grey");
	level._effect["fx_fog_rolling_ground_md_nrrw"]          	= loadfx("env/smoke/fx_fog_rolling_ground_md_nrrw_grey");		
	level._effect["fx_mp_berlin_fog_int"]			          			= loadfx("maps/mp_maps/fx_mp_fog_xsm_int");
	level._effect["fx_fog_interior_md"]          							= loadfx("env/smoke/fx_fog_interior_md");
	
	level._effect["fx_leaves_falling_lite"]										= loadfx("env/foliage/fx_leaves_falling_lite");
	level._effect["fx_leaves_falling_lite_w"]      						= loadfx("env/foliage/fx_leaves_falling_lite_w_sm");
	level._effect["fx_leaves_ground_windy"]      							= loadfx("env/foliage/fx_leaves_ground_windy");
	level._effect["fx_leaves_ground_windy_narrow"]      			= loadfx("env/foliage/fx_leaves_ground_windy_narrow");	
	level._effect["fx_leaves_ground_windy_short"]      				= loadfx("env/foliage/fx_leaves_ground_windy_short");	
	level._effect["fx_leaves_dust_devil"]      								= loadfx("env/foliage/fx_leaves_dust_devil");	
	
  level._effect["fx_debris_papers"]                         = loadfx("env/debris/fx_debris_papers");
  level._effect["fx_debris_papers_dust_devil2"]      				= loadfx("env/debris/fx_debris_papers_dust_devil2");
  
  level._effect["fx_insects_swarm_md_light"]                = loadfx("bio/insects/fx_insects_swarm_md_light");
  level._effect["fx_insects_roaches_fast"]                	= loadfx("bio/insects/fx_insects_roaches_fast");
  level._effect["fx_insects_moths_light_source"]						= loadfx("bio/insects/fx_insects_moths_light_source");
	level._effect["fx_insects_moths_light_source_md"]					= loadfx("bio/insects/fx_insects_moths_light_source_md");

	level._effect["fx_water_drip_light_long"]									= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_long");	
	level._effect["fx_water_drip_light_short"]								= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_short");	
	
	level._effect["fx_mp_light_dust_motes_md"]								= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
	
	level._effect["fx_mp_elec_spark_burst_sm"]								= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm");
	level._effect["fx_mp_elec_spark_burst_xsm_thin"]					= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin");
	level._effect["fx_elec_burst_oneshot"]										= loadfx("env/electrical/fx_elec_burst_oneshot");	
	
	level._effect["fx_light_tinhat_cage_white"]								= loadfx("env/light/fx_light_tinhat_cage_white");	
//	level._effect["fx_light_office_light_03"]         				= loadfx("env/light/fx_light_office_light_03");
	level._effect["fx_mp_outskirts_floures_glow1"]		    		=	loadfx("maps/mp_maps/fx_mp_outskirts_floures_glow_1");
	level._effect["fx_mp_dlc3_outskirts_tinhat"]		      		=	loadfx("maps/mp_maps/fx_mp_outskirts_spotlight_glow_1");
	level._effect["fx_light_tram_floor_path_lights"]		      =	loadfx("env/light/fx_light_tram_floor_path_lights");	
	level._effect["fx_light_tram_overhead"]		      					=	loadfx("env/light/fx_light_tram_overhead");		
	level._effect["fx_light_stoplight_red_flicker"]		      	=	loadfx("env/light/fx_light_stoplight_red_flicker");
	level._effect["fx_monorail_headlight_flicker"]		      	=	loadfx("vehicle/light/fx_monorail_headlight_flicker");
	level._effect["fx_monorail_headlight_flicker_dim"]		    =	loadfx("vehicle/light/fx_monorail_headlight_flicker_dim");
	level._effect["fx_monorail_headlight_flicker_os"]		    	=	loadfx("vehicle/light/fx_monorail_headlight_flicker_os");		
	level._effect["fx_light_beacon_red"]											= loadfx("env/light/fx_light_beacon_red_sm");
  level._effect["fx_light_beacon_red_distant_slw"]					= loadfx("env/light/fx_light_beacon_red_distant_slw");
  level._effect["fx_light_window_glow_vista"]								= loadfx("env/light/fx_light_window_glow_vista");
  level._effect["fx_light_window_glow_vista_sm"]						= loadfx("env/light/fx_light_window_glow_vista_sm");     	

	level._effect["fx_mp_light_gray_warm_lrg"]								= loadfx("maps/mp_maps/fx_mp_light_gray_warm_lrg");		
	level._effect["fx_mp_light_gray_warm_sm"]									= loadfx("maps/mp_maps/fx_mp_light_gray_warm_sm");		
	level._effect["fx_mp_light_gray_warm_md"]									= loadfx("maps/mp_maps/fx_mp_light_gray_warm_md");

	level._effect["fx_mp_zoo_lightning_runner"]								= loadfx("maps/mp_maps/fx_mp_zoo_lightning_runner");	
	
}

// fx prop anim effects
#using_animtree( "fxanim_props_dlc3" );
precache_fx_prop_anims()
{
	level.zoo_fxanims = [];
	level.zoo_fxanims[ "fxanim_mp_zoo_lights" ] = %fxanim_mp_zoo_lights_anim;
	level.zoo_fxanims[ "fxanim_mp_zoo_drapes" ] = %fxanim_mp_zoo_drapes_anim;
	level.zoo_fxanims[ "fxanim_gp_wirespark_med_anim" ] = %fxanim_gp_wirespark_med_anim;
	level.zoo_fxanims[ "fxanim_gp_wirespark_long_anim" ] = %fxanim_gp_wirespark_long_anim;
	level.zoo_fxanims[ "fxanim_gp_zoo_fish" ] = %fxanim_mp_zoo_fish_01_anim;
	level.zoo_fxanims[ "fxanim_mp_zoo_rail_wire02" ] = %fxanim_mp_zoo_rail_wire02_anim;
	level.zoo_fxanims[ "fxanim_mp_zoo_lights_frnt" ] = %fxanim_mp_zoo_lights_frnt_anim;
	level.zoo_fxanims[ "fxanim_mp_zoo_lights_back" ] = %fxanim_mp_zoo_lights_back_anim;
	level.zoo_fxanims[ "fxanim_gp_chain01" ] = %fxanim_gp_chain01_anim;
	level.zoo_fxanims[ "fxanim_gp_chain02" ] = %fxanim_gp_chain02_anim;
	level.zoo_fxanims[ "fxanim_gp_chain03" ] = %fxanim_gp_chain03_anim;
	level.zoo_fxanims[ "fxanim_mp_zoo_rail_wire01" ] = %fxanim_mp_zoo_rail_wire01_anim;
	level.zoo_fxanims[ "fxanim_mp_zoo_birdnet_ropes" ] = %fxanim_mp_zoo_birdnet_ropes_anim;
	level.zoo_fxanims[ "fxanim_mp_zoo_banner" ] = %fxanim_mp_zoo_banner_anim;

	level.zoo_fx = [];
	level.zoo_fx[ "fx_light_bulb_incandescent" ] = loadfx( "env/light/fx_light_bulb_incandescent" );
	level.zoo_fx[ "fx_elec_spark" ] = loadfx( "env/electrical/fx_elec_wire_spark_burst_xsm" );
	level.zoo_fx[ "fx_light_bulb_incandescent_dim" ] = loadfx( "env/light/fx_light_bulb_incandescent_dim" );

	level.waits = [];
	level.speeds = [];

	for ( i = 0; i < 32; i++ )
	{
		level.waits[ i ] = RandomFloatRange( 0.1, 1.5 );
		level.speeds[ i ] = RandomFloatRange( 0.75, 1.4 );
	}
}

play_fx_prop_anims( localClientNum )
{
	fxanim_lights = GetEntArray( localClientNum, "fxanim_mp_zoo_lights", "targetname" );

	for ( i = 0; i < fxanim_lights.size; i++ )
	{
		fxanim_lights[i] thread fxanim_fx_think( localClientNum, "fxanim_mp_zoo_lights", 1, 1 );
	}

	fxanim_drapes = GetEntArray( localClientNum, "fxanim_mp_zoo_drapes", "targetname" );

	for ( i = 0; i < fxanim_drapes.size; i++ )
	{
		fxanim_drapes[i] thread fxanim_think( localClientNum, "fxanim_mp_zoo_drapes", 1, 1 );
	}

	fxanim_fish = GetEntArray( localClientNum, "fxanim_mp_zoo_fish", "targetname" );

	for ( i = 0; i < fxanim_fish.size; i++ )
	{
		fxanim_fish[i] thread fxanim_think( localClientNum, "fxanim_gp_zoo_fish", level.waits[i], level.speeds[i] );
	}

	fxanim_wires = GetEntArray( localClientNum, "fxanim_wire_spark", "targetname" );

	for ( i = 0; i < fxanim_wires.size; i++ )
	{
		fxanim_wires[i] thread fxanim_wire_think( localClientNum, fxanim_wires[i].script_noteworthy, level.waits[i], level.speeds[i] );
	}

	fxanim_wires = GetEntArray( localClientNum, "fxanim_mp_zoo_rail_wire02", "targetname" ); 

	for ( i = 0; i < fxanim_wires.size; i++ )
	{
		fxanim_wires[i] thread fxanim_wire_think( localClientNum, "fxanim_mp_zoo_rail_wire02", 1, 1 );
	}

	fxanim_wires = GetEntArray( localClientNum, "fxanim_mp_zoo_rail_wire01_mod", "targetname" ); 

	for ( i = 0; i < fxanim_wires.size; i++ )
	{
		fxanim_wires[i] thread fxanim_wire_think( localClientNum, "fxanim_mp_zoo_rail_wire01", 1, 1 );
	}

	fxanim_lights = GetEntArray( localClientNum, "fxanim_mp_zoo_lights_frnt", "targetname" ); 

	for ( i = 0; i < fxanim_wires.size; i++ )
	{
		fxanim_lights[i] thread fxanim_fx_front_think( localClientNum, "fxanim_mp_zoo_lights_frnt", 1, 1 );
	}

	fxanim_lights = GetEntArray( localClientNum, "fxanim_mp_zoo_lights_back", "targetname" ); 

	for ( i = 0; i < fxanim_wires.size; i++ )
	{
		fxanim_lights[i] thread fxanim_fx_back_think( localClientNum, "fxanim_mp_zoo_lights_back", 1, 1 );
	}

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

	fxanim_nets = GetEntArray( localClientNum, "fxanim_mp_zoo_birdnet_ropes_mod", "targetname" ); 

	for ( i = 0; i < fxanim_nets.size; i++ )
	{
		fxanim_nets[i] thread fxanim_think( localClientNum, "fxanim_mp_zoo_birdnet_ropes", 1, 1 );
	}

	fxanim_banners = GetEntArray( localClientNum, "fxanim_mp_zoo_banner", "targetname" ); 

	for ( i = 0; i < fxanim_banners.size; i++ )
	{
		fxanim_banners[i] thread fxanim_think( localClientNum, "fxanim_mp_zoo_banner", level.waits[i], 1 );
	}
}

fxanim_fx_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );

	self waittill_dobj( localClientNum );
	
	self UseAnimTree( #animtree );
	wait( wait_time );

	self SetAnim( level.zoo_fxanims[ anim_index ], 1.0, 0.0, speed );

	for ( i = 1; i < 24; i++ )
	{
		if ( i == 2 || i == 5 || i == 10 || i == 15 || i == 18 || i == 21 )
		{
			continue;
		}

		if ( i == 12 )
		{
			continue;
		}

		name = "bulb_" + i + "_jnt";
		
		if ( i < 10 )
		{
			name = "bulb_0" + i + "_jnt";
		}

		if ( i == 1 || i == 4 || i == 6 || i == 8 || i == 9 || i == 11 || i == 14 || i == 17 || i == 20 || i == 22 )
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, name );
		}
		else
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, name );
		}
	}
}

fxanim_fx_front_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );

	self waittill_dobj( localClientNum );
	
	self UseAnimTree( #animtree );
	wait( wait_time );

	self SetAnim( level.zoo_fxanims[ anim_index ], 1.0, 0.0, speed );

	for ( i = 1; i < 14; i++ )
	{
		if ( i == 1 || i == 3 || i == 8 )
		{
			continue;
		}
		
		name = "line03_b" + i + "_jnt";
		
		if ( i < 10 )
		{
			name = "line03_b0" + i + "_jnt";
		}

		if ( i == 2 || i == 4 || i == 6 || i == 9 || i == 11 || i == 12 )
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, name );
		}
		else
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, name );
		}
	}

	for ( i = 1; i < 12; i++ )
	{
		if ( i == 6 || i == 9 || i == 11 )
		{
			continue;
		}
		
		name = "line04_b" + i + "_jnt";
		
		if ( i < 10 )
		{
			name = "line04_b0" + i + "_jnt";
		}

		if ( i == 2 || i == 5 || i == 8 || i == 10 )
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, name );
		}
		else
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, name );
		}
	}
}

fxanim_fx_back_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );

	self waittill_dobj( localClientNum );
	
	self UseAnimTree( #animtree );
	wait( wait_time );

	self SetAnim( level.zoo_fxanims[ anim_index ], 1.0, 0.0, speed );

	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line05_b01_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line05_b02_jnt" );
	//PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line05_b03_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line05_b04_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line06_b01_jnt" );
	//PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line06_b02_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line06_b03_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line06_b04_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line06_b05_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line06_b06_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line06_b07_jnt" );
	//PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line06_b08_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line06_b09_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line06_b10_jnt" );
	//PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line06_b11_jnt" );
	//PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line07_bulb01_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line07_bulb02_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line07_bulb03_jnt" );
	//PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent" ], self, "line07_bulb04_jnt" );
	PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_light_bulb_incandescent_dim" ], self, "line07_bulb05_jnt" );
}

fxanim_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );

	self waittill_dobj( localClientNum );
	
	self UseAnimTree( #animtree );
	wait( wait_time );

	self SetAnim( level.zoo_fxanims[ anim_index ], 1.0, 0.0, speed );
}

fxanim_wire_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );

	self waittill_dobj( localClientNum );
	
	self UseAnimTree( #animtree );
	wait( wait_time );

	self SetFlaggedAnim( "wire_fx", level.zoo_fxanims[ anim_index ], 1.0, 0.0, speed );

	for ( ;; )
	{
		self waittill( "wire_fx", note );
		//println( "@@@ got note: " + note );

		if ( anim_index == "fxanim_gp_wirespark_long_anim" )
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_elec_spark" ], self, "long_spark_06_jnt" );
		}
		else if ( anim_index == "fxanim_gp_wirespark_med_anim" )
		{
			PlayFxOnTag( localClientNum, level.zoo_fx[ "fx_elec_spark" ], self, "med_spark_06_jnt" );
		}
	}
}

main()
{
	clientscripts\mp\createfx\mp_zoo_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}

	precache_fx_prop_anims();

	waitforclient( 0 );
	wait( 3 );

	players = GetLocalPlayers();

	for ( i = 0; i < players.size; i++ )
	{
		play_fx_prop_anims( i );
	}

}

