
#include clientscripts\mp\_utility; 


precache_scripted_fx()
{
	level._effect["rocket_blast_trail"]							= loadfx("vehicle/exhaust/fx_russian_missile_exhaust_mp");
}

precache_createfx_fx()
{
	level._effect["fx_light_beacon_yllw"]		= loadfx("env/light/fx_light_beacon_yllw");
	level._effect["fx_light_bulb_incandescent_lg"]		= loadfx("env/light/fx_light_bulb_incandescent_lg");
	level._effect["fx_dlc4_silo_glow"]							= loadfx("maps/mp_maps/fx_dlc4_silo_glow");
	level._effect["fx_light_beacon_orange"] 					= loadfx("env/light/fx_light_beacon_orange");
	level._effect["fx_mp_distortion_wall_heater"] 				= loadfx("maps/mp_maps/fx_mp_distortion_wall_heater");
	level._effect["fx_mp_dlc4_rock_funnel"]						= loadfx("maps/mp_maps/fx_mp_dlc4_rock_funnel_runner");
	level._effect["fx_mp_dlc4_silo_belt_rocks"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_belt_rocks");
	level._effect["fx_mp_dlc4_silo_clouds_rolling"] 			= loadfx("maps/mp_maps/fx_mp_dlc4_silo_clouds_rolling");
	level._effect["fx_mp_dlc4_silo_clouds_vista"] 				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_clouds_vista");
	level._effect["fx_mp_dlc4_silo_drip_oil_multi"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_drip_oil_multi");
	level._effect["fx_mp_dlc4_silo_drip_water_multi"]			= loadfx("maps/mp_maps/fx_mp_dlc4_silo_drip_water_multi");	
	level._effect["fx_mp_dlc4_silo_dust_crumble_runner"]		= loadfx("maps/mp_maps/fx_mp_dlc4_silo_dust_crumble_runner");
	level._effect["fx_mp_dlc4_silo_dust_motes_interior"]		= loadfx("maps/mp_maps/fx_mp_dlc4_silo_dust_motes_interior");
	level._effect["fx_mp_dlc4_silo_floodlight_ext"]			 	= loadfx("maps/mp_maps/fx_mp_dlc4_silo_floodlight_ext");
 	level._effect["fx_mp_dlc4_silo_floodlight_xbright"]			= loadfx("maps/mp_maps/fx_mp_dlc4_silo_floodlight_xbright");
	level._effect["fx_mp_dlc4_silo_fog_nospiral"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_fog_nospiral");
	level._effect["fx_mp_dlc4_silo_godray_sm"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_godray_sm");
	level._effect["fx_mp_dlc4_silo_godray_lg"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_godray_lg");
	level._effect["fx_mp_dlc4_silo_gray_spread"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_gray_spread");
	level._effect["fx_mp_dlc4_silo_incandescent_2"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_incandescent_2");
	level._effect["fx_mp_dlc4_silo_projector"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_projector");
	level._effect["fx_mp_dlc4_silo_rock_falling_sm"]			= loadfx("maps/mp_maps/fx_mp_dlc4_silo_rock_falling_sm");
	level._effect["fx_mp_dlc4_silo_screen"]						= loadfx("maps/mp_maps/fx_mp_dlc4_silo_screen");
	level._effect["fx_mp_dlc4_silo_smk_linger"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_smk_linger");
	level._effect["fx_mp_dlc4_silo_smk_plume"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_smk_plume");
	level._effect["fx_mp_dlc4_silo_smk_plume_blk"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_smk_plume_blk");	
	level._effect["fx_mp_dlc4_silo_smk_plume_xsm"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_smk_plume_xsm");	
	level._effect["fx_mp_dlc4_silo_smk_stack_dist"] 			= loadfx("maps/mp_maps/fx_mp_dlc4_silo_smk_stack_dist");
	level._effect["fx_mp_dlc4_silo_smk_stack_fire"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_smk_stack_fire");
	level._effect["fx_mp_dlc4_silo_steam"]						= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam");
	level._effect["fx_mp_dlc4_silo_steam_dbl_pipes"]			= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_dbl_pipes");	
	level._effect["fx_mp_dlc4_silo_steam_sm"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_sm");
	level._effect["fx_mp_dlc4_silo_steam_lid"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_lid");	
	level._effect["fx_mp_dlc4_silo_steam_lrg"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_lrg");	
	level._effect["fx_mp_dlc4_silo_steam_vent_sm"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_vent_sm");	
	level._effect["fx_mp_dlc4_silo_steam_vent_xsm"]				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_vent_xsm");
	level._effect["fx_mp_dlc4_silo_steam_vent"]					= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_vent");	
	level._effect["fx_mp_dlc4_silo_tinhat_indoor"] 				= loadfx("maps/mp_maps/fx_mp_dlc4_silo_tinhat_indoor");
	level._effect["fx_mp_elec_spark_burst_xsm_thin"]			= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin");
	level._effect["fx_mp_elec_spark_burst_sm"]					= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm");	
	level._effect["fx_mp_smk_linger"]							= loadfx("maps/mp_maps/fx_mp_smk_linger");
	level._effect["fx_pipe_steam_md"]							= loadfx("env/smoke/fx_pipe_steam_md");
	
	//Missle Launch Exploders
	level._effect["fx_russian_missile_exhaust_silo_mp"]			= loadfx("vehicle/exhaust/fx_russian_missile_exhaust_silo_mp");	
	level._effect["fx_mp_dlc4_silo_steam_lrg_amb"]			= loadfx("maps/mp_maps/fx_mp_dlc4_silo_steam_lrg_amb");	
	level._effect["fx_russian_missile_exhaust_silo_burn_mp"]			= loadfx("vehicle/exhaust/fx_russian_missile_exhaust_silo_burn_mp");	

}

#using_animtree( "fxanim_props_dlc4" ); //.atr
precache_fx_prop_anims()
{
	level._fxanims = [];
	level._fxanims[ "fxanim_gp_wirespark_med_anim" ]			= %fxanim_gp_wirespark_med_anim;
	level._fxanims[ "fxanim_gp_wirespark_long_anim" ] 			= %fxanim_gp_wirespark_long_anim;
	level._fxanims[ "fxanim_mp_roofvent_snow_anim" ] 			= %fxanim_mp_roofvent_snow_anim;
	level._fxanims[ "fxanim_mp_silo_crane_cable_anim" ] 		= %fxanim_mp_silo_crane_cable_anim;
	level._fxanimsfx = [];
	level._fxanimsfx[ "fx_elec_wire_spark_burst_xsm" ] 			= loadfx( "env/electrical/fx_elec_wire_spark_burst_xsm" );
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
	//fxanim_wires = GetEntArray( localClientNum, "fxanim_wire_spark", "targetname" );
	//if (fxanim_wires.size!=0)
	//{
	//	for ( i = 0; i < fxanim_wires.size; i++ )
	//	{
	//		// Based on item.script_noteworthy
	//		fxanim_wires[i] thread fxanim_wire_think( localClientNum, fxanim_wires[i].script_noteworthy, level.waits[i], level.speeds[i]);
	//	}
	//}
	// Placed in the editor, 32 max
	//fxanim_roofvents = GetEntArray( localClientNum, "fxanim_roofvent", "targetname" );
	//if (fxanim_roofvents.size!=0)
	//{
	//	for ( i = 0; i < fxanim_roofvents.size; i++ )
	//	{
	//		fxanim_roofvents[i] thread fxanim_roofvent_think(localClientNum, level.waits[i], level.speeds[i]);
	//	}
	//}
	// Placed in the editor, 32 max
	fxanim_chains = GetEntArray( localClientNum, "fxanim_crane", "targetname" );
	for ( i = 0; i < fxanim_chains.size; i++ )
	{
		fxanim_chains[i] thread fxanim_crane_think(localClientNum, level.waits[i], level.speeds[i]);
	}
}

fxanim_roofvent_think( localClientNum, wait_time, speed  )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );
	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );
	wait( wait_time );
	self SetFlaggedAnim( "vent_fx", level._fxanims[ "fxanim_mp_roofvent_snow_anim" ]);
	//PlayFX(localClientNum,level._effect["fx_mp_dlc4_silo_smk_plume"],self.origin,(1,0,0));
}

fxanim_crane_think( localClientNum, wait_time, speed  )
{
	self endon( "death" );
	self endon( "entityshutdown" );
	self endon( "delete" );
	self waittill_dobj( localClientNum );
	self UseAnimTree( #animtree );
	wait( 0 );
	self SetFlaggedAnim( "crane_fx", level._fxanims["fxanim_mp_silo_crane_cable_anim"]);
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
			PlayFxOnTag( localClientNum, level._fxanimsfx[ "fx_elec_wire_spark_burst_xsm" ], self, "long_spark_06_jnt" );
		}
		else if ( anim_index == "fxanim_gp_wirespark_med_anim" )
		{
			PlayFxOnTag( localClientNum, level._fxanimsfx[ "fx_elec_wire_spark_burst_xsm" ], self, "med_spark_06_jnt" );
		}
	}
}
main()
{
	clientscripts\mp\createfx\mp_silo_fx::main();
	clientscripts\mp\_fx::reportNumEffects();
	
	precache_createfx_fx();
	//initModelAnims();
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
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

