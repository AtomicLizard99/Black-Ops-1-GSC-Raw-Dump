//_createart generated.  modify at your own risk. Changing values should be fine.
main()
{

	level.tweakfile = true;
 
	//* Fog section * 

	setdvar("scr_fog_exp_halfplane", "3759.28");
	setdvar("scr_fog_exp_halfheight", "243.735");
	setdvar("scr_fog_nearplane", "601.593");
	setdvar("scr_fog_red", "0.806694");
	setdvar("scr_fog_green", "0.962521");
	setdvar("scr_fog_blue", "0.9624");
	setdvar("scr_fog_baseheight", "-475.268");

	setdvar("visionstore_glowTweakEnable", "0");
	setdvar("visionstore_glowTweakRadius0", "5");
	setdvar("visionstore_glowTweakRadius1", "");
	setdvar("visionstore_glowTweakBloomCutoff", "0.5");
	setdvar("visionstore_glowTweakBloomDesaturation", "0");
	setdvar("visionstore_glowTweakBloomIntensity0", "1");
	setdvar("visionstore_glowTweakBloomIntensity1", "");
	setdvar("visionstore_glowTweakSkyBleedIntensity0", "");
	setdvar("visionstore_glowTweakSkyBleedIntensity1", "");	
	
 start_dist = 504.34;
	half_dist = 4859.89;
	half_height = 1402.62;
	base_height = -739.412;
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

	setVolFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);






	VisionSetNaked( "mp_nuked", 0 );
	SetDvar( "r_lightGridEnableTweaks", 1 );
	SetDvar( "r_lightGridIntensity", 1.4 );
	SetDvar( "r_lightGridContrast", .2 );
}
