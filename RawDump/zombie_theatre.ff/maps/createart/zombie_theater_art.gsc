//_createart generated.  modify at your own risk. Changing values should be fine.

main()
{

	level.tweakfile = true;
 /*
 //These values don't appear to be called, it seems teh dog call in the .csc is the default fog
start_dist = 117.888;
	half_dist = 1956.99;
	half_height = 1712.49;
	base_height = -2341.86;
	fog_r = 0.184314;
	fog_g = 0.372549;
	fog_b = 0.329412;
	fog_scale = 1.9974;
	sun_col_r = 1;
	sun_col_g = 1;
	sun_col_b = 1;
	sun_dir_x = 0.291692;
	sun_dir_y = -0.720765;
	sun_dir_z = 0.628819;
	sun_start_ang = 0;
	sun_stop_ang = 34.8781;
	time = 0;
	max_fog_opacity = 1;
*/

start_dist = 155.625;
	half_dist = 2332.79;
	half_height = 677.241;
	base_height = 23.2733;
	fog_r = 0.639216;
	fog_g = 0.639216;
	fog_b = 0.639216;
	fog_scale = 1;
	sun_col_r = 0.243137;
	sun_col_g = 0.270588;
	sun_col_b = 0.270588;
	sun_dir_x = 0.291692;
	sun_dir_y = -0.720765;
	sun_dir_z = 0.628819;
	sun_start_ang = 0;
	sun_stop_ang = 0;
	time = 0;
	max_fog_opacity = 1;


	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);
		
	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);

	level thread fog_settings();
	VisionSetNaked( "zombie_theater", 0 );
	SetSavedDvar( "sm_sunSampleSizeNear", "0.93" );
	// SetSavedDvar( "r_skyTransition", "1" );
	///////////New Hero Lighting///////////////
	SetSavedDvar( "r_lightGridEnableTweaks", 1 );
	SetSavedDvar( "r_lightGridIntensity", 1.45 );
	SetSavedDvar( "r_lightGridContrast", 0.15 );
	
	//SetSavedDvar( "r_skyColorTemp", 5000.0 );
	SetSavedDvar("r_lightTweakSunLight", 22);
	//SetSunLight(0.661, 0.6228, 0.727);
	
}

fog_settings()
{
  
}