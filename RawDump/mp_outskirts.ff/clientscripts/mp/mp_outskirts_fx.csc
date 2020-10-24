#include clientscripts\mp\_utility; 
precache_fx()
{

	level._effect["fx_mp_light_dust_motes_md"]							= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");

	level._effect["fx_mp_smk_building_chimney_blk"]					= loadfx("maps/mp_maps/fx_mp_smk_building_chimney_blk");
	level._effect["fx_smk_plume_md_wht_wispy"]							= loadfx("maps/mp_maps/fx_mp_smk_plume_md_wht_wispy");
	level._effect["fx_smk_plume_md_wht_wispy_sm"]						= loadfx("maps/mp_maps/fx_mp_smk_plume_md_wht_wispy_sm");
	level._effect["fx_smk_linger_lit"]											= loadfx("maps/mp_maps/fx_mp_smk_linger_light");
//	level._effect["fx_mp_outskirts_smk_vent"]				        =	loadfx("maps/mp_maps/fx_mp_outskirts_smk_vent");
	level._effect["fx_pipe_steam_md"]					            	=	loadfx("env/smoke/fx_pipe_steam_md");
//	level._effect["fx_mp_outskirts_fumes_haze"]     				=	loadfx("maps/mp_maps/fx_mp_outskirts_fumes_haze");
	level._effect["fx_fumes_vent_xsm_int"]									= loadfx("maps/mp_maps/fx_mp_fumes_vent_xsm_int");
	level._effect["fx_fumes_vent_sm_int"]										= loadfx("maps/mp_maps/fx_mp_fumes_vent_sm_int");

	level._effect["fx_water_drip_light_long"]								= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_long");	
	level._effect["fx_water_drip_light_short"]							= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_short");	
	level._effect["fx_mp_oil_drip_short"]										= loadfx("maps/mp_maps/fx_mp_oil_drip_sngl");	
	
	level._effect["fx_mp_snow_gust_street"]						  		= loadfx("maps/mp_maps/fx_mp_snow_gust_street_fast");	
  level._effect["fx_mp_snow_gust_street_sml"]							= loadfx("maps/mp_maps/fx_mp_snow_gust_street_fast_sm");
//  level._effect["fx_mp_berlin_snow_gust_door"]						= loadfx("maps/mp_maps/fx_mp_berlin_snow_gust_door");
  level._effect["fx_mp_snow_gust_rooftop_slow"]						= loadfx("maps/mp_maps/fx_mp_snow_gust_rooftop_slow");
  level._effect["fx_mp_snow_gust_rooftop_oo_slow"]				= loadfx("maps/mp_maps/fx_mp_snow_gust_rooftop_oo_slow");
//  level._effect["fx_mp_snow_gust_rooftop_oo_slow_thin"]		= loadfx("maps/mp_maps/fx_mp_snow_gust_rooftop_oo_slow_thin");
  level._effect["fx_mp_snow_gust_rooftop_xsm_slow"]				= loadfx("maps/mp_maps/fx_mp_snow_gust_rooftop_xsm_slow"); 
  level._effect["fx_mp_snow_gust_rooftop_lg_slow_distant"]= loadfx("maps/mp_maps/fx_mp_snow_gust_rooftop_lg_slow_distant");  

	level._effect["fx_mp_leaves_falling"]						        =	loadfx("maps/mp_maps/fx_mp_leaves_falling");
	level._effect["fx_debris_papers"]						            =	loadfx("env/debris/fx_debris_papers");
	level._effect["fx_debris_papers_narrow"]						    =	loadfx("env/debris/fx_debris_papers_narrow");
	
//	level._effect["fx_mp_rvn_leaves_falling"]			        	=	loadfx("maps/mp_maps/fx_mp_rvn_leaves_falling");
//	level._effect["fx_mp_outskirts_leaves_blowing"]		    	=	loadfx("maps/mp_maps/fx_mp_outskirts_leaves_blowing");

	level._effect["fx_mp_elec_spark_burst_sm"]				      =	loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm");

//	level._effect["fx_mp_outskirts_fog"]					          =	loadfx("maps/mp_maps/fx_mp_outskirts_fog");
//	level._effect["fx_mp_outskirts_interior_fog"]		      	=	loadfx("maps/mp_maps/fx_mp_outskirts_interior_fog");
	level._effect["fx_mp_berlin_fog_int"]			          		= loadfx("maps/mp_maps/fx_mp_berlin_fog_int");

	level._effect["fx_mp_dlc3_outskirts_tinhat"]		      	=	loadfx("maps/mp_maps/fx_mp_outskirts_spotlight_glow_1");
//	level._effect["fx_mp_dlc3_outskirts_tinhat_indoor"]		  =	loadfx("maps/mp_maps/fx_mp_dlc3_outskirts_tinhat_indoor");
	level._effect["fx_mp_outskirts_floures_glow1"]		    	=	loadfx("maps/mp_maps/fx_mp_outskirts_floures_glow_1");	
	level._effect["fx_mp_outskirts_floures_glow2"]		    	=	loadfx("maps/mp_maps/fx_mp_outskirts_floures_glow_2");	

	level._effect["fx_mp_outskirts_godray_md"]		        	=	loadfx("maps/mp_maps/fx_mp_outskirts_gray_md");	
	level._effect["fx_mp_outskirts_godray_md_long"]		    	=	loadfx("maps/mp_maps/fx_mp_outskirts_gray_md_long");	
//	level._effect["fx_mp_outskirts_godray_md_long_wide"]		=	loadfx("maps/mp_maps/fx_mp_outskirts_gray_md_long_wide");
	level._effect["fx_mp_outskirts_gray_md_long_distant"]		=	loadfx("maps/mp_maps/fx_mp_outskirts_gray_md_long_distant");	
	level._effect["fx_mp_outskirts_godray_md_short"]		   	=	loadfx("maps/mp_maps/fx_mp_outskirts_gray_md_short");
	level._effect["fx_mp_light_ray_wht_ribbon_sm"]		   		=	loadfx("maps/mp_maps/fx_mp_light_ray_wht_ribbon_sm");	

	level._effect["fx_mp_outskirts_heatlamp_distortion"]	 	=	loadfx("maps/mp_maps/fx_mp_distortion_heat_lamp");	
	
	// Door FX
	level._effect["fx_mp_outskirts_door_light_red"]	 				=	loadfx("maps/mp_maps/fx_mp_outskirts_door_light_red");
	level._effect["fx_mp_outskirts_door_light_green"]	 			=	loadfx("maps/mp_maps/fx_mp_outskirts_door_light_green");	
	level._effect["fx_mp_outskirts_door_snow_impact"]	 			=	loadfx("maps/mp_maps/fx_mp_outskirts_door_snow_impact");	

}

