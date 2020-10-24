//
// file: mp_hotel_fx.gsc
// description: clientside fx script for mp_hotel: setup, special fx functions, etc.
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

	level._effect["fx_mp_hotel_fountain_splash_sm"] 					= Loadfx("maps/mp_maps/fx_mp_hotel_fountain_splash_sm");
	level._effect["fx_mp_hotel_fountain_splash_xsm"] 					= Loadfx("maps/mp_maps/fx_mp_hotel_fountain_splash_xsm");	
//	level._effect["fx_mp_hotel_fountain_splash01"] 						= Loadfx("maps/mp_maps/fx_mp_hotel_fountain_splash01");
	level._effect["fx_mp_hotel_fountain_splash02"] 						= Loadfx("maps/mp_maps/fx_mp_hotel_fountain_splash02");
//	level._effect["fx_water_splash_fountain_lg"]              = loadfx("env/water/fx_water_splash_fountain_lg2");
//  level._effect["fx_water_splash_fountain"]             		= loadfx("env/water/fx_water_splash_fountain");
  level._effect["fx_water_jacuzzi_surface"]             		= loadfx("env/water/fx_water_jacuzzi_surface");  
  level._effect["fx_water_jacuzzi_surface_steam"]           = loadfx("env/water/fx_water_jacuzzi_surface_steam");	
  level._effect["fx_steam_hotel_sauna"]           					= loadfx("env/smoke/fx_steam_hotel_sauna");		
  level._effect["fx_steam_hotel_sauna_door"]           			= loadfx("env/smoke/fx_steam_hotel_sauna_door");
  level._effect["fx_water_pool_drain"]           						= loadfx("env/water/fx_water_pool_drain");
  
  level._effect["fx_smk_smolder_sm"]												= loadfx("maps/mp_maps/fx_mp_smk_smolder_rubble_sm");
  level._effect["fx_mp_fumes_vent_sm_int"]									= loadfx("maps/mp_maps/fx_mp_fumes_vent_sm_int");
	level._effect["fx_mp_fumes_vent_xsm_int"]									= loadfx("maps/mp_maps/fx_mp_fumes_vent_xsm_int");
	level._effect["fx_distortion_heat_truck"] 								= loadfx("maps/mp_maps/fx_mp_distortion_transformer"); 	
	
	level._effect["fx_mp_light_dust_motes_md"]								= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
	level._effect["fx_dust_crumble_int_sm"]										= loadfx("env/dirt/fx_dust_crumble_int_sm");
	level._effect["fx_dust_crumble_int_md"]										= loadfx("env/dirt/fx_dust_crumble_int_md");
	
	level._effect["fx_insects_swarm_md_light"]								= loadfx("bio/insects/fx_insects_swarm_md_light");
	
	level._effect["fx_fire_sm"]																= loadfx("env/fire/fx_fire_sm");	
	
//	level._effect["fx_light_beacon_red"]											= loadfx("env/light/fx_light_beacon_red_sm");
//  level._effect["fx_light_beacon_red_distant_slw"]					= loadfx("env/light/fx_light_beacon_red_distant_slw");
//  level._effect["fx_mp_berlin_light_cone"]									= loadfx("maps/mp_maps/fx_mp_berlin_light_cone");	
  level._effect["fx_light_floodlight_int_blue_sqr"]					= loadfx("env/light/fx_light_floodlight_int_blue_sqr");
  level._effect["fx_light_overhead_sm_warm"]				  			= loadfx("maps/mp_maps/fx_mp_light_recessed_wrm");
  level._effect["fx_light_pent_ceiling_light"]							= loadfx("env/light/fx_light_pent_ceiling_light");
  level._effect["fx_mp_outskirts_floures_glow1"]						=	loadfx("maps/mp_maps/fx_mp_outskirts_floures_glow_1");
  level._effect["fx_mp_outskirts_floures_glow_warm"]				=	loadfx("maps/mp_maps/fx_mp_outskirts_floures_glow_warm");	  	
  level._effect["fx_mp_light_half_globe_hotel"]							=	loadfx("maps/mp_maps/fx_mp_light_half_globe_hotel");
  level._effect["fx_light_bulb_sm_hotel_sconce"]						=	loadfx("env/light/fx_light_bulb_sm_hotel_sconce");
