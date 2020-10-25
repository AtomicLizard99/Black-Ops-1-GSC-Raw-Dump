// Test clientside script for mp_zoo

#include clientscripts\mp\_utility;

main()
{
	// team nationality
	clientscripts\mp\_teamset_urbanspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	thread clientscripts\mp\mp_zoo_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_zoo_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	init_level_helicopter_fog();

	println("*** Client : mp_zoo_art running...");
}


init_level_helicopter_fog()
{
  level.helicopter_fog = true;
	start_dist = 1082.44;
	half_dist = 1579.07;
	half_height = 1082.15;
	base_height = 780.94;
	fog_r = 0.396078;
	fog_g = 0.517059;
	fog_b = 0.427451;
	fog_scale = 1.05519;
	sun_col_r = 0.803922;
	sun_col_g = 0.956863;
	sun_col_b = 0.929412;
	sun_dir_x = -0.652496;
	sun_dir_y = 0.402488;
	sun_dir_z = 0.642069;
	sun_start_ang = 17.4307;
	sun_stop_ang = 35.6191;
	time = 0;
	max_fog_opacity = 1;

       
  setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
}   