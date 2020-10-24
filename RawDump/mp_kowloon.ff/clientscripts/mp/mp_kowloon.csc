// Test clientside script for mp_kowloon

#include clientscripts\mp\_utility;

main()
{
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_urbanspecops::level_init();
	
	// _load!
	clientscripts\mp\_load::main();

	thread clientscripts\mp\mp_kowloon_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_kowloon_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : mp_kowloon running...");

	waitforclient( 0 );
	
	init_level_helicopter_fog();
	
	wait( 1 );

	players = GetLocalPlayers();

	for ( i = 0; i < players.size; i++ )
	{
		animal_animation_init( i );
	}
}

#using_animtree( "mp_critter" );
animal_animation_init( localClientNum )
{
	level.monkey_anims = [];
	level.monkey_anims[ 0 ] = %a_monkey_freaked_01;
	level.monkey_anims[ 1 ] = %a_monkey_freaked_02;
	level.monkey_anims[ 2 ] = %a_monkey_freaked_03;

	level.chicken_anims = [];
	level.chicken_anims[ 0 ] = %a_chicken_freaked_01;
	level.chicken_anims[ 1 ] = %a_chicken_freaked_02;
	level.chicken_anims[ 2 ] = %a_chicken_freaked_03;

	monkeys = GetEntArray( localClientNum, "monkey", "targetname" );
	array_thread( monkeys, ::animal_animation_think, localClientNum );

	chickens = GetEntArray( localClientNum, "chicken", "targetname" );
	array_thread( chickens, ::animal_animation_think, localClientNum );
}

animal_animation_think( localClientNum )
{
	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );

	wait( RandomFloatRange( 0.1, 1.5 ) );

	if ( self.targetname == "monkey" )
	{
		num = RandomIntRange( 0, level.monkey_anims.size );
		self SetAnimRestart( level.monkey_anims[ num ], 1.0, 0.0, 1.0 );
	}
	else
	{
		num = RandomIntRange( 0, level.chicken_anims.size );
		self SetAnimRestart( level.chicken_anims[ num ], 1.0, 0.0, 1.0 );
	}
}
init_level_helicopter_fog()
{
       level.helicopter_fog = true;
       start_dist = 15667.3;
			 half_dist = 1470.51;
		   half_height = 8513.34;
		   base_height = 17609.3;
			 fog_r = 0.203922;
			 fog_g = 0.239216;
			 fog_b = 0.25098;
			 fog_scale = 3.68083;
			 sun_col_r = 0.552941;
			 sun_col_g = 0.686275;
			 sun_col_b = 0.729412;
			 sun_dir_x = 0.294217;
			 sun_dir_y = -0.174397;
			 sun_dir_z = 0.939693;
			 sun_start_ang = 0;
			 sun_stop_ang = 99.2932;
			 time = 0;
			 max_fog_opacity = 1;
       
       setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
              sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
              sun_stop_ang, time, max_fog_opacity);
}      


