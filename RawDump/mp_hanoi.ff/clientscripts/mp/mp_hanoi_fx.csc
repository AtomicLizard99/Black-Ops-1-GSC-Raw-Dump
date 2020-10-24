//
// file: mp_hanoi_fx.gsc
// description: clientside fx script for mp_hanoi: setup, special fx functions, etc.
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
	level._effect["fx_fire_sm_fuel"]												= loadfx("env/fire/fx_fire_sm_fuel");
//	level._effect["fx_fire_sm"]															= loadfx("env/fire/fx_fire_sm");

	level._effect["fx_water_drip_light_short"]							= loadfx("env/water/fx_water_drip_light_short");
	level._effect["fx_mp_blood_drip_short"]									= loadfx("maps/mp_maps/fx_mp_blood_drip_short");

	level._effect["fx_insects_swarm_md_light"]							= loadfx("bio/insects/fx_insects_swarm_md_light");
	level._effect["fx_insect_swarm"]												= loadfx("maps/creek/fx_insect_swarm");
	level._effect["fx_insects_maggots"]											= loadfx("bio/insects/fx_insects_maggots");
	level._effect["fx_insects_moths_flutter"]								= loadfx("bio/insects/fx_insects_moths_flutter");
	level._effect["fx_insects_moths_light_source"]					= loadfx("bio/insects/fx_insects_moths_light_source");
	level._effect["fx_insects_moths_light_source_md"]				= loadfx("bio/insects/fx_insects_moths_light_source_md");

	level._effect["fx_debris_papers"]												= loadfx("env/debris/fx_debris_papers");
	level._effect["fx_leaves_falling_lite"]									= loadfx("env/foliage/fx_leaves_falling_lite");

	level._effect["fx_mp_elec_spark_burst_sm"]							= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm");
	level._effect["fx_mp_elec_spark_burst_xsm_thin"]				= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin");

	level._effect["fx_mp_light_dust_motes_md"]							= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");

	level._effect["fx_light_ray_window_md_white"] 					= loadfx("env/light/fx_light_ray_window_md_white");		
	level._effect["fx_light_ray_window_sm_white"] 					= loadfx("env/light/fx_light_ray_window_sm_white");			
	level._effect["fx_light_floodlight_int_blue"] 					= loadfx("env/light/fx_light_floodlight_int_blue");	
	level._effect["fx_light_street_lamp_old_yellow"]				= loadfx("env/light/fx_light_street_lamp_old_yellow");
	level._effect["fx_light_wall_sconce_outdoor_yellow"]		= loadfx("env/light/fx_light_wall_sconce_outdoor_yellow");
//	level._effect["fx_light_spotlight_lg_white"]						= loadfx("env/light/fx_light_spotlight_lg_wht");
	level._effect["fx_light_tinhat_cage_white"]							= loadfx("env/light/fx_light_tinhat_cage_white");	
//	level._effect["fx_light_floodlight_ext_warm"]						= loadfx("env/light/fx_light_floodlight_ext_warm");	
	level._effect["fx_light_desk_lamp"]												= loadfx("env/light/fx_light_desk_lamp");

	level._effect["fx_mp_smk_vent"]													= loadfx("maps/mp_maps/fx_mp_smk_vent");
	level._effect["fx_mp_smk_tin_hat_steam_pipe_sm"]				= loadfx("maps/mp_maps/fx_mp_smk_tin_hat_steam_pipe_sm");
	level._effect["fx_smk_smolder_sm"]											= loadfx("env/smoke/fx_smk_smolder_sm");
	level._effect["fx_fog_low"]															= loadfx("maps/mp_maps/fx_mp_fog_low_hanoi");
//	level._effect["fx_mp_fog_low_jungle"]										= loadfx("maps/mp_maps/fx_mp_fog_low_jungle");
//	level._effect["fx_mp_fog_low_floor_sm"]									= loadfx("maps/mp_maps/fx_mp_fog_low_floor_sm");	
	level._effect["fx_mp_fog_ground_md"]										= loadfx("maps/mp_maps/fx_mp_fog_ground_md");	
	level._effect["fx_fog_ground_ground_rising_md"]					= loadfx("maps/mp_maps/fx_mp_fog_ground_rising_md");
	level._effect["fx_fog_interior_md"]          							= loadfx("env/smoke/fx_fog_interior_md");	
	
	level._effect["fx_mp_star_blinking_runner"]							= loadfx("maps/mp_maps/fx_mp_star_blinking_runner");
	level._effect["fx_mp_star_shooting_runner"]							= loadfx("maps/mp_maps/fx_mp_star_shooting_runner");
	
	level._effect["fx_light_projector"]											= loadfx("env/light/fx_light_projector");
	level._effect["fx_mp_hanoi_projection_screen"]					= loadfx("maps/mp_maps/fx_mp_hanoi_projection_screen");					
}


main()
{
	clientscripts\mp\createfx\mp_hanoi_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

