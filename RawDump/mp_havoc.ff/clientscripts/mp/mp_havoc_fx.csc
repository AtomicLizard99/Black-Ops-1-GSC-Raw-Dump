//
// file: mp_havoc_fx.gsc
// description: clientside fx script for mp_havoc: setup, special fx functions, etc.
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


// --- ROB'S SECTION ---//
precache_createfx_fx()
{
	level._effect["fx_huey_exterior_lights_red_mp"] 		= loadfx("vehicle/light/fx_huey_exterior_lights_red_mp");

	level._effect["fx_insects_ambient"] 								= loadfx("bio/insects/fx_insects_ambient");
	level._effect["fx_insect_swarm"]										= loadfx("maps/creek/fx_insect_swarm");
	level._effect["fx_insects_ambient_lg"]							= loadfx("maps/creek/fx_insect_swarm_lg");	
	level._effect["fx_insects_dragonflies_ambient"]			= loadfx("bio/insects/fx_insects_dragonflies_ambient");
	
//	level._effect["fx_insect_swarm"]										= loadfx("maps/mp_maps/fx_mp_insect_swarm");
	level._effect["fx_insects_swarm_md_light"]					= loadfx("bio/insects/fx_insects_swarm_md_light");
	
	level._effect["fx_leaves_falling_lite"]							= loadfx("env/foliage/fx_leaves_falling_lite");
	
	level._effect["fx_sand_windy_heavy_sm"]						= loadfx("maps/mp_maps/fx_mp_sand_windy_heavy_sm_slow");
		
	level._effect["fx_fire_md"]													= loadfx("env/fire/fx_fire_md");
	level._effect["fx_fire_sm"]													= loadfx("env/fire/fx_fire_sm");

	level._effect["fx_fire_column_creep_xsm"]						= loadfx("env/fire/fx_fire_column_creep_xsm");
	level._effect["fx_fire_sm_smolder"]									= loadfx("env/fire/fx_fire_sm_smolder");
	level._effect["fx_fire_md_smolder"]									= loadfx("env/fire/fx_fire_md_smolder");	
	
//	level._effect["fx_fire_column_creep_xsm"]						= loadfx("env/fire/fx_fire_column_creep_xsm");
	level._effect["fx_fire_column_xsm_thin"]						= loadfx("env/fire/fx_fire_column_xsm_thin");
	level._effect["fx_fire_column_sm_thin"]							= loadfx("env/fire/fx_fire_column_sm_thin");	
	level._effect["fx_fire_line_xsm_thin"]							= loadfx("env/fire/fx_fire_line_xsm_thin");
	level._effect["fx_fire_line_sm_thin"]								= loadfx("env/fire/fx_fire_line_sm_thin");

//	level._effect["fx_smk_plume_xlg_tall_blk"]					= loadfx("env/smoke/fx_smk_plume_xlg_tall_blk");
	level._effect["fx_smk_plume_lg_white"]							= loadfx("env/smoke/fx_smk_plume_lg_white_slow");
	level._effect["fx_smk_smolder_xsm_wht_mp"]					= loadfx("env/smoke/fx_smk_smolder_xsm_wht_mp");
//	level._effect["fx_smk_smolder_md_brush"]						= loadfx("env/smoke/fx_smk_smolder_md_brush");

	level._effect["fx_fog_low"]													= loadfx("maps/mp_maps/fx_mp_fog_low_jungle");
	level._effect["fx_fog_large_slow"]									= loadfx("maps/mp_maps/fx_mp_fog_large_slow");

	level._effect["fx_water_drip_light_short"]					= loadfx("env/water/fx_water_drip_light_short");	
//	level._effect["fx_water_drip_light_long"]						= loadfx("env/water/fx_water_drip_light_long");	
	
	level._effect["fx_water_wake_creek_flow"]						= loadfx("maps/creek/fx_water_wake_creek_flow");	
	level._effect["fx_water_wake_creek"]								= loadfx("env/water/fx_water_wake_creek");
	level._effect["fx_water_splash_creek_rocks"]				= loadfx("maps/creek/fx_water_splash_creek_rocks");	
//	level._effect["fx_water_splash_creek_rocks_sm"]			= loadfx("maps/creek/fx_water_splash_creek_rocks_sm");
	
//	level._effect["fx_water_fall_sm"]										= loadfx("maps/creek/fx_water_fall_sm");
//	level._effect["fx_water_fall_xsm"]									= loadfx("maps/creek/fx_water_fall_xsm");		
	level._effect["fx_water_fall_mist"]									= loadfx("maps/creek/fx_water_fall_mist");		
	
	level._effect["fx_light_godray_lrg"]								= loadfx("env/light/fx_light_godray_lrg");
//	level._effect["fx_light_godray_md"]									= loadfx("env/light/fx_light_godray_md");
	level._effect["fx_light_godray_overcast_sm"]				= loadfx("env/light/fx_light_godray_overcast_sm");
	
}


main()
{
	clientscripts\mp\createfx\mp_havoc_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

