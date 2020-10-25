//_createart generated.  modify at your own risk. Changing values should be fine.
main()
{
	level.tweakfile = true;
	
	SetDvar("r_skyColorTemp", (8228.78));

	start_dist = 406;
	half_dist = 3201.78;
	half_height = 3799.33;
	base_height = 1.59365;
	fog_r = 0.647059;
	fog_g = 0.686275;
	fog_b = 1;
	fog_scale = 6.12107;
	sun_col_r = 1;
	sun_col_g = 0.921569;
	sun_col_b = 0.607843;
	sun_dir_x = -0.0316319;
	sun_dir_y = -0.770649;
	sun_dir_z = 0.636474;
	sun_start_ang = 1.57151;
	sun_stop_ang = 50.367;
	time = 0;
	max_fog_opacity = 0.624002;

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);

                
	VisionSetNaked( "mp_area51", 0 );
	SetDvar( "r_lightGridEnableTweaks", 1 );
	SetDvar( "r_lightGridIntensity", 1.94 );
	SetDvar( "r_lightGridContrast", 0.25 );
}

