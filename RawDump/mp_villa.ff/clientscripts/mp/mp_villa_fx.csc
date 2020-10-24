//
// file: mp_villa_fx.gsc
// description: clientside fx script for mp_villa: setup, special fx functions, etc.
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

	level._effect["fx_lightning_flash_single_lg"]						= loadfx("env/weather/fx_lightning_flash_single_lg");
	
	level._effect["fx_chandelier_candle"]										= loadfx("maps/cuba/fx_cuba_chandelier_candle");
	level._effect["fx_light_floodlight_int_blue"]						= loadfx("env/light/fx_light_floodlight_int_blue");
	level._effect["fx_light_floodlight_ext_warm"]						= loadfx("env/light/fx_light_floodlight_ext_warm");	
	
	level._effect["fx_mp_light_dust_motes_md"]							= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
//	level._effect["fx_mp_light_gray_warm_sm"]								= loadfx("maps/mp_maps/fx_mp_light_gray_warm_sm");	
	level._effect["fx_mp_light_gray_warm_md"]								= loadfx("maps/mp_maps/fx_mp_light_gray_warm_md");

//	level._effect["fx_water_drip_light_short"]							= loadfx("env/water/fx_water_drip_light_short");
  level._effect["fx_water_splash_fountain"]               = loadfx("env/water/fx_water_splash_fountain_lg");
  	
//	level._effect["fx_insects_swarm_md_light"]							= loadfx("bio/insects/fx_insects_swarm_md_light");
	level._effect["fx_insects_moths_light_source_md"]				= loadfx("bio/insects/fx_insects_moths_light_source_md");
	level._effect["fx_insects_moths_flutter"]								= loadfx("bio/insects/fx_insects_moths_flutter");	
	level._effect["fx_seagulls_shore_distant"]							= loadfx("bio/animals/fx_seagulls_shore_distant");
	
//	level._effect["fx_sand_windy_slow_door_os"]							= loadfx("maps/mp_maps/fx_mp_sand_windy_slow_door_os");
	level._effect["fx_sand_windy_heavy_sm_slow"]						= loadfx("maps/mp_maps/fx_mp_sand_windy_heavy_sm_slow");
	
	level._effect["fx_fog_low"]															= loadfx("maps/mp_maps/fx_mp_fog_md_slow");
	
	level._effect["fx_cuba_waves_shorebreak"]								= loadfx("maps/mp_maps/fx_mp_waves_shorebreak_mp");
	level._effect["fx_cuba_waves_shoreline"]								= loadfx("maps/mp_maps/fx_mp_waves_shoreline_mp");
	
	level._effect["fx_fire_sm"]															= loadfx("env/fire/fx_fire_sm");
	
	level._effect["fx_leaves_blowing"]											= loadfx("env/foliage/fx_leaves_blowing");

}


main()
{
	clientscripts\mp\createfx\mp_villa_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

