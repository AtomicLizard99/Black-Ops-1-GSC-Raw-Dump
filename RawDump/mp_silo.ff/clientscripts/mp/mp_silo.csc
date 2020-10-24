// Test clientside script for mp_silo

#include clientscripts\mp\_utility;

main()
{
	level.onPlayerConnect = clientscripts\mp\mp_silo::on_player_connect;

	// team nationality
	clientscripts\mp\_teamset_urbanspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_silo_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_silo_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : mp_silo running...");
	
	init_level_helicopter_fog();
	level thread rocket_manager();
}

on_player_connect( localClientNum )
{
/#
	if ( GetDvar( #"createfx" ) == "on" || GetDvar( #"createfx" ) == "1" )
	{
		return;
	}
#/
	
	level thread rocket_init( localClientNum );
}

rocket_manager()
{
	exploders = [];
	exploders[ exploders.size ] = 100;
	exploders[ exploders.size ] = 101;
	exploders[ exploders.size ] = 102;
	exploders[ exploders.size ] = 103;
	exploders[ exploders.size ] = 104;
	exploders[ exploders.size ] = 105;
	
	rocket_waits = [];
	rocket_waits[0] = RandomIntRange( 20, 40 );

/#
	if ( GetDvarInt( #"silo_rocket_test" ) > 0 )
	{
		wait_time = GetDvarInt( #"silo_rocket_test" );

		for ( i = 0; exploders.size > 0; i++ )
		{
			wait( wait_time );

			id = random( exploders );
			exploders = array_remove( exploders, id );

			level notify( "rocket_launch", id );
		}

		wait( 1 );
	}
#/

	for ( i = 1; i < exploders.size; i++ )
	{
		rocket_waits[i] = RandomIntRange( 50, 80 );

		if ( RandomInt( 100 ) < 20 )
		{
			rocket_waits[i] = RandomIntRange( 20, 40 );
		}
	}

	for ( i = 0; exploders.size > 0; i++ )
	{
		wait( rocket_waits[i] );
		
		id = random( exploders );
		exploders = array_remove( exploders, id );

		level notify( "rocket_launch", id );
		wait( 20 );
	}

	level notify( "rocket_finish" );
}

rocket_init( localClientNum )
{
	level endon( "rocket_finish" );

	hatches = GetEntArray( localClientNum, "silo_rocket_hatch", "targetname" );
	rockets = GetEntArray( localClientNum, "silo_rocket", "targetname" );
	
	exploders = [];
	exploders[ exploders.size ] = 106;
	exploders[ exploders.size ] = 107;

	for ( i = 0; i < exploders.size; i++ )
	{
		rocket_hatch_open( localClientNum, exploders[i], hatches );
	}

	for ( ;; )
	{
		level waittill( "rocket_launch", id );

		ent = find_exploder( id );

		hatch = get_closest( ent.v[ "origin" ], hatches );
		hatches = array_remove( hatches, hatch );

		rocket = get_closest( ent.v[ "origin" ], rockets );
		rockets = array_remove( rockets, rocket );

		hatch thread rocket_launch_think( localClientNum, rocket, id );
	}
}

rocket_launch_think( localClientNum, rocket, fx_id )
{
	self endon ( "entityshutdown" );
	self waittill_dobj( localClientNum );

	self RotateRoll( 90, 5, .5, 1 );
	rocket playloopsound ( "amb_alarm_buzz", .20 );
	self playsound ( 0, "evt_hatch_open");
	self waittill( "rotatedone" );

	wait( 1 );
	rocket stoploopsound ( .20 );
	// sound hook for initial exhaust
	rocket playsound(0, "evt_missile_charge" );
	clientscripts\mp\_fx::exploder( localClientNum, fx_id );
	wait( 3 );

	// sound hook for rocket launch
	rocket playsound(0, "evt_missile_launch" );
	//hatch playsound ( 0, "evt_hatch_open" );
	rocket MoveTo( rocket.origin + ( 0, 0, 100000 ), 25, 10 );
	PlayFxOnTag( localClientNum, level._effect["rocket_blast_trail"], rocket, "tag_fx_thruster" );
	
	rocket waittill( "movedone" );
	rocket Hide();

	wait( 40 );
	rocket delete();
}

rocket_hatch_open( localClientNum, fx_id, hatches )
{
	ent = find_exploder( fx_id );
	hatch = get_closest( ent.v[ "origin" ], hatches );

	hatch waittill_dobj( localClientNum );
	hatch.angles = ( 0, 0, 90 );
}

find_exploder( id )
{
	for( i = 0; i < level.createFXent.size; i++ )
	{
		ent = level.createFXent[ i ];

		if( !isdefined( ent ) )
			continue;
	
		if( ent.v[ "type" ] != "exploder" )
			continue;	
	
		if( !isdefined( ent.v[ "exploder" ] ) )
			continue;

		if( ent.v[ "exploder" ] == id )
		{
			return ent;
		}
	}

	return undefined;
}

array_remove( ents, remover )
{
	newents = []; 
	// if this array is a simple numbered array - array keys will return the array in a reverse order
	// causing the array that is returned from this function to be flipped, that is an un expected 
	// result, which is why we're counting down in the for loop instead of the usual counting up
	keys = getArrayKeys( ents );

	// Returns array with index of ints
	for( i = keys.size - 1; i >= 0; i-- )
	{
		if( ents[ keys[ i ] ] != remover )
		{
			newents[ newents.size ] = ents[ keys[ i ] ];
		}
	}

	return newents; 
}

get_closest( origin, array )
{
	closestDistSq = 999999;
	closest = undefined;

	for ( i = 0; i < array.size; i++ )
	{
		distSq = DistanceSquared( origin, array[i].origin );
		
		if ( distSq < closestDistSq )
		{
			closestDistSq = distSq;
			closest = array[i];
		}
	}

	return closest;
}

init_level_helicopter_fog()
{
  level.helicopter_fog = true;
     start_dist = 1674.13;
	half_dist = 3000;
	half_height = 3177.77;
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


       
  setClientVolumetricFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
  sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
  sun_stop_ang, time, max_fog_opacity);
}   




