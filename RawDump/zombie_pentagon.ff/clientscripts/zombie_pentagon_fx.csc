//
// file: zombie_pentagon_fx.gsc
// description: clientside fx script for zombie_pentagon: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_fx;
#include clientscripts\_music;


main()
{
	clientscripts\createfx\zombie_pentagon_fx::main();
	clientscripts\_fx::reportNumEffects();
	precache_util_fx();
	precache_createfx_fx();
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
	
	level thread clientscripts\_zombiemode::init_perk_machines_fx();
	
	//PI ESM - added for electric trap fx
	//level thread trap_fx_monitor( "elec_trap1", "e1", "electric" );
	//level thread trap_fx_monitor( "fire_trap1", "f1", "fire" );
	level thread trap_fx_monitor( "trap_quickrevive", "nhe", "electric" );
	level thread trap_fx_monitor( "trap_elevator", "she", "electric" );

	// lighting			
	level thread light_model_swap( "smodel_light_electric",				"lights_indlight_on" );			
}


precache_util_fx()
{
}

precache_scripted_fx()
{
	level._effect["eye_glow"]			 										= LoadFx( "misc/fx_zombie_eye_single" ); 
	
	level._effect["headshot"] 					= LoadFX( "impacts/fx_flesh_hit" );
	level._effect["headshot_nochunks"] 			= LoadFX( "misc/fx_zombie_bloodsplat" );
	level._effect["bloodspurt"] 				= LoadFX( "misc/fx_zombie_bloodspurt" );
	level._effect["animscript_gib_fx"] 		 = LoadFx( "weapon/bullet/fx_flesh_gib_fatal_01" );
	level._effect["animscript_gibtrail_fx"] 	 = LoadFx( "trail/fx_trail_blood_streak" ); 
	
	level._effect[ "no_power" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect[ "fire_sale" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect[ "level1_chest" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect[ "level1_chest2" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect[ "level2_chest" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect[ "start_chest" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect[ "start_chest2" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect[ "start_chest3" ] = LoadFX( "misc/fx_zombie_eye_single" );
	level._effect["test_spin_fx"] = LoadFX( "env/light/fx_light_warning");	


}

precache_createfx_fx()
{
	level._effect["zapper"]																= loadfx("misc/fx_zombie_electric_trap");
	level._effect["switch_sparks"]												= loadfx("env/electrical/fx_elec_wire_spark_burst");
	level._effect["fire_trap_med"] 												= loadfx("maps/zombie/fx_zombie_fire_trap_med");	

	level._effect["zombie_pentagon_teleporter"]						= loadfx("maps/zombie/fx_zombie_portal_nix_num");
	level._effect["zombie_pent_portal_pack"]							= loadfx("maps/zombie/fx_zombie_portal_nix_num_pp");
	level._effect["zombie_pent_portal_cool"]							= loadfx("maps/zombie/fx_zombie_portal_nix_num_pp_fd");			
	level._effect["transporter_beam"]											= loadfx("maps/zombie/fx_transporter_beam");
	level._effect["transporter_start"]										= loadfx("maps/zombie/fx_transporter_start");		
	level._effect["fx_zombie_portal_corona_lg"]						= loadfx("maps/zombie/fx_zombie_portal_corona_lg");
	level._effect["fx_zombie_portal_corona_sm"]						= loadfx("maps/zombie/fx_zombie_portal_corona_sm");

	// Pentagon effects
	level._effect["fx_pent_cigar_smoke"]                  = LoadFX("maps/zombie/fx_zombie_cigar_tip_smoke");
	level._effect["fx_pent_cigarette_tip_smoke"]          = LoadFX("maps/zombie/fx_zombie_cigarette_tip_smoke");	
	level._effect["fx_glo_studio_light"]                  = LoadFX("maps/pentagon/fx_glo_studio_light");
	level._effect["fx_pent_tinhat_light"]                 = LoadFX("maps/pentagon/fx_pent_tinhat_light");				
	level._effect["fx_pent_lamp_desk_light"]              = LoadFX("maps/pentagon/fx_pent_lamp_desk_light");
	level._effect["fx_pent_security_camera"]              = LoadFX("maps/pentagon/fx_pent_security_camera");				
	level._effect["fx_pent_globe_projector"]              = LoadFX("maps/zombie/fx_zombie_globe_projector");
	level._effect["fx_pent_globe_projector_blue"]         = LoadFX("maps/zombie/fx_zombie_globe_projector_blue");	
	level._effect["fx_pent_movie_projector"]              = LoadFX("maps/pentagon/fx_pent_movie_projector");	
	level._effect["fx_pent_tv_glow"]                      = LoadFX("maps/zombie/fx_zombie_tv_glow");	
	level._effect["fx_pent_tv_glow_sm"]                   = LoadFX("maps/zombie/fx_zombie_tv_glow_sm");			
	level._effect["fx_pent_smk_ambient_room"]             = LoadFX("maps/pentagon/fx_pent_smk_ambient_room");	
	level._effect["fx_pent_smk_ambient_room_lg"]          = LoadFX("maps/zombie/fx_zombie_pent_smk_ambient_room_lg");		
	level._effect["fx_pent_smk_ambient_room_sm"]          = LoadFX("maps/pentagon/fx_pent_smk_ambient_room_sm");
	
	// FX from Rebirth
	level._effect["fx_light_overhead_int_amber"]					= loadfx("maps/zombie/fx_zombie_light_overhead_amber");	
	level._effect["fx_light_overhead_int_amber_short"]		= loadfx("maps/zombie/fx_zombie_light_overhead_amber_short");
	level._effect["fx_light_overhead_cool"]								= loadfx("maps/zombie/fx_zombie_light_overhead_cool");		
	level._effect["fx_light_floodlight_bright"]						= loadfx("maps/zombie/fx_zombie_light_floodlight_bright");	

	//Quad Vent Exploders	- bottom floor -1001,1002,1003,1004
	level._effect["fx_quad_vent_break"]          					= LoadFX("maps/zombie/fx_zombie_crawler_vent_break");	

	// Additional FX
	level._effect["fx_smk_linger_lit"]										= loadfx("maps/mp_maps/fx_mp_smk_linger");
	
	level._effect["fx_water_drip_light_long"]							= loadfx("env/water/fx_water_drip_light_long");	
	level._effect["fx_water_drip_light_short"]						= loadfx("env/water/fx_water_drip_light_short");
	level._effect["fx_mp_blood_drip_short"]								= loadfx("maps/mp_maps/fx_mp_blood_drip_short");
	
	level._effect["fx_pipe_steam_md"]											= loadfx("env/smoke/fx_pipe_steam_md");
	level._effect["fx_mp_fumes_vent_sm_int"]							= loadfx("maps/mp_maps/fx_mp_fumes_vent_sm_int");
	level._effect["fx_mp_fumes_vent_xsm_int"]							= loadfx("maps/mp_maps/fx_mp_fumes_vent_xsm_int");

	level._effect["fx_zombie_light_glow_telephone"]				= loadfx("maps/zombie/fx_zombie_light_glow_telephone");
	level._effect["fx_light_pent_ceiling_light"]					= loadfx("env/light/fx_light_pent_ceiling_light");	
	level._effect["fx_light_pent_ceiling_light_flkr"]			= loadfx("env/light/fx_light_pent_ceiling_light_flkr");	
	level._effect["fx_light_office_light_03"]							= loadfx("env/light/fx_light_office_light_03");
	level._effect["fx_mp_light_dust_motes_md"]						= loadfx("maps/zombie/fx_zombie_light_dust_motes_md");
	
	level._effect["fx_insects_swarm_md_light"]						= loadfx("bio/insects/fx_insects_swarm_md_light");
	level._effect["fx_insects_maggots"]										= loadfx("bio/insects/fx_insects_maggots_sm");
	
	level._effect["fx_mp_elec_spark_burst_xsm_thin_runner"]	= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_xsm_thin_runner");
	level._effect["fx_mp_elec_spark_burst_sm_runner"]			= loadfx("maps/mp_maps/fx_mp_elec_spark_burst_sm_runner");
	
	level._effect["fx_interrog_morgue_mist"]							= loadfx("maps/zombie/fx_zombie_morgue_mist");	
	level._effect["fx_interrog_morgue_mist_falling"]			= loadfx("maps/zombie/fx_zombie_morgue_mist_falling");
	
}

//*****************************************************************************
// TRAPS:
//		name = targetname of the fx structs
//		loc	= abbreviated notify (try to keep to 2 characters max)
//*****************************************************************************

trap_fx_monitor( name, loc, trap_type )
{
	// Get the list of points.
	//	Don't include structs used for script_models
	structs = getstructarray( name, "targetname" );
	points = [];
	for ( i=0; i<structs.size; i++ )
	{
		if ( !IsDefined(structs[i].model ) )
		{
			points[ points.size ] = structs[i];
		}
	}
	
	while(1)
	{
		// Wait for the notify
		level waittill( loc+"1" );	// "one" means on

		// Spawn an FX for each struct
		for( i=0; i<points.size; i++ )
		{
			points[i] thread trap_play_fx( loc, trap_type );
		}
	}
}

//*****************************************************************************
// TRAP FX
//*****************************************************************************

trap_play_fx( loc, trap_type )
{
	// Get the structs orientation
	ang = self.angles;
	forward = anglestoforward( ang );
	up = anglestoup( ang );
	
	// If the effects already exist, delete them
	if ( isdefined( self.loopFX ) )
	{
		for( i=0; i<self.loopFX.size; i++ )
		{
			self.loopFX[i] delete();
		}
		
		self.loopFX = [];
	}
	if(!isdefined(self.loopFX))
	{
		self.loopFX = [];
	}	

	// Effect override
	fx_name = "";	// scope declaration
	if ( IsDefined( self.script_string ) )
	{
		fx_name = self.script_string;
	}
	else
	{
		switch( trap_type )
		{
		case "electric":
			fx_name = "zapper";
			break;
		default:
		case "fire":
			fx_name = "fire_trap_med";
			break;
		}
	}

	// Create the Effect for each player
	players = getlocalplayers();
	for( i=0; i<players.size; i++ )
	{
		self.loopFX[i] = SpawnFx( i, level._effect[ fx_name ], self.origin, 0, forward, up );
		triggerfx( self.loopFX[i] );
	}
	
	// Wait for the server notify to stop the effect
	level waittill( loc + "0" );	// "zero" means off
	
	// Delete the effects
	for(i=0; i<self.loopFX.size; i++ )
	{
		self.loopFX[i] delete();
	}
	self.loopFX = [];
	
}


//  Replace the light models when the lights turn on and off
light_model_swap( name, model )
{
		level waittill( "pl1" );	// Power lights on

		players = getlocalplayers();
		for ( p=0; p<players.size; p++ )
		{
			lamps = GetEntArray( p, name, "targetname" );
			for ( i=0; i<lamps.size; i++ )
			{
				lamps[i] SetModel( model );
			}
		}
}  