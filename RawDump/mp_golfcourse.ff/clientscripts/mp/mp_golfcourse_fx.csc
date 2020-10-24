//
// file: mp_golfcourse_fx.gsc
// description: clientside fx script for mp_golfcourse: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 

precache_util_fx()
{	
}

precache_scripted_fx()
{
}


precache_createfx_fx()
{

	level._effect["fx_insects_butterfly_flutter"]								= loadfx("bio/insects/fx_insects_butterfly_flutter2");
	level._effect["fx_insects_butterfly_flutter_radial"]				= loadfx("bio/insects/fx_insects_butterfly_flutter_radial2");	
	level._effect["fx_insects_swarm_md_light"]									= loadfx("bio/insects/fx_insects_swarm_md_light");
	level._effect["fx_insects_ambient"]													= loadfx("bio/insects/fx_insects_ambient");	
	
	level._effect["fx_mp_berlin_fog_low_lite"]			          	= loadfx("maps/mp_maps/fx_mp_fog_ground_sm_w");		
	level._effect["fx_mp_fog_xsm_int"]			          					= loadfx("maps/mp_maps/fx_mp_fog_xsm_int");	

	level._effect["fx_mp_golfcourse_sprinkler_rainbow"]					= loadfx("maps/mp_maps/fx_mp_golfcourse_sprinkler_rainbow");
	level._effect["fx_mp_golfcourse_sprinkler_rainbow_sm"]			= loadfx("maps/mp_maps/fx_mp_golfcourse_sprinkler_rainbow_sm");	
	level._effect["fx_mp_golfcourse_sprinkler"]									= loadfx("maps/mp_maps/fx_mp_golfcourse_sprinkler");
	level._effect["fx_mp_golfcourse_sprinkler_sm"]							= loadfx("maps/mp_maps/fx_mp_golfcourse_sprinkler_sm");
	level._effect["fx_mp_golfcourse_sprinkler_nw"]							= loadfx("maps/mp_maps/fx_mp_golfcourse_sprinkler_nw");	
	level._effect["fx_mp_golfcourse_sprinkler_dest"]						= loadfx("maps/mp_maps/fx_mp_golfcourse_sprinkler_dest");			

//	level._effect["fx_mp_nuked_sprinkler"]											= loadfx("maps/mp_maps/fx_mp_nuked_sprinkler");	
//	level._effect["fx_mp_nuked_hose_spray"]											= loadfx("maps/mp_maps/fx_mp_nuked_hose_spray");
	level._effect["fx_water_drip_light_long"]										= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_long");	
	level._effect["fx_water_drip_light_short"]									= loadfx("maps/mp_maps/fx_mp_water_drip_xlight_short");
	level._effect["fx_mp_hotel_fountain_splash_sm"] 						= loadfx("maps/mp_maps/fx_mp_hotel_fountain_splash_sm");
	level._effect["fx_mp_hotel_fountain_splash_xsm"] 						= loadfx("maps/mp_maps/fx_mp_hotel_fountain_splash_xsm");	
	level._effect["fx_mp_hotel_fountain_splash02"] 							= Loadfx("maps/mp_maps/fx_mp_hotel_fountain_splash02");
	level._effect["fx_mp_waterfall_splash_sm"]           				= loadFX("maps/mp_maps/fx_mp_waterfall_splash_sm");
	level._effect["fx_mp_waterfall_sm"]           							= loadFX("maps/mp_maps/fx_mp_waterfall_sm");	
	level._effect["fx_mp_waterfall_wall_splash"]           			= loadFX("maps/mp_maps/fx_mp_waterfall_wall_splash");	
	
	level._effect["fx_light_wall_sconce_yellow"]								= loadfx("env/light/fx_light_wall_sconce_yellow");
	level._effect["fx_mp_light_gray_solid_sm_lt"]								= loadfx("maps/mp_maps/fx_mp_light_gray_solid_sm_lt");
	level._effect["fx_mp_light_gray_solid_sm_wide"]							= loadfx("maps/mp_maps/fx_mp_light_gray_solid_sm_wide");	
	level._effect["fx_light_godray_md_warm"]										= loadfx("maps/mp_maps/fx_mp_light_gray_solid_md");
	level._effect["fx_light_godray_sm_warm"]										= loadfx("maps/mp_maps/fx_mp_light_gray_solid_sm");
  level._effect["fx_light_overhead_sm_warm"]				  				= loadfx("maps/mp_maps/fx_mp_light_tinhat_cage_warm");
  level._effect["fx_light_overhead_md_orange"]				  				= loadfx("env/light/fx_light_overhead_md_orange");	
  		
	level._effect["fx_mp_light_dust_motes_md"]									= loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
	
	level._effect["fx_pent_cigar_smoke"]                  			= loadFX("maps/zombie/fx_zombie_cigar_tip_smoke");
	level._effect["fx_pent_smk_ambient_room_sm"]          			= LoadFX("maps/mp_maps/fx_mp_smk_hotel_casino_sm");
	
	level._effect["fx_mp_golfcourse_gopher"]           					= loadFX("maps/mp_maps/fx_mp_golfcourse_gopher");	
	level._effect["fx_mp_golfcourse_choc_bar_runner"]           = loadFX("maps/mp_maps/fx_mp_golfcourse_choc_bar_runner");
	level._effect["fx_mp_golfcourse_buoy"]                  		= loadFX("maps/mp_maps/fx_mp_golfcourse_buoy_runner");
	level._effect["fx_seagulls_shore_distant"]									=	loadfx("bio/animals/fx_seagulls_shore_distant");	
	level._effect["fx_water_river_shore2"]											= loadfx("env/water/fx_water_river_shore2");
	level._effect["fx_mp_water_wave_break_sm"]									= loadfx("env/water/fx_mp_water_wave_break_sm");
	level._effect["fx_cuba_waves_shorebreak"]										= loadfx("maps/mp_maps/fx_mp_waves_shorebreak_mp");
	
	level._effect["fx_leaves_falling_lite"]											= loadfx("env/foliage/fx_leaves_falling_lite");
	level._effect["fx_leaves_falling_lite_w"]      							= loadfx("env/foliage/fx_leaves_falling_lite_w_sm");	
	
	level._effect["fx_smoke_plume_md_fast_blk"]      						= loadfx("env/smoke/fx_smoke_plume_md_fast_blk");	
	
}


main()
{
	clientscripts\mp\createfx\mp_golfcourse_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

