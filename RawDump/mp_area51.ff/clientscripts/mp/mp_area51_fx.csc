#include clientscripts\mp\_utility; 

precache_scripted_fx()
{
	level._effect["fx_radio_tower_flare"]		= loadfx("maps/mp_maps/fx_mp_area51_v_radio_tower_flare");
}

precache_createfx_fx()
{
	level._effect["fx_large_metalhit"]													= loadfx("impacts/fx_large_metalhit");

	level._effect["fx_pipe_steam_md"]														= loadfx("maps/mp_maps/fx_mp_pipe_steam_md");
	
	level._effect["fx_fire_sm"] 																= loadfx("env/fire/fx_fire_sm");
	level._effect["fx_fire_md"] 																= loadfx("env/fire/fx_fire_md");

	level._effect["fx_smoke_exhaust_truck"] 				  					= loadfx("maps/mp_maps/fx_mp_smk_exhaust_3");	
	level._effect["fx_distortion_heat_truck"] 									= loadfx("maps/mp_maps/fx_mp_distortion_heat_engine");
	level._effect["fx_mp_area51_engine_inner"] 									= loadfx("maps/mp_maps/fx_mp_area51_engine_inner");
	level._effect["fx_mp_area51_jet_amb"] 											= loadfx("maps/mp_maps/fx_mp_area51_jet_amb");
	level._effect["fx_insects_swarm_md_light"]									= loadfx("bio/insects/fx_insects_swarm_md_light");
	level._effect["fx_debris_papers"]														= loadfx("env/debris/fx_debris_papers");
	level._effect["fx_debris_papers_narrow"]										= loadfx("env/debris/fx_debris_papers_narrow");
	level._effect["fx_debris_papers_windy"]											= loadfx("maps/mp_maps/fx_mp_debris_papers_windy_lg");
	level._effect["fx_debris_papers_dust_devil_windy"]					= loadfx("env/debris/fx_debris_papers_dust_devil_windy");
	level._effect["fx_debris_papers_short_int"]									= loadfx("env/debris/fx_debris_papers_short_int");		

	level._effect["fx_interrog_morgue_mist"]										= loadfx("maps/mp_maps/fx_mp_area51_morgue_mist");	

	level._effect["fx_mp_smk_tin_hat_steam_pipe_w"]							= loadfx("maps/mp_maps/fx_mp_smk_tin_hat_steam_pipe_w");
	level._effect["fx_smk_plume_md_wht_wispy"]									= loadfx("maps/mp_maps/fx_mp_smk_plume_md_grey_wispy");
	level._effect["fx_mp_area51_smk_plume_wht_wispy_cheap"]			= loadfx("maps/mp_maps/fx_mp_area51_smk_plume_wht_wispy_cheap");
	level._effect["fx_mp_area51_smk_plume_blck_wispy"]					= loadfx("maps/mp_maps/fx_mp_area51_smk_plume_blck_wispy");	
	level._effect["fx_mp_area51_smk_hose_01"]										= loadfx("maps/mp_maps/fx_mp_area51_smk_hose_01");	
	level._effect["fx_mp_area51_smk_smolder"]										= loadfx("maps/mp_maps/fx_mp_area51_smk_smolder");
	level._effect["fx_mp_area51_smk_smolder_sm"]								= loadfx("maps/mp_maps/fx_mp_area51_smk_smolder_sm");
	level._effect["fx_mp_area51_smk_linger"] 										= loadfx("maps/mp_maps/fx_mp_area51_smk_linger");
	level._effect["fx_mp_area51_smk_linger_rising"] 						= loadfx("maps/mp_maps/fx_mp_area51_smk_linger_rising");
	level._effect["fx_mp_fumes_vent_sm_int"]										= loadfx("maps/mp_maps/fx_mp_fumes_vent_sm_ext");
	level._effect["fx_mp_fumes_vent_md_ext"]										= loadfx("maps/mp_maps/fx_mp_fumes_vent_md_ext");
	level._effect["fx_mp_fumes_vent_xsm_int"]										= loadfx("maps/mp_maps/fx_mp_fumes_vent_xsm_int");

 	level._effect["fx_mp_outskirts_floures_glow_warm"]					=	loadfx("maps/mp_maps/fx_mp_outskirts_floures_glow_warm");
	level._effect["fx_mp_outskirts_floures_glow1"]		    			=	loadfx("maps/mp_maps/fx_mp_light_flour_glow_cool");	
	level._effect["fx_light_floodlight_bright"]									= loadfx("maps/mp_maps/fx_mp_area51_floodlight_bright");
	level._effect["fx_light_stoplight_red_blink"]								= loadfx("env/light/fx_light_stoplight_red_blink");	
	level._effect["fx_mp_area51_light_flashing"]								= loadfx("maps/mp_maps/fx_mp_area51_light_flashing");	
	level._effect["fx_light_glow_bulb_red"] 										= loadfx("maps/vorkuta/fx_light_glow_bulb_red");
	level._effect["fx_mp_area51_runway_yellow"]									= loadfx("maps/mp_maps/fx_mp_area51_runway_yellow");
	level._effect["fx_mp_area51_light_beacon_red_distant_slw"]	= loadfx("maps/mp_maps/fx_mp_area51_light_beacon_red_distant_slw");	
	level._effect["fx_mp_area51_light_beacon_red"]							= loadfx("maps/mp_maps/fx_mp_area51_light_beacon_red");		
	level._effect["fx_mp_area51_floodlight_xbright"]						= loadfx("maps/mp_maps/fx_mp_area51_floodlight_xbright");	
	level._effect["fx_mp_dlc4_silo_tinhat_indoor"] 							= loadfx("maps/mp_maps/fx_mp_light_tinhat_w_motes");
  level._effect["fx_light_floodlight_int_blue_sqr"]						= loadfx("env/light/fx_light_floodlight_int_blue_sqr");
  
	level._effect["fx_mp_area51_heat_distortion_xsm"]						= loadfx("maps/mp_maps/fx_mp_area51_heat_distortion_xsm");
	level._effect["fx_mp_area51_heat_distortion_md"]						= loadfx("maps/mp_maps/fx_mp_area51_heat_distortion_md");
	level._effect["fx_mp_distortion_heat_field_lg"]							= loadfx("maps/mp_maps/fx_mp_distortion_heat_field_lg");		
	level._effect["fx_mp_distortion_heat_field_sm"]							= loadfx("maps/mp_maps/fx_mp_distortion_heat_field_sm");

	level._effect["fx_mp_light_dust_motes_md"]									= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
	level._effect["fx_mp_area51_dust_huge"]											= loadfx("maps/mp_maps/fx_mp_area51_dust_huge");	
	level._effect["fx_mp_area51_dust_grnd_drift"]								= loadfx("maps/mp_maps/fx_mp_area51_dust_grnd_drift");
	level._effect["fx_mp_area51_dust_pcloud_slow"]							= loadfx("maps/mp_maps/fx_mp_area51_dust_pcloud_slow");
	
	level._effect["fx_mp_area51_water_drip_sm"]									= loadfx("maps/mp_maps/fx_mp_area51_water_drip_sm");
	level._effect["fx_water_drip_light_long"]										= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_long");	
	level._effect["fx_water_drip_light_short"]									= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_short");	
	
	level._effect["fx_mp_area51_sparks"]												= loadfx("maps/mp_maps/fx_mp_area51_sparks");

	level._effect["fx_mp_area51_apple"]													= loadfx("maps/mp_maps/fx_mp_area51_apple");
	level._effect["fx_mp_area51_apple_elec_shaft_spawner"]			= loadfx("maps/mp_maps/fx_mp_area51_apple_elec_shaft_spawner");
	level._effect["fx_mp_area51_apple_elec_shaft"]							= loadfx("maps/mp_maps/fx_mp_area51_apple_elec_shaft");
	level._effect["fx_mp_area51_apple_elec_shaft_top"]					= loadfx("maps/mp_maps/fx_mp_area51_apple_elec_shaft_top");	
	level._effect["fx_mp_area51_apple_elec_tube"]								= loadfx("maps/mp_maps/fx_mp_area51_apple_elec_tube");
	level._effect["fx_mp_area51_apple_elec_sm"]									= loadfx("maps/mp_maps/fx_mp_area51_apple_elec_sm");
}

main()
{
	clientscripts\mp\createfx\mp_area51_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_createfx_fx();
	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