//  level._effect["fx_light_security_camera"]									=	loadfx("env/light/fx_light_security_camera"); 	
  level._effect["fx_mp_light_tracklight_sm"]								=	loadfx("maps/mp_maps/fx_mp_light_tracklight_sm"); 
  level._effect["fx_mp_light_tracklight_picture"]						=	loadfx("maps/mp_maps/fx_mp_light_tracklight_picture");

 	level._effect["fx_light_godray_lrg_warm"]									=	loadfx("maps/mp_maps/fx_mp_light_gray_hotel_lrg");	
 	level._effect["fx_light_godray_md_warm"]									=	loadfx("maps/mp_maps/fx_mp_light_gray_hotel_md");
 	level._effect["fx_light_godray_md_warm_wide"]							=	loadfx("maps/mp_maps/fx_mp_light_gray_hotel_md_wide"); 		
 	level._effect["fx_light_godray_sm_warm"]									=	loadfx("maps/mp_maps/fx_mp_light_gray_hotel_sm");	
 	level._effect["fx_light_godray_sm_warm_wide"]							=	loadfx("maps/mp_maps/fx_mp_light_gray_hotel_sm_wide");

	level._effect["fx_mp_waves_shorebreak_mp"]								= loadfx("maps/mp_maps/fx_mp_waves_shorebreak_mp_hotel");
	level._effect["fx_mp_waves_shoreline_mp"]									= loadfx("maps/mp_maps/fx_mp_waves_shoreline_mp_hotel");
	
//	level._effect["fx_water_drip_light_short"]								= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_short");
	level._effect["fx_water_faucet_drip_fast"]								= loadfx("env/water/fx_water_faucet_drip_fast");		
		
	level._effect["fx_pent_cigar_smoke"]                  		= LoadFX("maps/zombie/fx_zombie_cigar_tip_smoke");
//	level._effect["fx_pent_cigarette_tip_smoke"]          		= LoadFX("maps/zombie/fx_zombie_cigarette_tip_smoke");
	level._effect["fx_pent_smk_ambient_room"]             		= LoadFX("maps/mp_maps/fx_mp_smk_hotel_casino_md");	
	level._effect["fx_pent_smk_ambient_room_lg"]          		= LoadFX("maps/mp_maps/fx_mp_smk_hotel_casino_lg");
	level._effect["fx_pent_smk_ambient_room_sm"]          		= LoadFX("maps/mp_maps/fx_mp_smk_hotel_casino_sm");
	level._effect["fx_steam_pot"]          										= LoadFX("env/smoke/fx_steam_pot");
	level._effect["fx_smk_kitchen_pan"]          							= LoadFX("env/smoke/fx_smk_kitchen_pan");
	
//	level._effect["fx_debris_papers_narrow"]									= loadfx("env/debris/fx_debris_papers_narrow");
//	level._effect["fx_debris_papers"]													= loadfx("env/debris/fx_debris_papers");
//	level._effect["fx_debris_money_cuba"]											= loadfx("env/debris/fx_debris_money_cuba");
//	level._effect["fx_debris_money_usa"]											= loadfx("env/debris/fx_debris_money_usa");	
	level._effect["fx_debris_money_usa_narrow"]								= loadfx("env/debris/fx_debris_money_usa_narrow");	
	level._effect["fx_debris_money_usa_short"]								= loadfx("env/debris/fx_debris_money_usa_short");
	level._effect["fx_debris_money_cuba_narrow"]							= loadfx("env/debris/fx_debris_money_cuba_narrow");	
	level._effect["fx_debris_money_cuba_short"]								= loadfx("env/debris/fx_debris_money_cuba_short");	

