#include maps\mp\_utility; 
#using_animtree ( "fxanim_props_dlc4" );
precache_fx_prop_anims()
{
	level._fxanims = [];
	level._fxanims[ "fxanim_gp_wirespark_med_anim" ]				= %fxanim_gp_wirespark_med_anim;
	level._fxanims[ "fxanim_gp_wirespark_long_anim" ] 				= %fxanim_gp_wirespark_long_anim;
	level._fxanims[ "fxanim_gp_snake_coiled_loop_anim" ] 			= %fxanim_gp_snake_coiled_loop_anim;
	level._fxanims[ "fxanim_drv_spring_rider_rocket_01" ] 			= %fxanim_drv_spring_rider_rocket_01;
	level._fxanimfx = [];
	level._fxanimfx[ "fx_elec_wire_spark_burst_xsm" ] 				= loadfx( "env/electrical/fx_elec_wire_spark_burst_xsm" );
	
}
main()
{
	precache_createfx_fx();
	precache_fx_prop_anims();
	precache_scripted_fx();
	wind_initial_setting();
	
	maps\mp\createfx\mp_drivein_fx::main();
//	maps\mp\createart\mp_drivein_art::main();

}

precache_scripted_fx()
{
	//level._effect["fx_mp_drivein_light_movingspot"]			= loadfx("maps/mp_maps/fx_mp_drivein_light_movingspot");	
}

