//
// file: mp_firingrange_fx.gsc
// description: clientside fx script for mp_firingrange: setup, special fx functions, etc.
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

//	level._effect["fx_mp_sand_dust_devil"]								= loadfx("maps/mp_maps/fx_mp_sand_dust_devil");
	
	level._effect["fx_mp_sand_blowing_lg_slow"]						= loadfx("maps/mp_maps/fx_mp_sand_blowing_lg_slow");
	
	level._effect["fx_sand_windy_slow_door_os"]						= loadfx("maps/mp_maps/fx_mp_sand_windy_slow_door_os");
	level._effect["fx_sand_windy_heavy_sm_slow"]					= loadfx("maps/mp_maps/fx_mp_sand_windy_heavy_sm_slow");
	level._effect["fx_mp_sand_windy_pcloud_lg_slow"]			= loadfx("maps/mp_maps/fx_mp_sand_windy_pcloud_lg_slow_dense");		
	
	level._effect["fx_smk_plume_md_wht_wispy"]						= loadfx("maps/mp_maps/fx_mp_smk_plume_md_wht_wispy");

	level._effect["fx_mp_distortion_heat_field_lg"]				= loadfx("maps/mp_maps/fx_mp_distortion_heat_field_lg");		
	level._effect["fx_mp_distortion_heat_field_sm"]				= loadfx("maps/mp_maps/fx_mp_distortion_heat_field_sm");
	level._effect["fx_mp_distortion_heat_field_xsm"]			= loadfx("maps/mp_maps/fx_mp_distortion_heat_field_xsm");

	level._effect["fx_water_drip_light_short"]						= loadfx("env/water/fx_water_drip_light_short");	
	
	level._effect["fx_mp_light_dust_motes_md"]						= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
	
	level._effect["fx_grass_blowing_slow"]								= loadfx("env/foliage/fx_grass_blowing_slow");
	
	level._effect["fx_seagulls_shore_distant"]						= 	loadfx("bio/animals/fx_seagulls_shore_distant");	
	
	level._effect["fx_light_red_on_lg"]									= 	loadfx("maps/mp_maps/fx_mp_light_red_firingrange");
	level._effect["fx_light_floodlight_int_blue_short"]		= 	loadfx("env/light/fx_light_floodlight_int_blue_short");	
	
}


main()
{
	clientscripts\mp\createfx\mp_firingrange_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

