// Test clientside script for mp_hotel

#include clientscripts\mp\_utility;

main()
{
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_cubans::level_init();

	// _load!
	clientscripts\mp\_load::main();

	thread clientscripts\mp\mp_hotel_fx::main();
	level._client_flag_callbacks["scriptmover"][level.const_flag_elevator_fx] = ::elevator_fx;
	level._client_flag_callbacks["scriptmover"][level.const_flag_elevator_floor_fx] = ::elevator_floor_fx;

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_hotel_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);
	
	init_level_helicopter_fog();

	println("*** Client : mp_hotel running...");
	thread slot_machine();
}

elevator_fx( localClientNum, set )
{
	if ( !set )
		return;

	PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_recessed_elevator" ], self, "tag_origin" );
}

elevator_floor_fx( localClientNum, set )
{
	if ( !IsDefined( self.fx ) )
	{
		self.fx = [];
		self.fx[ "lower" ] = [];
		self.fx[ "upper" ] = [];

		self.fx[ "lower" ][ "arrow" ] = undefined;
		self.fx[ "lower" ][ "floor" ] = undefined;
		self.fx[ "lower" ][ "arrow1" ] = undefined;
		self.fx[ "lower" ][ "floor1" ] = undefined;
		self.fx[ "upper" ][ "arrow" ] = undefined;
		self.fx[ "upper" ][ "floor" ] = undefined;
		self.fx[ "upper" ][ "arrow1" ] = undefined;
		self.fx[ "upper" ][ "floor1" ] = undefined;
	}

	if ( set )
	{
		// lower floor
		elevator_delete_fx( localClientNum, self.fx[ "upper" ] );

		self.fx[ "lower" ][ "arrow" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow_red" ], self, "tag_up" );
		self.fx[ "lower" ][ "floor" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow" ], self, "tag_14" );

		if ( self.model == "p_htl_elevator_components" )
		{
			self.fx[ "lower" ][ "arrow1" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow_red" ], self, "tag_up_1" );
			self.fx[ "lower" ][ "floor1" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow" ], self, "tag_14_1" );
		}
	}
	else
	{
		// upper floor
		elevator_delete_fx( localClientNum, self.fx[ "lower" ] );

		self.fx[ "upper" ][ "arrow" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow_red" ], self, "tag_down" );
		self.fx[ "upper" ][ "floor" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow" ], self, "tag_15" );

		if ( self.model == "p_htl_elevator_components" )
		{
			self.fx[ "upper" ][ "arrow1" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow_red" ], self, "tag_down_1" );
			self.fx[ "upper" ][ "floor1" ] = PlayFxOnTag( localClientNum, level._effect[ "fx_mp_light_elevator_num_glow" ], self, "tag_15_1" );
		}
	}
}

elevator_delete_fx( localClientNum, fx_pair )
{
	if ( IsDefined( fx_pair[ "arrow" ] ) )
	{
		DeleteFx ( localClientNum, fx_pair[ "arrow" ] );
	}

	if ( IsDefined( fx_pair[ "arrow1" ] ) )
	{
		DeleteFx ( localClientNum, fx_pair[ "arrow1" ] );
	}

	if ( IsDefined( fx_pair[ "floor" ] ) )
	{
		DeleteFx ( localClientNum, fx_pair[ "floor" ] );
	}

	if ( IsDefined( fx_pair[ "floor1" ] ) )
	{
		DeleteFx ( localClientNum, fx_pair[ "floor1" ] );
	}

	fx_pair[ "arrow" ] = undefined;
	fx_pair[ "floor" ] = undefined;
	fx_pair[ "arrow1" ] = undefined;
	fx_pair[ "floor1" ] = undefined;
}

slot_machine()
{
	wait( 1 );

	players = GetLocalPlayers();

	for ( i = 0; i < players.size; i++ )
	{
		slot_machine_init( i );
	}
}

slot_machine_init( localClientNum )
{
	destructibles = GetEntArray( localClientNum, "destructible", "targetname" );
	machines = [];

	for ( i = 0; i < destructibles.size; i++ )
	{
		if ( destructibles[i].destructibledef == "dest_hotel_slot_machine01" )
		{
			machines[ machines.size ] = destructibles[i];
		}
		else if ( destructibles[i].destructibledef == "dest_hotel_slot_machine02" )
		{
			machines[ machines.size ] = destructibles[i];
		}
	}

	for ( i = 0; i < machines.size; i++ )
	{
		machines[i] waittill_dobj( localClientNum );
		origin = machines[i] GetTagOrigin( "tag_wheel_fx" );
		angles = machines[i] GetTagAngles( "tag_wheel_fx" );

		wheel = Spawn( localClientNum, origin, "script_model" );
		wheel.angles = angles + ( 0, 90, 0 );
		wheel SetModel( "p_htl_slot_machine_symbols" );

		machines[i] thread spin_think( wheel );
		machines[i] thread death_think( wheel );
	}
}

spin_think( wheel )
{
	for ( ;; )
	{
		self waittill( "broken", event );
		
		if ( event == "coins" )
		{
			wheel RotateRoll( 180 * RandomFloatRange( 1, 3 ) + 360, RandomFloatRange( 3, 5 ), RandomFloatRange( .5, 1 ), RandomFloatRange( .5, 1 ) );
		}
		else if ( event == "dead" )
		{
			wheel SetModel( "p_htl_slot_machine_symbols_off" );
			return;
		}
	}
}

death_think( wheel )
{
	self waittill( "broken", event );

	if ( event == "dead" )
	{
		wheel SetModel( "p_htl_slot_machine_symbols_off" );
	}
}

init_level_helicopter_fog()
{
  level.helicopter_fog = true;
	start_dist = 1953.8;
	half_dist = 433.788;
	half_height = 9026.22;
	base_height = -7109.65;
	fog_r = 0.18;
	fog_g = 0.23;
	fog_b = 0.24;
	fog_scale = 2.56661;
	sun_col_r = 0.94902;
	sun_col_g = 0.560784;
	sun_col_b = 0.356863;
	sun_dir_x = 0.245844;
	sun_dir_y = -0.919734;
	sun_dir_z = 0.306025;
	sun_start_ang = 31;
	sun_stop_ang = 96.2698;
	time = 0;
	max_fog_opacity = 1;
       
  setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
}   