// fx prop anim effects
#using_animtree( "fxanim_props_dlc3" );
precache_fx_prop_anims()
{
	level.outskirts_fxanims = [];
	level.outskirts_fxanims[ "fxanim_mp_oildigger" ] = %fxanim_mp_oildigger_anim;
	level.outskirts_fxanims[ "fxanim_mp_roofvent" ] = %fxanim_mp_roofvent_snow_anim;
	level.outskirts_fxanims[ "fxanim_mp_os_pully_anim" ] = %fxanim_mp_os_pully_anim;
	level.outskirts_fxanims[ "fxanim_mp_os_contrl_wire_anim" ] = %fxanim_mp_os_contrl_wire_anim;
	level.outskirts_fxanims[ "fxanim_mp_os_light_hang" ] = %fxanim_mp_os_light_hang_anim;
	level.outskirts_fxanims[ "fxanim_mp_os_sign_red_anim" ] = %fxanim_mp_os_sign_red_anim;
	level.outskirts_fxanims[ "fxanim_mp_os_sign_yellow_anim" ] = %fxanim_mp_os_sign_yellow_anim;
	
	level.waits = [];
	level.speeds = [];

	for ( i = 0; i < 10; i++ )
	{
		level.waits[ i ] = RandomFloatRange( 0.1, 1 );
		level.speeds[ i ] = RandomFloatRange( 0.75, 1.4 );
	}
}

play_fx_prop_anims( localClientNum )
{
	fxanim_oildiggers = GetEntArray( localClientNum, "fxanim_mp_oildigger", "targetname" );

	for ( i = 0; i < fxanim_oildiggers.size; i++ )
	{
		fxanim_oildiggers[i] thread fxanim_think( localClientNum, "fxanim_mp_oildigger", level.waits[i], level.speeds[i] );
	}

	fxanim_vents = GetEntArray( localClientNum, "fxanim_mp_roofvent_snow_mod", "targetname" );

	for ( i = 0; i < fxanim_vents.size; i++ )
	{
		fxanim_vents[i] thread fxanim_think( localClientNum, "fxanim_mp_roofvent", level.waits[i], level.speeds[i] );
	}

	fxanims = GetEntArray( localClientNum, "fxanim_mp_outskirts", "targetname" );

	for ( i = 0; i < fxanims.size; i++ )
	{
		fxanims[i] thread fxanim_think( localClientNum, fxanims[i].script_noteworthy, 1, 1 );
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

	self SetAnim( level.outskirts_fxanims[ anim_index ], 1.0, 0.0, speed );
}

main()
{
	clientscripts\mp\createfx\mp_outskirts_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	precache_fx();
	/* for scripted FX */
	/*
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
	*/

	precache_fx_prop_anims();

	waitforclient( 0 );
	wait( 3 );

	players = GetLocalPlayers();

	for ( i = 0; i < players.size; i++ )
	{
		play_fx_prop_anims( i );
	}
}
