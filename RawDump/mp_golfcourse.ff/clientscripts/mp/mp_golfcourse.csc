// Test clientside script for mp_golfcourse

#include clientscripts\mp\_utility;

main()
{
	// team nationality
	clientscripts\mp\_teamset_cubans::level_init();

	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_golfcourse_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_golfcourse_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);
	
	init_level_helicopter_fog();

	println("*** Client : mp_golfcourse running...");
}

init_level_helicopter_fog()
{
  level.helicopter_fog = true;
    start_dist = 1164.28;
	half_dist = 1874.2;
	half_height = 1358.4;
	base_height = 141.971;
	fog_r = 0.615686;
	fog_g = 0.796079;
	fog_b = 1;
	fog_scale = 5.85542;
	sun_col_r = 0.980392;
	sun_col_g = 0.972549;
	sun_col_b = 0.776471;
	sun_dir_x = 0.849009;
	sun_dir_y = 0.182848;
	sun_dir_z = 0.495732;
	sun_start_ang = 0;
	sun_stop_ang = 42.5305;
	time = 0;
	max_fog_opacity = 1;

	setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
}   