//
// file: mp_cairo_fx.gsc
// description: clientside fx script for mp_cairo: setup, special fx functions, etc.
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
// Ambient effects

  level._effect["fx_mp_light_dust_motes_md"]                = loadfx("maps/mp_maps/fx_mp_light_dust_motes_md");
  level._effect["fx_light_godray_lrg_warm"]                 = loadfx("env/light/fx_light_godray_lrg_warm");
  level._effect["fx_light_office_light_03"]                 = loadfx("env/light/fx_light_office_light_03");
  level._effect["fx_light_overhead_sm_warm"]                = loadfx("env/light/fx_light_overhead_sm_warm"); 
  
//  level._effect["fx_pipe_steam_md"]                         = loadfx("env/smoke/fx_pipe_steam_md");
  level._effect["fx_debris_papers"]                         = loadfx("env/debris/fx_debris_papers");
  
  level._effect["fx_water_splash_fountain"]                 = loadfx("env/water/fx_water_splash_fountain");
//  level._effect["fx_water_drip_light_short"]								= loadfx("env/water/fx_water_drip_light_short");
//  level._effect["fx_water_drip_xlight_short"]								= loadfx("env/water/fx_water_drip_xlight_short");
  
//  level._effect["fx_mp_insect_swarm"]                       = loadfx("maps/mp_maps/fx_mp_insect_swarm");
  level._effect["fx_insects_swarm_md_light"]                = loadfx("bio/insects/fx_insects_swarm_md_light");
  level._effect["fx_seagulls_shore_distant"]								= loadfx("bio/animals/fx_seagulls_shore_distant");
//  level._effect["fx_seagulls_circle_overhead"]							= loadfx("bio/animals/fx_seagulls_circle_overhead");
  
  level._effect["fx_mp_fumes_vent_sm"]                      = loadfx("maps/mp_maps/fx_mp_fumes_vent_sm");
  level._effect["fx_mp_fumes_haze_md"]                      = loadfx("maps/mp_maps/fx_mp_fumes_haze_md");
  
	level._effect["fx_mp_fog_ground_md"]											= loadfx("maps/mp_maps/fx_mp_fog_ground_md");	
	level._effect["fx_fogrolling_ground_md"]          				= loadfx("env/smoke/fx_fog_rolling_ground_md");
	level._effect["fx_fog_interior_md"]          							= loadfx("env/smoke/fx_fog_interior_md");
	level._effect["fx_fog_rolling_vista_lg"]      						= loadfx("env/smoke/fx_fog_rolling_vista_lg");
	
//	level._effect["fx_dust_motes_blowing"]         						= loadfx("env/debris/fx_dust_motes_blowing");
//	level._effect["fx_dust_motes_blowing_sm"]          				= loadfx("env/debris/fx_dust_motes_blowing_sm");
	
	level._effect["fx_debris_papers_dust_devil"]      				= loadfx("env/debris/fx_debris_papers_dust_devil");
	
	level._effect["fx_mp_elec_spark_burst_sm"]								= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm");
	level._effect["fx_mp_elec_spark_burst_xsm_thin"]					= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin");

}

// fx prop anim effects
#using_animtree ( "fxanim_props" );
precache_fx_prop_anims()
{
	level.cairo_fxanims = [];
	level.cairo_fxanims["fxanim_cuba_line_flag01_anim"] = %fxanim_cuba_line_flag01_anim;
}

play_fx_prop_anims( localClientNum )
{
	wait( 3 );
	fxanim_flags = GetEntArray( localClientNum, "fxanim_cuba_line_flag01_03", "targetname" );
	array_thread( fxanim_flags, ::fxanim_think, localClientNum );
}

fxanim_think( localClientNum )
{
	if ( !IsDefined ( self.speed ) )
	{
		self.speed = 0.5;
	}

	wait_time = RandomFloatRange( 0.5, 1 );
	wait( wait_time );

	self UseAnimTree( #animtree );
	self SetAnim( level.cairo_fxanims["fxanim_cuba_line_flag01_anim"], 1.0, 0.0, self.speed );
}

main()
{

	clientscripts\mp\createfx\mp_cairo_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}

	precache_fx_prop_anims();

	waitforclient(0);

	players = GetLocalPlayers();

	for ( i = 0; i < players.size; i++ )
	{
		play_fx_prop_anims( i );
	}
}

