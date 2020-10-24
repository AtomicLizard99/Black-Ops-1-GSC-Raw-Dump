// Test clientside script for mp_drivein

#include clientscripts\mp\_utility;

main()
{
	// team nationality
	clientscripts\mp\_teamset_urbanspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_drivein_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_drivein_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);
	
	init_level_helicopter_fog();

	println("*** Client : mp_drivein running...");
}


init_level_helicopter_fog()
{
  level.helicopter_fog = true;
	start_dist = 5848.82;
	half_dist = 3271.57;
	half_height = 1124.01;
	base_height = 2224.3;
	fog_r = 0.306;
	fog_g = 0.463;
	fog_b = 0.384;
	fog_scale = 6.7;
	sun_col_r = 0.784314;
	sun_col_g = 0.376471;
	sun_col_b = 0.180392;
	sun_dir_x = 0.973596;
	sun_dir_y = 0.223747;
	sun_dir_z = 0.0452476;
	sun_start_ang = 51.0364;
	sun_stop_ang = 136.092;
	time = 0;
	max_fog_opacity = 1;

       
  setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
}   



