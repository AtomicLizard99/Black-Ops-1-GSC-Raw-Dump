// Test clientside script for mp_area51

#include clientscripts\mp\_utility;

main()
{
	fxanim_system_init();
	level.onPlayerConnect = clientscripts\mp\mp_area51::on_player_connect;
	
	// team nationality
	clientscripts\mp\_teamset_urbanspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_area51_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_area51_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	init_level_helicopter_fog();

	println("*** Client : mp_area51 running...");
}

init_level_helicopter_fog()
{
  level.helicopter_fog = true;
	start_dist = 2784.78;
	half_dist = 1701.41;
	half_height = 2958.39;
	base_height = 599.451;
	fog_r = 0.745098;
	fog_g = 0.784314;
	fog_b = 0.901961;
	fog_scale = 6.26865;
	sun_col_r = 1;
	sun_col_g = 0.921569;
	sun_col_b = 0.607843;
	sun_dir_x = -0.0316319;
	sun_dir_y = -0.770649;
	sun_dir_z = 0.636474;
	sun_start_ang = 1.57151;
	sun_stop_ang = 50.367;
	time = 0;
	max_fog_opacity = 0.714674;

  setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
} 


on_player_connect( localClientNum )
{ 
/#
	if ( GetDvar( #"createfx" ) == "on" || GetDvar( #"createfx" ) == "1" )
	{
		return;
	}
#/

	towers = GetEntArray( localClientNum, "area51_radio_tower", "targetname" );
	array_thread( towers, ::radio_tower_think, localClientNum );

	apples = GetEntArray( localClientNum, "apple", "targetname" );
	array_thread( apples, ::apple_think, localClientNum );

	anti_gravity_spinners = GetEntArray( localClientNum, "anti_gravity_spinner", "targetname" );
	array_thread( anti_gravity_spinners, ::anti_gravity_spinner_think, localClientNum );
	
	fxanims = GetEntArray( localClientNum, "fxanim_area51", "targetname" );
	dust = 0;

	for ( i = 0; i < fxanims.size; i++ )
	{
		if ( fxanims[i].model == "fxanim_mp_dustdevil_mod" )
		{
			fxanims[i] thread fxanim_dustdevil_think( localClientNum, dust );
			dust++;
		}
		else
		{
			fxanims[i] fxanim_init( localClientNum, i );
		}
	}
}

#using_animtree( "fxanim_props_dlc4" );
fxanim_system_init()
{
	level.area51_fxanims = [];
	level.area51_fxanims[ "fxanim_mp_roofvent_snow" ]		= %fxanim_mp_roofvent_snow_anim;
	level.area51_fxanims[ "fxanim_mp_a51_cardboard_box" ]	= %fxanim_mp_a51_cardboard_box_anim;
	level.area51_fxanims[ "fxanim_gp_chain02" ]				= %fxanim_gp_chain02_anim;
	level.area51_fxanims[ "fxanim_gp_chain03" ]				= %fxanim_gp_chain03_anim;
	level.area51_fxanims[ "fxanim_gp_wirespark_med" ]		= %fxanim_gp_wirespark_med_anim;
	level.area51_fxanims[ "fxanim_gp_wirespark_long" ]		= %fxanim_gp_wirespark_long_anim;
	level.area51_fxanims[ "fxanim_mp_a51_wire_loops" ]		= %fxanim_mp_a51_wire_loops_anim;
	level.area51_fxanims[ "fxanim_mp_dustdevil" ]			= %fxanim_mp_dustdevil_anim;

	level.area51_fx = [];
	level.area51_fx[ "fx_elec_spark" ]				= loadfx( "env/electrical/fx_elec_wire_spark_burst_xsm" );
	level.area51_fx[ "fx_mp_sand_dust_devil" ]		= loadfx( "maps/mp_maps/fx_mp_sand_dust_devil" );	

	level.waits = [];
	level.speeds = [];

	for ( i = 0; i < 128; i++ )
	{
		level.waits[ i ] = RandomFloatRange( 0.1, 1.5 );
		level.speeds[ i ] = RandomFloatRange( 0.75, 1.4 );
	}

	for ( i = 0; i < 64; i++ )
	{
		level.dustdevil_waits[ i ] = RandomFloatRange( 15, 30 );
	}
}

fxanim_init( localClientNum, index )
{
	switch ( self.model )
	{
		case "fxanim_mp_roofvent_mod":
			self thread fxanim_think( localClientNum, "fxanim_mp_roofvent_snow", level.waits[index], level.speeds[index] );
		break;

		case "fxanim_mp_a51_cardboard_box_mod":
			self thread fxanim_think( localClientNum, "fxanim_mp_a51_cardboard_box", level.waits[index], level.speeds[index] );
		break;

		case "fxanim_gp_chain02_mod":
			self thread fxanim_think( localClientNum, "fxanim_gp_chain02", level.waits[index], 1.0 );
		break;

		case "fxanim_gp_chain03_mod":
			self thread fxanim_think( localClientNum, "fxanim_gp_chain03", level.waits[index], 1.0 );
		break;

		case "fxanim_gp_wirespark_med_mod":
			self thread fxanim_wire_think( localClientNum, "fxanim_gp_wirespark_med", level.waits[index], level.speeds[index] );
		break;

		case "fxanim_gp_wirespark_long_mod":
			self thread fxanim_wire_think( localClientNum, "fxanim_gp_wirespark_long", level.waits[index], level.speeds[index] );
		break;

		case "fxanim_mp_a51_wire_loops_mod":
			self thread fxanim_think( localClientNum, "fxanim_mp_a51_wire_loops", level.waits[index], 1.0 );
		break;

		case "fxanim_mp_dustdevil_mod":
		break;

		default:
			println( "unknown fxanim: '" + self.model + "'" );
		break;
	}
}

fxanim_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "entityshutdown" );
	self waittill_dobj( localClientNum );

	if ( !IsDefined( wait_time ) )
	{
		wait_time = 0;
	}

	if ( !IsDefined( speed ) )
	{
		speed = 1.0;
	}

	if ( wait_time > 0 )
	{
		wait( wait_time );
	}
	
	self UseAnimTree( #animtree );
	self SetAnim( level.area51_fxanims[ anim_index ], 1.0, 0.0, speed );
}

fxanim_wire_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "entityshutdown" );
	self waittill_dobj( localClientNum );
	
	self UseAnimTree( #animtree );
	wait( wait_time );

	self SetFlaggedAnim( "wire_fx", level.area51_fxanims[ anim_index ], 1.0, 0.0, speed );

	for ( ;; )
	{
		self waittill( "wire_fx", note );
		//println( "@@@ got note: " + note );

		if ( anim_index == "fxanim_gp_wirespark_long" )
		{
			PlayFxOnTag( localClientNum, level.area51_fx[ "fx_elec_spark" ], self, "long_spark_06_jnt" );
		}
		else if ( anim_index == "fxanim_gp_wirespark_med" )
		{
			PlayFxOnTag( localClientNum, level.area51_fx[ "fx_elec_spark" ], self, "med_spark_06_jnt" );
		}
	}
}

