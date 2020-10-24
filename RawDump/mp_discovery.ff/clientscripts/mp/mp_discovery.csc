// Test clientside script for mp_discovery

#include clientscripts\mp\_utility;

main()
{
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_winterspecops::level_init();
	
	// _load!
	clientscripts\mp\_load::main();

	thread clientscripts\mp\mp_discovery_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_discovery_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

  init_level_helicopter_fog();

	println("*** Client : mp_discovery running...");
}

init_level_helicopter_fog()
{
  level.helicopter_fog = true;
	start_dist = 298.204;
	half_dist = 546.463;
	half_height = 500.628;
	base_height = -381.429;
	fog_r = 0.819608;
	fog_g = 0.870588;
	fog_b = 1;
	fog_scale = 2.84617;
	sun_col_r = 0.407843;
	sun_col_g = 0.905882;
	sun_col_b = 0.329412;
	sun_dir_x = 0.284887;
	sun_dir_y = -0.953912;
	sun_dir_z = 0.0942954;
	sun_start_ang = 28.2004;
	sun_stop_ang = 50.3143;
	time = 0;
	max_fog_opacity = 1;
       
  setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
}      
