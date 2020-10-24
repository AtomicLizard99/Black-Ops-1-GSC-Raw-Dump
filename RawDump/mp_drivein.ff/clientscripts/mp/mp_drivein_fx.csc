#include clientscripts\mp\_utility; 



precache_scripted_fx()
{
	//level._effect["fx_mp_drivein_light_movingspot"]			= loadfx("maps/mp_maps/fx_mp_drivein_light_movingspot");	
}

precache_createfx_fx()
{
	//lights//
	level._effect["fx_mp_drivein_projector_beam"]							=loadfx("maps/mp_maps/fx_mp_drivein_projector_beam");
	level._effect["fx_mp_drivein_screen_01"]									=loadfx("maps/mp_maps/fx_mp_drivein_screen_01");
	level._effect["fx_mp_drivein_screen_wood"]								=loadfx("maps/mp_maps/fx_mp_drivein_screen_wood");	
	level._effect["fx_mp_drivein_light_fluorescent"]					=loadfx("maps/mp_maps/fx_mp_drivein_light_fluorescent");
	level._effect["fx_mp_drivein_light_fluorescent_flkr"]			=loadfx("maps/mp_maps/fx_mp_drivein_light_fluorescent_flkr");
	level._effect["fx_mp_drivein_light_flood"]								=loadfx("maps/mp_maps/fx_mp_drivein_light_flood");
	level._effect["fx_mp_drivein_light_tinhat"]								=loadfx("maps/mp_maps/fx_mp_drivein_light_tinhat");	
	level._effect["fx_mp_drivein_godray_md"]									=loadfx("maps/mp_maps/fx_mp_drivein_godray_md"); 
	level._effect["fx_mp_drivein_godray_lg"]									=loadfx("maps/mp_maps/fx_mp_drivein_godray_lg");	

	level._effect["fx_light_beacon_yllw_police_horse"]				= loadfx("env/light/fx_light_beacon_yllw_police_horse2");
	
	//Debris_Dust//	
	level._effect["fx_mp_leaves_falling"]											=loadfx("maps/mp_maps/fx_mp_leaves_falling");
	level._effect["fx_mp_drivein_dust_debirs_lrg"]						=loadfx("maps/mp_maps/fx_mp_drivein_dust_debirs_lrg");	
	level._effect["fx_mp_drivein_debris_papers"]							=loadfx("maps/mp_maps/fx_mp_drivein_debris_papers");
	level._effect["fx_mp_drivein_dust_crumble_runner"]				=loadfx("maps/mp_maps/fx_mp_drivein_dust_crumble_runner");	
	
	level._effect["fx_leaves_falling_lite"]										= loadfx("env/foliage/fx_leaves_falling_lite");
	level._effect["fx_leaves_falling_lite_w"]      						= loadfx("env/foliage/fx_leaves_falling_lite_w_sm");
	level._effect["fx_leaves_ground_windy"]      							= loadfx("env/foliage/fx_leaves_ground_windy");
	level._effect["fx_leaves_ground_windy_narrow"]      			= loadfx("env/foliage/fx_leaves_ground_windy_narrow");
	level._effect["fx_leaves_ground_windy_short"]      				= loadfx("env/foliage/fx_leaves_ground_windy_short");	

	level._effect["fx_mp_sand_windy_slow_sm_os_red"]					= loadfx("maps/mp_maps/fx_mp_sand_windy_slow_sm_os_red");	
	level._effect["fx_mp_sand_windy_slow_sm_os"]							= loadfx("maps/mp_maps/fx_mp_sand_windy_slow_sm_os_light");	
	
	level._effect["fx_debris_papers"]													= loadfx("env/debris/fx_debris_papers");
	level._effect["fx_debris_papers_short_int"]								= loadfx("env/debris/fx_debris_papers_short_int");	
	
	//Fire//	
	
	//Smoke_Fog//
	level._effect["fx_mp_dlc4_silo_dust_motes_interior"]			=loadfx("maps/mp_maps/fx_mp_dlc4_silo_dust_motes_interior");
	level._effect["fx_mp_drivein_smk_blk_md"]									=loadfx("maps/mp_maps/fx_mp_drivein_smk_blk_md");
	level._effect["fx_mp_firebase_smoldering_tree"]						=loadfx("maps/mp_maps/fx_mp_firebase_smoldering_tree");
	level._effect["fx_mp_drivein_fog_vista"]									=loadfx("maps/mp_maps/fx_mp_drivein_fog_vista");
	level._effect["fx_mp_drivein_steam_vent"]									=loadfx("maps/mp_maps/fx_mp_drivein_steam_vent");	
	
	//Water//
	level._effect["fx_water_faucet_drip_fast"]								=loadfx("env/water/fx_water_faucet_drip_fast");		
	
	//Insects//
 	level._effect["fx_mp_drivein_bio_dragonflies"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_dragonflies");	
 	level._effect["fx_mp_drivein_bio_moths_light"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_moths_light");	
 	level._effect["fx_mp_drivein_bio_roaches"]								=loadfx("maps/mp_maps/fx_mp_drivein_bio_roaches");	
 	level._effect["fx_mp_drivein_bio_fireflies"]							=loadfx("maps/mp_maps/fx_mp_drivein_bio_fireflies");
	level._effect["fx_mp_drivein_bio_fly_swarm"]							=loadfx("bio/insects/fx_insects_swarm_md_light");
	level._effect["fx_mp_drivein_bio_spider_burst_runner"]		=loadfx("maps/mp_maps/fx_mp_drivein_bio_spider_burst_runner");
	level._effect["fx_mp_drivein_bio_spider_crawl"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_spider_crawl");
	level._effect["fx_mp_drivein_bio_grasshoppers"]						=loadfx("maps/mp_maps/fx_mp_drivein_bio_grasshoppers");		
		
	//Sparks//
	level._effect["fx_mp_elec_spark_burst_sm"]								=loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm");
	level._effect["fx_mp_elec_spark_burst_sm_runner"]					=loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm_runner");
	level._effect["fx_mp_elec_spark_burst_xsm_thin_runner"]		=loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin_runner");
	
	//Cut//
	//level._effect["fx_debris_papers"]							=loadfx("env/debris/fx_debris_papers");	
	//level._effect["fx_insects_dragonflies_ambient"]			=loadfx("bio/insects/fx_insects_dragonflies_ambient");

	
}

#using_animtree( "fxanim_props_dlc4" ); //.atr
precache_fx_prop_anims()
{
	level._fxanims = [];
	level._fxanims[ "fxanim_gp_wirespark_med_anim" ]				= %fxanim_gp_wirespark_med_anim;
	level._fxanims[ "fxanim_gp_wirespark_long_anim" ] 				= %fxanim_gp_wirespark_long_anim;
	level._fxanims[ "fxanim_gp_snake_coiled_loop_anim" ] 			= %fxanim_gp_snake_coiled_loop_anim;
	level._fxanims[ "fxanim_drv_spring_rider_rocket_01" ] 			= %fxanim_drv_spring_rider_rocket_01;
	
	level._fxanimfx = [];
	level._fxanimfx[ "fx_elec_wire_spark_burst_xsm" ] 				= loadfx( "env/electrical/fx_elec_wire_spark_burst_xsm" );
	level.waits = [];
	level.speeds = [];	
	// Create a randomizer
	for ( i = 0; i < 32; i++ )
	{
		level.waits[ i ] = RandomFloatRange( 0.1, 1.5 );
		level.speeds[ i ] = RandomFloatRange( 0.75, 1.4 );
	}
}


play_fx_prop_anims( localClientNum )
{
	// Placed in the editor, 32 max

	fxanim_wires = GetEntArray( localClientNum, "fxanim_wire_spark", "targetname" );
	if (fxanim_wires.size!=0)
	{
		for ( i = 0; i < fxanim_wires.size; i++ )
		{
			// Based on item.script_noteworthy
			fxanim_wires[i] thread fxanim_wire_think( localClientNum, fxanim_wires[i].script_noteworthy, level.waits[i], level.speeds[i]);
		}
	}
	fxanim_snakes = GetEntArray( localClientNum, "fxanim_snake", "targetname" );
	if (fxanim_snakes.size!=0)
	{
		for ( i = 0; i < fxanim_snakes.size; i++ )
		{
			fxanim_snakes[i] thread fxanim_snake_think(localClientNum);
		}
	}
	fxanim_spring_riders = GetEntArray( localClientNum, "fxanim_spring_rider", "targetname" );
	if (fxanim_spring_riders.size!=0)
	{
		for ( i = 0; i < fxanim_spring_riders.size; i++ )
		{
			fxanim_spring_riders[i] thread fxanim_spring_rider_think(localClientNum);
		}
	}
}
fxanim_snake_think( localClientNum )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );
	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );
	self SetFlaggedAnim( "snake_fx", level._fxanims[ "fxanim_gp_snake_coiled_loop_anim" ] );
}
fxanim_spring_rider_think( localClientNum )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );
	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );
	self SetFlaggedAnim( "spring_rider_fx", level._fxanims[ "fxanim_drv_spring_rider_rocket_01" ] );
}
fxanim_wire_think( localClientNum, anim_index, wait_time, speed )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );
	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );
	wait( wait_time );
	self SetFlaggedAnim( "wire_fx", level._fxanims[ anim_index ], 1.0, 0.0, speed );
	for (;;)
	{
		self waittill( "wire_fx", note );
		//println( "@@@ got note: " + note );
		if ( anim_index == "fxanim_gp_wirespark_long_anim" )
		{
			PlayFxOnTag( localClientNum, level._fxanimfx[ "fx_elec_wire_spark_burst_xsm" ], self, "long_spark_06_jnt" );
		}
		else if ( anim_index == "fxanim_gp_wirespark_med_anim" )
		{
			PlayFxOnTag( localClientNum, level._fxanimfx[ "fx_elec_wire_spark_burst_xsm" ], self, "med_spark_06_jnt" );
		}
	}
}

