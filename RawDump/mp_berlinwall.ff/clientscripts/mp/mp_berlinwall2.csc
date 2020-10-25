// Test clientside script for mp_berlinwall

#include clientscripts\mp\_utility;

main()
{
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_urbanspecops::level_init();
	
	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_berlinwall2_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_berlinwall2_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);
	
	init_level_helicopter_fog();
	
	if ( isps3() )
	{
		setdvar( "cg_enableHelicopterNoCullLodOut", 0 );
	}

	println("*** Client : mp_berlinwall2 running...");
}

init_level_helicopter_fog()
{
       level.helicopter_fog = true;
       start_dist = 1802;
	half_dist = 3483;
	half_height = 1205.66;
	base_height = 1437;
	fog_r = 1;
	fog_g = 1;
	fog_b = 1;
	fog_scale = 3.25;
	sun_col_r = 0.552941;
	sun_col_g = 0.466667;
	sun_col_b = 0.34902;
	sun_dir_x = 0.909043;
	sun_dir_y = -0.385585;
	sun_dir_z = 0.158006;
	sun_start_ang = 16.3625;
	sun_stop_ang = 25.6469;
	time = 0;
	max_fog_opacity = 0.5;

       
       setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
              sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
              sun_stop_ang, time, max_fog_opacity);
}      
