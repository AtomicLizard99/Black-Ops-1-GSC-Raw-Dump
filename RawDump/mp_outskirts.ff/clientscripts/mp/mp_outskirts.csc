// Test clientside script for mp_outskirts

#include clientscripts\mp\_utility;

main()
{
	// team nationality
	clientscripts\mp\_teamset_winterspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	level thread clientscripts\mp\mp_outskirts_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_outskirts_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	init_level_helicopter_fog();

	println("*** Client : mp_outskirts running...");
}


init_level_helicopter_fog()
{level.helicopter_fog = true;
	start_dist = 852;
	half_dist = 427.699;
	half_height = 2250.9;
	base_height = -2914.68;
	fog_r = 0.788235;
	fog_g = 0.792157;
	fog_b = 0.65098;
	fog_scale = 5;
	sun_col_r = 0.972549;
	sun_col_g = 0.854902;
	sun_col_b = 0.533333;
	sun_dir_x = -0.260041;
	sun_dir_y = 0.915821;
	sun_dir_z = 0.306025;
	sun_start_ang = 0;
	sun_stop_ang = 56.2881;
	time = 0;
	max_fog_opacity = 1;


       
  setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
} 