//	level._effect["fx_elevator_dlight"]												= loadfx("maps/mp_maps/fx_mp_light_hotel_elevator_dlight");
	
	level._effect["fx_mp_light_hotel_spotlights"]							= loadfx("maps/mp_maps/fx_mp_light_hotel_spotlights");
	level._effect["fx_mp_light_recessed_elevator"]						= loadfx("maps/mp_maps/fx_mp_light_recessed_elevator");
	level._effect["fx_mp_light_elevator_num_glow"]							= loadfx("maps/mp_maps/fx_mp_light_elevator_num_glow");
	level._effect["fx_mp_light_elevator_num_glow_red"]						= loadfx("maps/mp_maps/fx_mp_light_elevator_num_glow_red");
}

// fx prop anim effects
#using_animtree( "fxanim_props_dlc3" );
precache_fx_prop_anims()
{
	level._fxanims = [];
	level._fxanims[ "fxanim_mp_htl_pool_umbrella" ] = %fxanim_mp_htl_pool_umbrella_anim;
	level._fxanims[ "fxanim_mp_htl_spotlight" ] = %fxanim_mp_htl_spotlight_anim;
	level._fxanims[ "fxanim_mp_htl_pool_pennant1" ] = %fxanim_mp_htl_pool_pennant1_anim;
	level._fxanims[ "fxanim_mp_htl_pool_pennant2" ] = %fxanim_mp_htl_pool_pennant2_anim;
	level._fxanims[ "fxanim_mp_htl_pool_pennant3" ] = %fxanim_mp_htl_pool_pennant3_anim;

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
	fxanim_umbrellas = GetEntArray( localClientNum, "fxanim_mp_htl_pool_umbrella_mod", "targetname" ); 

	for ( i = 0; i < fxanim_umbrellas.size; i++ )
	{
		fxanim_umbrellas[i] thread fxanim_think( localClientNum, "fxanim_mp_htl_pool_umbrella", level.waits[i], level.speeds[i] );
	}

	fxanim_spotlights = GetEntArray( localClientNum, "fxanim_mp_htl_spotlight_mod", "targetname" ); 

	for ( i = 0; i < fxanim_spotlights.size; i++ )
	{
		fxanim_spotlights[i] thread fxanim_fx_think( localClientNum, "fxanim_mp_htl_spotlight", level.waits[i], level.speeds[i] );
	}

	fxanim_pennants = GetEntArray( localClientNum, "fxanim_mp_htl_pool_pennant1_mod", "targetname" ); 

	for ( i = 0; i < fxanim_pennants.size; i++ )
	{
		fxanim_pennants[i] thread fxanim_think( localClientNum, "fxanim_mp_htl_pool_pennant1", level.waits[i], 1 );
	}

	fxanim_pennants = GetEntArray( localClientNum, "fxanim_mp_htl_pool_pennant2_mod", "targetname" ); 

	for ( i = 0; i < fxanim_pennants.size; i++ )
	{
		fxanim_pennants[i] thread fxanim_think( localClientNum, "fxanim_mp_htl_pool_pennant2", level.waits[i], 1 );
	}

	fxanim_pennants = GetEntArray( localClientNum, "fxanim_mp_htl_pool_pennant3_mod", "targetname" ); 

	for ( i = 0; i < fxanim_pennants.size; i++ )
	{
		fxanim_pennants[i] thread fxanim_think( localClientNum, "fxanim_mp_htl_pool_pennant3", level.waits[i], 1 );
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

	self SetAnim( level._fxanims[ anim_index ], 1.0, 0.0, speed );

	PlayFxOnTag( localClientNum, level._effect["fx_mp_light_hotel_spotlights"], self, "bulb_01_jnt" );
	PlayFxOnTag( localClientNum, level._effect["fx_mp_light_hotel_spotlights"], self, "bulb_02_jnt" );
	PlayFxOnTag( localClientNum, level._effect["fx_mp_light_hotel_spotlights"], self, "bulb_03_jnt" );
	PlayFxOnTag( localClientNum, level._effect["fx_mp_light_hotel_spotlights"], self, "bulb_04_jnt" );
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

main()
{
	clientscripts\mp\createfx\mp_hotel_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
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