main()
{
	clientscripts\mp\createfx\mp_drivein_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_createfx_fx();
	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
	
	//level thread spot_lights();
	// FXAnims:
	precache_fx_prop_anims();
	waitforclient( 0 );
	//wait( 3 );
	players = GetLocalPlayers();
	for ( i = 0; i < players.size; i++ )
	{
		play_fx_prop_anims( i );
	}
}

spot_lights()
{
	wait(1);
	
	spot_light_struct = GetStructArray( "spot_light", "targetname" );
	
	if( !isDefined(spot_light_struct) || spot_light_struct.size == 0 )
	{
		return;
	}
	
	players = getlocalplayers();
	
	for( i = 0; i < players.size; i++ )
	{
		for( x = 0; x < spot_light_struct.size; x++)
		{
			// spawn a script model at the script struct location
			spot_light_script_model = Spawn( i, spot_light_struct[x].origin, "script_model" );
			spot_light_script_model.angles = spot_light_struct[x].angles;
			spot_light_script_model SetModel( "tag_origin" );
			
			// play the effect on the script model
			PlayFXOnTag( i, level._effect[ "fx_mp_drivein_light_movingspot" ], spot_light_script_model, "tag_origin" );
			
			// rotate the script model
			spot_light_script_model thread rotate_spot_light( 45, 5);
		}
	}
}

rotate_spot_light(rotation, time)
{
	rotate_func = ::RotateYaw_DriveIn;
	acceleration = 0.5;
	decceleration = 0.5;
	
	if( self.angles[2] == -90)
	{
		rotate_func = ::RotatePitch_DriveIn;
	}
	
	self [[rotate_func]]( rotation, time, acceleration, decceleration );
	self waittill("rotatedone");
		
	while( true )
	{
		self [[rotate_func]]( rotation * -2, time, acceleration, decceleration );
		self waittill("rotatedone");
		
		self [[rotate_func]]( rotation * 2, time, acceleration, decceleration );
		self waittill("rotatedone");
	}
}

RotateYaw_DriveIn( angle, time, accel, deccel )
{
	self RotateYaw(angle, time, accel, deccel);
}

RotatePitch_DriveIn( angle, time, accel, deccel )
{
	self RotatePitch(angle, time, accel, deccel);
}
