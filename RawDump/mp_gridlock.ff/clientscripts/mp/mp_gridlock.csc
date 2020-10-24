// Test clientside script for mp_gridlock

#include clientscripts\mp\_utility;

main()
{
	// team nationality
	clientscripts\mp\_teamset_urbanspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	thread clientscripts\mp\mp_gridlock_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_gridlock_amb::main();

	if ( !IsDemoPlaying() )
	{
		level._client_flag_callbacks[ "scriptmover" ][ level.const_flag_police_car ] = ::car_think;
	}


	// This needs to be called after all systems have been registered.
	waitforclient( 0 );

	init_level_helicopter_fog();

	println("*** Client : mp_gridlock running...");
}

init_level_helicopter_fog()
{
  level.helicopter_fog = true;
	start_dist = 3071.84;
	half_dist = 3072.58;
	half_height = 2557.46;
	base_height = 1802.83;
	fog_r = 0.686275;
	fog_g = 0.611765;
	fog_b = 0.505882;
	fog_scale = 7.78286;
	sun_col_r = 0.941177;
	sun_col_g = 0.984314;
	sun_col_b = 0.886275;
	sun_dir_x = 0.407867;
	sun_dir_y = -0.905491;
	sun_dir_z = 0.117176;
	sun_start_ang = 0;
	sun_stop_ang = 41.9828;
	time = 0;
	max_fog_opacity = 1;

	setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, time, max_fog_opacity);
}

   
//self is the police car ent
car_think( localClientNum, set )
{
	if ( set )
	{
		light_org = self gettagorigin( "tag_police_light" );

		self.policeLight = Spawn( localClientNum , light_org , "script_model" );
		self.policeLight SetModel( "tag_origin" );

		self.policeLight thread police_light_rotate();

		wait RandomFloatRange( .1, .2 );

		PlayFXOnTag( localClientNum, level._effect["fx_police_light"], self.policeLight, "tag_origin" );
	}
	else
	{
		if ( IsDefined( self.policeLight ) )
		{
			self.policeLight Delete();
		}
	}
}

//Self is the police light ent
police_light_rotate()
{
	self endon ( "entityshutdown" );

	//Stagger FX so it looks better
	wait RandomFloatRange( .1, .4 );

	while( 1 )
	{
		self RotateYaw( 360, 1 );

		self waittill( "rotatedone" );
	}

}
