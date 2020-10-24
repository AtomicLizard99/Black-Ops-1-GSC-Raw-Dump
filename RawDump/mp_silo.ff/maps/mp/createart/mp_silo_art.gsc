//_createart generated.  modify at your own risk. Changing values should be fine.
main()
{

	level.tweakfile = true;
 
	//* Fog section * 


start_dist = 362.669;
	half_dist = 4200;
	half_height = 946.397;
	base_height = 37.9929;
	fog_r = 0.537255;
	fog_g = 0.603922;
	fog_b = 0.678431;
	fog_scale = 10;
	sun_col_r = 0.870588;
	sun_col_g = 0.796079;
	sun_col_b = 0.72549;
	sun_dir_x = -0.460823;
	sun_dir_y = 0.765521;
	sun_dir_z = 0.449021;
	sun_start_ang = 0;
	sun_stop_ang = 58.8056;
	time = 0;
	max_fog_opacity = 1;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);





	VisionSetNaked( "mp_silo", 0 );
	SetDvar( "r_lightGridEnableTweaks", 1 );
	SetDvar( "r_lightGridIntensity", 1.8 );
	SetDvar( "r_lightGridContrast", 0.3 );
	
	SetDvar("r_skyColorTemp", (6000));
}