precache_createfx_fx()
{

	//lights//
	level._effect["fx_mp_drivein_projector_beam"]							=loadfx("maps/mp_maps/fx_mp_drivein_projector_beam");
	level._effect["fx_mp_drivein_screen_01"]									=loadfx("maps/mp_maps/fx_mp_drivein_screen_01");
	level._effect["fx_mp_drivein_screen_wood"]								=loadfx("maps/mp_maps/fx_mp_drivein_screen_wood");	
	level._effect["fx_mp_drivein_light_fluorescent"]					=loadfx("maps/mp_maps/fx_mp_drivein_light_fluorescent");
	level._effect["fx_mp_drivein_light_fluorescent_flkr"]			=loadfx("maps/mp_maps/fx_mp_drivein_light_fluorescent_flkr");
	level._effect["fx_mp_drivein_light_flood"]								=loadfx("maps/mp_maps/fx_mp_drivein_light_flood");
	level._effect["fx_mp_drivein_light_tinhat"]								=loadfx("maps/mp_maps/fx_mp_drivein_light_tinhat");	
	level._effect["fx_mp_drivein_godray_md"]									=loadfx("maps/mp_maps/fx_mp_drivein_godray_md"); 
	level._effect["fx_mp_drivein_godray_lg"]									=loadfx("maps/mp_maps/fx_mp_drivein_godray_lg");
	
	level._effect["fx_light_beacon_yllw_police_horse"]				= loadfx("env/light/fx_light_beacon_yllw_police_horse2");
	
	//Debris_Dust//	
	level._effect["fx_mp_leaves_falling"]											=loadfx("maps/mp_maps/fx_mp_leaves_falling");
	level._effect["fx_mp_drivein_dust_debirs_lrg"]						=loadfx("maps/mp_maps/fx_mp_drivein_dust_debirs_lrg");	
	level._effect["fx_mp_drivein_debris_papers"]							=loadfx("maps/mp_maps/fx_mp_drivein_debris_papers");
	level._effect["fx_mp_drivein_dust_crumble_runner"]				=loadfx("maps/mp_maps/fx_mp_drivein_dust_crumble_runner");	
	
	level._effect["fx_leaves_falling_lite"]										= loadfx("env/foliage/fx_leaves_falling_lite");
	level._effect["fx_leaves_falling_lite_w"]      						= loadfx("env/foliage/fx_leaves_falling_lite_w_sm");
	level._effect["fx_leaves_ground_windy"]      							= loadfx("env/foliage/fx_leaves_ground_windy");
	level._effect["fx_leaves_ground_windy_narrow"]      			= loadfx("env/foliage/fx_leaves_ground_windy_narrow");
	level._effect["fx_leaves_ground_windy_short"]      				= loadfx("env/foliage/fx_leaves_ground_windy_short");	
	
	level._effect["fx_mp_sand_windy_slow_sm_os_red"]					= loadfx("maps/mp_maps/fx_mp_sand_windy_slow_sm_os_red");	
	level._effect["fx_mp_sand_windy_slow_sm_os"]							= loadfx("maps/mp_maps/fx_mp_sand_windy_slow_sm_os_light");	
	
	level._effect["fx_debris_papers"]													= loadfx("env/debris/fx_debris_papers");
	level._effect["fx_debris_papers_short_int"]								= loadfx("env/debris/fx_debris_papers_short_int");	
	
	//Fire//	
	
	//Smoke_Fog//
	level._effect["fx_mp_dlc4_silo_dust_motes_interior"]			=loadfx("maps/mp_maps/fx_mp_dlc4_silo_dust_motes_interior");
	level._effect["fx_mp_drivein_smk_blk_md"]									=loadfx("maps/mp_maps/fx_mp_drivein_smk_blk_md");
	level._effect["fx_mp_firebase_smoldering_tree"]						=loadfx("maps/mp_maps/fx_mp_firebase_smoldering_tree");
	level._effect["fx_mp_drivein_fog_vista"]									=loadfx("maps/mp_maps/fx_mp_drivein_fog_vista");
	level._effect["fx_mp_drivein_steam_vent"]									=loadfx("maps/mp_maps/fx_mp_drivein_steam_vent");	
	
	//Water//
	level._effect["fx_water_faucet_drip_fast"]								=loadfx("env/water/fx_water_faucet_drip_fast");		
	
	//Insects//
 	level._effect["fx_mp_drivein_bio_dragonflies"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_dragonflies");	
 	level._effect["fx_mp_drivein_bio_moths_light"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_moths_light");	
 	level._effect["fx_mp_drivein_bio_roaches"]								=loadfx("maps/mp_maps/fx_mp_drivein_bio_roaches");	
 	level._effect["fx_mp_drivein_bio_fireflies"]							=loadfx("maps/mp_maps/fx_mp_drivein_bio_fireflies");
	level._effect["fx_mp_drivein_bio_fly_swarm"]							=loadfx("bio/insects/fx_insects_swarm_md_light");
	level._effect["fx_mp_drivein_bio_spider_burst_runner"]		=loadfx("maps/mp_maps/fx_mp_drivein_bio_spider_burst_runner");
	level._effect["fx_mp_drivein_bio_spider_crawl"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_spider_crawl");
	level._effect["fx_mp_drivein_bio_grasshoppers"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_grasshoppers");		
		
	//Sparks//
	level._effect["fx_mp_elec_spark_burst_sm"]								=loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm");
	level._effect["fx_mp_elec_spark_burst_sm_runner"]					=loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm_runner");
	level._effect["fx_mp_elec_spark_burst_xsm_thin_runner"]		=loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin_runner");	
	
	//Cut//
	//level._effect["fx_debris_papers"]							=loadfx("env/debris/fx_debris_papers");	
	//level._effect["fx_insects_dragonflies_ambient"]			=loadfx("bio/insects/fx_insects_dragonflies_ambient");

	
}

wind_initial_setting()
{ 
SetDvar( "enable_global_wind", 1); // enable wind for your level
SetDvar( "wind_global_vector", "-100 -100 -100" );    // change "0 0 0" to your wind vector
SetDvar( "wind_global_low_altitude", -175);    // change 0 to your wind's lower bound
SetDvar( "wind_global_hi_altitude", 4000);    // change 10000 to your wind's upper bound
SetDvar( "wind_global_low_strength_percent", .5);    // change 0.5 to your desired wind strength percentage
}