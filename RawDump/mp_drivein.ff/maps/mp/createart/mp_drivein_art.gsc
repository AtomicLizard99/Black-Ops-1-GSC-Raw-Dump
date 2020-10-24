//_createart generated.  modify at your own risk. Changing values should be fine.
main()
{

	level.tweakfile = true;
	
 	setdvar("visionstore_glowTweakEnable", "0");
	setdvar("visionstore_glowTweakRadius0", "5");
	setdvar("visionstore_glowTweakRadius1", "");
	setdvar("visionstore_glowTweakBloomCutoff", "0.5");
	setdvar("visionstore_glowTweakBloomDesaturation", "0");
	setdvar("visionstore_glowTweakBloomIntensity0", "1");
	setdvar("visionstore_glowTweakBloomIntensity1", "");
	setdvar("visionstore_glowTweakSkyBleedIntensity0", "");
	setdvar("visionstore_glowTweakSkyBleedIntensity1", "");
	setdvar("r_skyColorTemp", "6128");
	setdvar("r_dof_farBlur", "3");
	setdvar("r_dof_farStart", "1024");
	setdvar("r_dof_farEnd", "7500");
	
	//* Fog section * 
	start_dist = 2395.04;
	half_dist = 2982.86;
	half_height = 877.804;
	base_height = 653.432;
	fog_r = 0.294118;
	fog_g = 0.490196;
	fog_b = 0.458824;
	fog_scale = 7.32271;
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

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);



		
	VisionSetNaked( "mp_drivein", 0 );
	SetDvar( "r_lightGridEnableTweaks", 1 );
	SetDvar( "r_lightGridIntensity", 2.702 );
	SetDvar( "r_lightGridContrast", 3.825 );
	
	SetDvar("r_skyColorTemp", (7500));
}

