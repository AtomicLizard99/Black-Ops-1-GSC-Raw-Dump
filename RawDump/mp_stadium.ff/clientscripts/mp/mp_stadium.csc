// Test clientside script for mp_stadium

#include clientscripts\mp\_utility;

main()
{
	// team nationality
	clientscripts\mp\_teamset_urbanspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	thread clientscripts\mp\mp_stadium_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_stadium_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

  init_level_helicopter_fog();

	println("*** Client : mp_stadium running...");
}

init_level_helicopter_fog()
{
  level.helicopter_fog = true;
	start_dist = 1948.24;
	half_dist = 2178.52;
	half_height = 562.297;
	base_height = 502.224;
	fog_r = 0.627451;
	fog_g = 0.768628;
	fog_b = 1;
	fog_scale = 4.52312;
	sun_col_r = 1;
	sun_col_g = 1;
	sun_col_b = 1;
	sun_dir_x = 0.430549;
	sun_dir_y = -0.30818;
	sun_dir_z = 0.848323;
	sun_start_ang = 0;
	sun_stop_ang = 0;
	time = 0;
	max_fog_opacity = 0.901283;

       setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
       sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
       sun_stop_ang, time, max_fog_opacity);

}      