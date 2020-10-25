//
// file: mp_stadium_fx.gsc
// description: clientside fx script for mp_stadium: setup, special fx functions, etc.
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

  level._effect["fx_debris_papers"]                         = loadfx("env/debris/fx_debris_papers");
	level._effect["fx_debris_papers_dust_devil"]      				= loadfx("env/debris/fx_debris_papers_dust_devil2");
	level._effect["fx_debris_papers_narrow"]      						= loadfx("env/debris/fx_debris_papers_narrow");
	
	level._effect["fx_leaves_falling_lite_w"]      						= loadfx("env/foliage/fx_leaves_falling_lite_w");	
	
	level._effect["fx_mp_fumes_vent_md"]      								= loadfx("maps/mp_maps/fx_mp_fumes_vent_md");
	level._effect["fx_mp_fumes_vent_sm"]                      = loadfx("maps/mp_maps/fx_mp_fumes_vent_sm");
  level._effect["fx_mp_fumes_haze_md"]                      = loadfx("maps/mp_maps/fx_mp_fumes_haze_md");
  level._effect["fx_smk_plume_md_wht_wispy"]								= loadfx("maps/mp_maps/fx_mp_smk_plume_md_wht_wispy_sm");
  level._effect["fx_mp_stadium_wall_heater"]								= loadfx("maps/mp_maps/fx_mp_stadium_wall_heater");  

	level._effect["fx_mp_fog_low_stadium"]      							= loadfx("maps/mp_maps/fx_mp_fog_low_stadium");
	
	level._effect["fx_mp_light_dust_motes_md"]                = loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
	
	level._effect["fx_insects_swarm_md_light"]                = loadfx("bio/insects/fx_insects_swarm_md_light");
	
	level._effect["fx_light_beacon_red"]											= loadfx("env/light/fx_light_beacon_red_sm");
	level._effect["fx_light_beacon_red_distant_slw"]					= loadfx("env/light/fx_light_beacon_red_distant_slw");
	
	level._effect["fx_water_splash_fountain_lg"]              = loadfx("env/water/fx_water_splash_fountain_lg2");
  level._effect["fx_water_splash_fountain"]             		= loadfx("env/water/fx_water_splash_fountain");
  level._effect["fx_water_river_fountain_side"]             = loadfx("env/water/fx_water_river_fountain_side");
  level._effect["fx_water_river_fountain_side2"]            = loadfx("env/water/fx_water_river_fountain_side2");       
  level._effect["fx_water_river_fountain_center"]           = loadfx("env/water/fx_water_river_fountain_center");    
	  
	  
	level._effect["fx_light_godray_lrg_warm"]                 = loadfx("env/light/fx_light_godray_lrg_warm");
  level._effect["fx_light_office_light_03"]                 = loadfx("env/light/fx_light_office_light_03");
	level._effect["fx_fog_interior_md"]          							= loadfx("env/smoke/fx_fog_interior_md");  
 	level._effect["fx_water_drip_light_short"]								= loadfx("env/water/fx_water_drip_light_short");
 	
	level._effect["fx_mp_stadium_light_wide_cone"]					  = loadfx("maps/mp_maps/fx_mp_stadium_light_wide_cone");
  level._effect["fx_light_overhead_sm_cool"]	              = loadfx("env/light/fx_light_overhead_sm_cool");
  level._effect["fx_light_overhead_sm_warm"]	              = loadfx("env/light/fx_light_overhead_sm_warm"); 	   		
	level._effect["fx_mp_stadium_light_int_amber"]					  = loadfx("maps/mp_maps/fx_mp_stadium_light_int_amber");
	level._effect["fx_mp_stadium_light_fluorecent"]					  = loadfx("maps/mp_maps/fx_mp_stadium_light_fluorecent");		

}

// fx prop anim effects
#using_animtree( "fxanim_props_dlc2" );
precache_fx_prop_anims()
{
	level.stadium_fxanims = [];
	level.stadium_fxanims[ "mp_sdm_pennant_anim" ] = %fxanim_mp_sdm_pennant_anim;
}

play_fx_prop_anims( localClientNum )
{
	fxanim_flags = GetEntArray( localClientNum, "fxanim_mp_sdm_pennant_mod", "targetname" );
	array_thread( fxanim_flags, ::fxanim_think, localClientNum );
}

fxanim_think( localClientNum )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );

	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );
	self SetAnim( level.stadium_fxanims[ "mp_sdm_pennant_anim" ], 1.0, 0.0, 1.0 );
}

main()
{
	clientscripts\mp\createfx\mp_stadium_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}

	precache_fx_prop_anims();
	
	waitforclient(0);
	wait( 1 );

	players = GetLocalPlayers();

	for ( i = 0; i < players.size; i++ )
	{
		play_fx_prop_anims( i );
	}
}