fxanim_dustdevil_think( localClientNum, index )
{
	self endon( "entityshutdown" );
	self waittill_dobj( localClientNum );

	self UseAnimTree( #animtree );

	initial_wait = level.dustdevil_waits[ index ] * ( index + 1 );
	wait( initial_wait );

	for ( ;; )
	{
		for ( i = 0; i < level.dustdevil_waits.size; i++ )
		{
			wait( level.dustdevil_waits[i] );

			self SetAnimRestart( level.area51_fxanims["fxanim_mp_dustdevil"], 1.0, 0.0, 1.0 );

			dust = PlayFxOnTag( localClientNum, level.area51_fx["fx_mp_sand_dust_devil"], self, "dervish_jnt" );
			wait( 12 );

			StopFx( localClientNum, dust );
		}
	}
}

radio_tower_think( localClientNum )
{
	self endon ( "entityshutdown" );
	self waittill_dobj( localClientNum );

	// fx
	fx = [];

	for ( i = 0; i < 3; i++ )
	{
		fx[i] = Spawn( localClientNum, self.origin, "script_model" );
		fx[i] SetModel( "tag_origin" );
	}

	fx[0].angles = self.angles + ( 0, 60, 0 );
	fx[1].angles = self.angles + ( 0, -60, 0 );
	fx[2].angles = self.angles + ( 0, 180, 0 );

	wait( 1 );

	for ( i = 0; i < 3; i++ )
	{
		PlayFxOnTag( localClientNum, level._effect["fx_radio_tower_flare"], fx[i], "tag_origin" );
	}

	// rotation parameters
	direction = 1;
	rotate_time = 12;

	if ( IsDefined( self.script_float ) && self.script_float != 0 )
	{
		if ( self.script_float < 0 )
		{
			direction = -1;
		}

		rotate_time = Abs( self.script_float );
	}

	for ( ;; )
	{
		self RotateYaw( 360 * direction, rotate_time );

		for ( i = 0; i < 3; i++ )
		{
			fx[i] RotateYaw( 360 * direction, rotate_time );
		}

		self waittill( "rotatedone" );
	}
}

apple_think( localClientNum )
{
	self thread apple_rotate( localClientNum ); 
	self thread apple_move( localClientNum );
	level thread apple_damage( localClientNum );
}

anti_gravity_spinner_think( localClientNum )
{
	self endon ( "entityshutdown" );
	self waittill_dobj( localClientNum );
	
	rotateTime = 10.0;
	accelTime = 4.0;
	decelTime = 4.0;
	yaw = 5000;
		
	// rotate the anti gravity spinner forever
	while( true )
	{
		/#
		rotateTime = getDvarFloatDefault( #"scr_AG_rotateTime", rotateTime );
		accelTime = getDvarFloatDefault( #"scr_AG_accel", accelTime );
		decelTime = getDvarFloatDefault( #"scr_AG_decel", decelTime );
		yaw = getDvarFloatDefault( #"scr_AG_yaw", yaw );
		#/
		
		self RotateYaw( yaw, rotateTime, accelTime, decelTime );
		self waittill("rotatedone");
		self RotateYaw( (0-yaw), rotateTime, accelTime, decelTime );
		self waittill("rotatedone");

	}
}

apple_rotate( localClientNum )
{
	self endon ( "entityshutdown" );
	self waittill_dobj( localClientNum );

	rotate_time = 12;
	
	// slowly rotate the apple forever
	while( true )
	{
		self.angles = ( 0, 300, 0 );
		self RotateYaw( 360 * 100, rotate_time * 100 );

		wait( rotate_time - 1 );
	}
}

apple_move( localClientNum )
{
	self endon ( "entityshutdown" );
	self waittill_dobj( localClientNum );

	move_time 		= 3;
	move_distance 	= 1;
	
	self movez( move_distance * -1, move_time );
	self waittill( "movedone" ); 
	
	// slowly move the apple up and down forever
	while( true )
	{
		self movez( move_distance * 2, move_time, 1.5 ,1.5 );
		self waittill( "movedone" );
		
		move_distance = move_distance * -1;
	}
}

apple_damage( localClientNum )
{
	exploders = [];

	for ( i = 5001; i <= 5020; i++ )
	{
		exploders[ exploders.size ] = exploder_find( i );
	}
	
	for ( ;; )
	{
		level waittill( "afx" ); // "apple fx" 

		richocetCount = RandomIntRange( 3, 7 );

		level thread playRichocets( localClientNum, richocetCount, exploders );
	}
}

playRichocets( localClientNum, richocetCount, exploders )
{
	for ( i = 0; i < richocetCount; i++ )
	{
		exploderIndex = randomInt( exploders.size );
		// sound hook for bullet richochet
		PlaySound( 0, "prj_bullet_ricochet" , exploders[ exploderIndex ].v[ "origin" ] );

		clientscripts\mp\_fx::exploder( localClientNum, exploders[ exploderIndex ].v[ "exploder" ] );
		wait( 0.25 );
	}
}

exploder_find( num )
{
	num = int( num );

	for( i = 0; i < level.createFXent.size; i++ )
	{
		ent = level.createFXent[ i ];

		if( !isdefined( ent ) )
			continue;
	
		if( ent.v[ "type" ] != "exploder" )
			continue;	
	
		if( !isdefined( ent.v[ "exploder" ] ) )
			continue;

		if( ent.v[ "exploder" ] != num )
			continue;

		return ent;
	}

	return undefined;
}

