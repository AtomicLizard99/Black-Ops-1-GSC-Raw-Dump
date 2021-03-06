#include clientscripts\mp\_utility; 
#include clientscripts\mp\_music;
#include clientscripts\mp\_audio;

// *************************************************	
// INIT HELI SOUNDS
//
// List of availible sound specific bones
// "SND_Cockpit"
// "SND_INT_F_L"
// "SND_INT_F_R"
// "SND_INT_R_L"
// "SND_INT_R_R"
// "SND_INT_Rotor"
// "SND_Rotor"
// "SND_Tail_Rotor"
// "SND_UNDER_Body"
// "SND_WIND_Left"
// "SND_WIND_Right"
//
// *************************************************	

init()
{
	level._entityShutDownCBFunc = clientscripts\mp\_helicopter_sounds::heli_linkto_sound_ents_delete;
	level.heliSoundValues = [];
	
	init_heli_sound_values( "cobra", "turbine", 		65, 0.6, 0.8, 65, 1, 1.1 );		
	init_heli_sound_values( "cobra", "top_rotor",		45, 0.7, 1, 45, 0.95, 1.1); 	
	init_heli_sound_values( "cobra", "tail_rotor", 	45, 0.5, 1, 45, 0.95, 1.1); 

	init_heli_sound_values( "hind", "turbine", 			65, 0.6, 0.8, 65, 1, 1.1 );		
	init_heli_sound_values( "hind", "top_rotor",		45, 0.7, 1, 45, 0.95, 1.1); 	
	init_heli_sound_values( "hind", "tail_rotor", 	45, 0.5, 1, 45, 0.95, 1.1); 	

	init_heli_sound_values( "supply", "turbine", 	    65, 0.7, 0.8, 65, .95, 1 );		
	init_heli_sound_values( "supply", "top_rotor",	35, 0.95, 1, 100, .95, 1); 	
	init_heli_sound_values( "supply", "tail_rotor", 35, 0.95, 1, 45, .95, 1); 	

	init_heli_sound_values( "huey", "turbine", 			65, 0.7, 0.8, 65, 1, 1.1 );		
	init_heli_sound_values( "huey", "top_rotor",		45, 0.8, 1, 45, 0.95, 1.1); 	
	init_heli_sound_values( "huey", "tail_rotor", 	45, 0.6, 1, 45, 0.95, 1.0); 	
	init_heli_sound_values( "huey", "wind_rt", 			45, 0.6, 1, 45, 0.95, 1.0); 	
	init_heli_sound_values( "huey", "wind_lft", 		45, 0.6, 1, 45, 0.95, 1.0); 	

/#
	if ( getdvar( #"helisounds" ) == "" )
	{
		setdvar( "helisounds", "" );
	}

	level thread command_parser();
#/
}

init_heli_sound_values( heli_type, part_type, max_speed_vol, min_vol, max_vol, max_speed_pitch, min_pitch, max_pitch )
{
	if ( !IsDefined( level.heliSoundValues[heli_type] ) )
	{
		level.heliSoundValues[heli_type] = [];
	}
	if ( !IsDefined( level.heliSoundValues[heli_type][part_type] ) )
	{
		level.heliSoundValues[heli_type][part_type] = spawnStruct();
	}
	
	level.heliSoundValues[heli_type][part_type].speedVolumeMax = max_speed_vol;
	level.heliSoundValues[heli_type][part_type].speedPitchMax = max_speed_pitch;
	level.heliSoundValues[heli_type][part_type].volumeMin = min_vol;
	level.heliSoundValues[heli_type][part_type].volumeMax = max_vol;
	level.heliSoundValues[heli_type][part_type].pitchMin = min_pitch;
	level.heliSoundValues[heli_type][part_type].pitchMax = max_pitch;
	
	if( GetDvarInt( #"debug_heli" ) > 0 )
	{
		println("Init Heli Sounds heli_type: " + heli_type );
		println("Init Heli Sounds part_type: " + part_type );	
		println("Init Heli Sounds max_speed_vol: " + max_speed_vol );	
		println("Init Heli Sounds min_vol: " + min_vol );	
		println("Init Heli Sounds max_vol: " + max_vol );
		println("Init Heli Sounds max_speed_pitch: " + max_speed_pitch );
		println("Init Heli Sounds min_pitch: " + min_pitch );	
		println("Init Heli Sounds max_pitch: " + max_pitch );	
	}							
}

/#
command_parser()
{
	while(1)
	{
		command = getdvar( #"helisounds" );
		if ( command != "" )
		{
			success = true;
			tokens = strtok( command, " " );
			if ( !isdefined( tokens[0] ) || !IsDefined(level.heliSoundValues[tokens[0]]) )
			{
				if ( isdefined( tokens[0] ) )
					println("helisounds Did not recognize helicopter type:  " + tokens[0] );
				else
					println("helisounds Did not recognize helicopter type" );
					
					
				println("helisounds usage: helisounds <heli name> <part name> <value name> <value>" );
				
				success = false;
			}	
//			else if ( !isdefined( tokens[1] )|| !IsDefined(level.heliSoundValues[heli_type][tokens[1]]))
			else if ( !isdefined( tokens[1] ) )
			{
				if ( isdefined( tokens[1] ) )
					println("helisounds Did not recognize helicopter part:  " + tokens[0] + " for heli: " + tokens[1] );
				else
				println("helisounds Did not recognize helicopter part for heli: " + tokens[0] );
				println("helisounds usage: helisounds <heli name> <part name> <value name> <value>" );
				success = false;
			}	
			else if ( !isdefined( tokens[2] ) )
			{
				println("helisounds Did not recognize helicopter value name for heli:" + tokens[0] + " part: " + tokens[1] );

				println("helisounds usage: helisounds <heli name> <part name> <value name> <value>" );
				success = false;
			}	
			else if ( !isdefined( tokens[3] ) )
			{
				println("helisounds Did not recognize helicopter value for heli:" + tokens[0] + " part: " + tokens[1] );

				println("helisounds usage: helisounds <heli name> <part name> <value name> <value>" );
				success = false;
			}	
		
			if ( success )
			{
				heli_type = tokens[0];
				heli_part = tokens[1];
				value_name = tokens[2];
				value = float(tokens[3]);
				//value = value / 10
				switch( value_name )
				{
					case "volumemin":
						level.heliSoundValues[heli_type][heli_part].volumeMin = value;
						println("Setting volumeMin to " + value );
						break;
					case "volumemax":
						level.heliSoundValues[heli_type][heli_part].volumeMax = value;
						println("Setting volumeMax to " + value );
						break;
					case "pitchmin":
						level.heliSoundValues[heli_type][heli_part].pitchMin = value;
						println("Setting pitchMin to " + value );				
						break;
					case "pitchmax":
						level.heliSoundValues[heli_type][heli_part].pitchMax = value;
						println("Setting pitchMax to " + value );
						break;
					case "speedvolumemax":
						level.heliSoundValues[heli_type][heli_part].speedVolumeMax = value;
						println("Setting speedVolumeMax to " + value );
						break;
					case "speedpitchmax":
						level.heliSoundValues[heli_type][heli_part].speedPitchMax = value;
						println("Setting speedPitchMax to " + value );
						break;
					default:
						//iprintln("helisounds Did not recognize helicopter value name for heli:" + heli_name + " part: " + part_name + " value name:" + value_name);
						println("no case match - helisounds usage: helisounds <heli name> <part name> <value name> <value>" );
				}
			}
			setdvar( "helisounds", "" );
		}
		wait(0.1);		
	}	
}
#/

init_heli_sounds_gunner() //tag, type, bone, run
{
	setup_heli_sounds( "lfe",			"engine",		"snd_cockpit",		"veh_huey_rotor_lfe" ); 	//  Distant LFE
	setup_heli_sounds( "turbine",		"engine",		"snd_rotor",		"veh_huey_turbine" ); 		//  Turbine
	setup_heli_sounds( "top_rotor",		"engine",		"snd_rotor",		"veh_huey_rotor" ); 		//  Top Rotor
	setup_heli_sounds( "tail_rotor",	"engine",		"snd_tail_rotor",	"veh_huey_tail" ); 			//  Tail Rotor	
	setup_heli_sounds( "wind_rt",		"engine",		"snd_wind_right",	"veh_huey_door_wind"); 		//	Wind right
	//setup_heli_sounds( "wind_lft",		"engine",		"snd_wind_left",	"veh_huey_door_wind"); 		//	Wind left  
	setup_heli_sounds( "radio",			"engine",		"snd_cockpit",		"veh_huey_radio"); 			//	radio cockpit  	
}

init_heli_sounds_player_controlled() //tag, type, bone, run
{
	setup_heli_sounds( "lfe",			"engine",		"snd_cockpit",		"veh_cobra_rotor_lfe" ); 	// Distant LFE
	setup_heli_sounds( "turbine",		"engine",		"snd_rotor",		"veh_cobra_turbine" ); 		// Turbine
	setup_heli_sounds( "top_rotor",		"engine",		"snd_rotor",		"veh_cobra_rotor" ); 		// Top Rotor
	setup_heli_sounds( "tail_rotor",	"engine",		"snd_tail_rotor",	"veh_cobra_tail" ); 		// Tail Rotor	
}

init_heli_sounds_supply() //tag, type, bone, run
{
	setup_heli_sounds( "lfe",			"engine",		"tag_origin",		"veh_supply_rotor_lfe" ); 	// Distant LFE
	setup_heli_sounds( "turbine",		"engine",		"tag_origin",		"veh_supply_turbine" ); 	// Turbine
	setup_heli_sounds( "top_rotor",		"engine",		"tag_origin",		"veh_supply_rotor" ); 		// Top Rotor
}

init_heli_sounds_ai_attack() //tag, type, bone, run
{
	setup_heli_sounds( "lfe",			"engine",		"snd_cockpit",		"veh_hind_rotor_lfe" ); 	// Distant LFE
	setup_heli_sounds( "turbine",		"engine",		"snd_rotor",		"veh_hind_turbine" ); 		// Turbine
	setup_heli_sounds( "top_rotor",		"engine",		"snd_rotor",		"veh_hind_rotor" ); 		// Top Rotor
	setup_heli_sounds( "tail_rotor",	"engine",		"snd_tail_rotor",	"veh_hind_tail" ); 			// Tail Rotor
}

setup_heli_sounds( bone_location, type, tag, run, dmg1, dmg2, dmg3 )
{
	self.heli[bone_location] = spawnStruct();
	self.heli[bone_location].sound_type = type;

	self.heli[bone_location].run = spawn( 0, self.origin, "script_origin" );
	self.heli[bone_location].run linkto( self, tag );
	self.heli[bone_location].run.alias = run;

	self thread heli_loop_sound_delete( self.heli[bone_location].run );

	if( isDefined( dmg1 ) )
	{
		self.heli[bone_location].idle = spawn( 0, self.origin, "script_origin" );
		self.heli[bone_location].idle linkto( self, tag );
		self.heli[bone_location].idle.alias = dmg1;

		self thread heli_loop_sound_delete( self.heli[bone_location].dmg1 );
	}
	if( isDefined( dmg2 ) )
	{
		self.heli[bone_location].idle = spawn( 0, self.origin, "script_origin" );
		self.heli[bone_location].idle linkto( self, tag );
		self.heli[bone_location].idle.alias = dmg2;

		self thread heli_loop_sound_delete( self.heli[bone_location].dmg2 );
	}
	if( isDefined( dmg3 ) )
	{
		self.heli[bone_location].idle = spawn( 0, self.origin, "script_origin" );
		self.heli[bone_location].idle linkto( self, tag );
		self.heli[bone_location].idle.alias = dmg3;

		self thread heli_loop_sound_delete( self.heli[bone_location].dmg3 );
	}
}

init_terrain_sounds()
{
	self.surface_type = [];
	// dirt
	self.surface_type["default"]	= "dirt";
	self.surface_type["metal"]		= "dirt";
	self.surface_type["concrete"]	= "dirt";
	self.surface_type["wood"] 		= "dirt";
	self.surface_type["dirt"] 		= "dirt";
	self.surface_type["gravel"]		= "dirt";
	self.surface_type["grass"]		= "dirt";
	self.surface_type["mud"]		= "dirt";
	self.surface_type["snow"]		= "dirt";
	self.surface_type["asphalt"]	= "dirt";
	self.surface_type["brick"]		= "dirt";
	self.surface_type["glass"]		= "dirt";
	self.surface_type["plaster"]	= "dirt";
	self.surface_type["sand"]		= "dirt";
	self.surface_type["rock"]		= "dirt";
	// water
	self.surface_type["water"]		= "water";
	// foliage
	self.surface_type["foliage"]	= "dirt";
	//self.surface_type["foliage"]	= "foliage";

	// create ents
	self setup_terrain_sounds( "dirt",		"veh_chopper_prop_wash_dirt"	);
	self setup_terrain_sounds( "water",		"veh_chopper_prop_wash_water"	);
	//self setup_terrain_sounds( "foliage",	"veh_chopper_prop_wash_foliage"	);
}

setup_terrain_sounds( surface_type, alias ) //self == helicopter
{
	self.terrain_ent_array[surface_type] = spawn( 0, self.origin, "script_origin" );
	self.terrain_ent_array[surface_type].alias = alias;

	self thread heli_loop_sound_delete( self.terrain_ent_array[surface_type] );
}

start_helicopter_sounds( localClientNum )
{
	//printLn( "^5 ********* in start_helicopter_sounds ***********" );

	if( isDefined( self.vehicletype ) )
	{
		self.heli = [];
		self.terrain = [];
		self.sound_ents = [];
		self.cur_speed = 0;
		self.mph_to_inches_per_sec = 17.6;
		self.speed_of_wind = 20;//40; // in MPH
		self.idle_run_trans_speed = 5; // in MPH

		switch( self.vehicletype )
		{
			// cobra_mp - Default Attack heli - Cobra
			case "heli_ai_mp":
			case "zombie_cobra":
				self init_heli_sounds_ai_attack();
				self play_attack_ai_sounds();
				break;
				
			// heli_supplydrop_mp -  Supply drop killstreak heli - Chinoock
			case "heli_supplydrop_mp":
				self init_heli_sounds_supply();
				self play_supply_sounds();
				break;				

			// heli_gunner_mp - is the player gunner killstreak  - Huey
			case "heli_gunner_mp":			
				self init_heli_sounds_gunner();
				self play_gunner_sounds();
				break;

			// heli_player_controlled_mp - is the player helicopter killstreak - hind
			case "heli_player_controlled_firstperson_mp":
			case "heli_player_controlled_mp":
				self init_heli_sounds_player_controlled();
				self play_player_controlled_sounds();
				break;
			
			default:
				printLn( "^5helicopter type: " + self.vehicletype + " vehicletype; playing no helicopter sounds" );
				break;
		}
		self init_terrain_sounds();
		self thread terrain_trace();
		//print for debug
		if( getdvarint( #"debug_heli" ) > 0 )
		{
			/#
			iprintLnbold( "helicopter type: " + self.vehicletype + " vehicletype" );		
			#/
		}
	}
	else
	{
		printLn( "^6helicopter type: " + self.vehicletype + " not defined" );
	}
}

heli_loop_sound_delete( real_ent )
{
	self waittill( "entityshutdown" );
	real_ent stoploopsound( 4 );
	real_ent delete();
}

heli_linkto_sound_ents_delete( localClientNum, entity )
{
	entity notify( "entityshutdown" );
}

heli_sound_play( heli_bone )
{
	switch( heli_bone.sound_type )
	{
		case "engine":
			heli_bone.run playloopsound( heli_bone.run.alias, 2 );
			break;
		case "wind":
			break;
		default:
			printLn( "^6 unknown helicopter type: " + heli_bone.type + " expecting \"wind\" or \"engine\"");
			break;
	}
}

// *************************************************	
// PLAY HELICOPTER SOUNDS SECTION
// This section plays the Helicopter sounds 
// heli_sound_play () - Starts a thread to play a loop unaffected by the entity speed
// heli_idle_run_transition () - Starts a thread that will pitch and volume the loop based on the arguments
// heli_bone - The tag to play the loop on, this is set to a bone in the init
// max_speed_vol - the speed at which volume will stop attenuation
// min_vol - This is the volume of the loop when not moving
// max_vol - This is the volume of the loop when at max_speed_vol
// max_speed_pitch - The speed at which pitch will no longer change
// min_pitch - This is the pitch of the loop when not moving
// max_pitch - This is the amount of pitch when at max_speed_vol
// *************************************************	
play_player_controlled_sounds() // self == helicopter Cobra
{
	// ******* heli Cobra sounds, this is the player controled mp heli **************
	self heli_sound_play( self.heli["lfe"] ); 																										// non-occulded, non-pitched 3d lfe
	self thread heli_idle_run_transition( "cobra", "turbine" );		 
	self thread heli_idle_run_transition( "cobra", "top_rotor");  
	self thread heli_idle_run_transition( "cobra", "tail_rotor");	
}

play_attack_ai_sounds() // self == helicopter
{
	// ******* heli Hind sounds, this is the AI controled mp heli **************
	self heli_sound_play( self.heli["lfe"] );																											// non-occulded, non-pitched 3d lfe
	self thread heli_idle_run_transition( "hind", "turbine" );		 
	self thread heli_idle_run_transition( "hind", "top_rotor");  
	self thread heli_idle_run_transition( "hind", "tail_rotor");	
}

play_supply_sounds() // self == helicopter
{
	// ******* heli Chinoock sounds, this is the AI controled mp supply helicopter **************
	self thread heli_idle_run_transition( "supply", "turbine" );		 
	self thread heli_idle_run_transition( "supply", "top_rotor");  
	self heli_sound_play( self.heli["lfe"] ); 																										// non-occulded, non-pitched 3d lfe
}

play_gunner_sounds() // self == helicopter
{
	// ******* heli Huey sounds, this is the AI controled mp gunner helicopter, player hangs out side and fires **************	
	self heli_sound_play( self.heli["lfe"] ); 
	self heli_sound_play( self.heli["radio"] );																											// non-occulded, non-pitched 3d lfe
	self thread heli_idle_run_transition( "huey", "turbine" );		 
	self thread heli_idle_run_transition( "huey", "top_rotor");  
	self thread heli_idle_run_transition( "huey", "tail_rotor");	
	self thread heli_idle_run_transition( "huey", "wind_rt" );		 
	//self thread heli_idle_run_transition( "huey", "wind_lft");  
}

// *************************************************
//	END OF PLAY HELICOPTER SOUNDS SECTION
// *************************************************

// *************************************************
//	HELICOPTER VOLUME/PITCH CHANGES
// *************************************************
heli_idle_run_transition( heli_type, heli_part  )
{
	self endon( "entityshutdown" );
	
	heli_bone = self.heli[heli_part];
	
	run_id = heli_bone.run playloopsound( heli_bone.run.alias, 0.5 );

	while( isDefined( self ) )
	{
		//scale_speed( min_speed, max_speed, min_vol, max_vol, cur_speed );
		if( !IsDefined( level.heliSoundValues[heli_type] ) || !IsDefined( level.heliSoundValues[heli_type][heli_part] ) )
		{
			printLn( "^5a speed vol/pitch parameter was not defined." );
			return;
		}

		max_speed_vol = level.heliSoundValues[heli_type][heli_part].speedVolumeMax;
		min_vol = level.heliSoundValues[heli_type][heli_part].volumeMin;
		max_vol = level.heliSoundValues[heli_type][heli_part].volumeMax;
		max_speed_pitch = level.heliSoundValues[heli_type][heli_part].speedPitchMax;
		min_pitch = level.heliSoundValues[heli_type][heli_part].pitchMin;
		max_pitch = level.heliSoundValues[heli_type][heli_part].pitchMax;
	
		self.cur_speed = self getspeed() / self.mph_to_inches_per_sec;
		
		run_volume = scale_speed( self.idle_run_trans_speed, max_speed_vol, min_vol, max_vol, self.cur_speed );
		run_pitch = scale_speed( self.idle_run_trans_speed, max_speed_pitch, min_pitch, max_pitch, self.cur_speed );

		if( isDefined( run_volume ) && isDefined( run_pitch ) )
		{
			setSoundVolume( run_id, run_volume );
			setSoundPitch( run_id, run_pitch );
			setSoundPitchRate( run_id, 0.25 );
			
			if( getdvarint( #"debug_heli" ) > 0 )
			{
				printLn( "^5a self.cur_speed = " + self.cur_speed );
				printLn( "^5a run_pitch . " + run_pitch );			
				printLn( "^5a self.cur_speed = " + self.cur_speed );
				printLn( "^5a run_volume. " + run_volume );

			}
		}

		wait( 0.5 );
	}
}

// *************************************************	
// HELICOPTER TERRAIN SOUNDS (PROP WASH)
// *************************************************
terrain_trace()
{
	self endon( "entityshutdown" ); 

	trace = undefined; 
	trace_ent = self;

	pre_terrain = undefined;
	next_terrain = undefined;

	pre_trace_real_ent = undefined;
	trace_real_ent = undefined;
	pre_origin = ( 100000, 100000, 100000 );

	while( isDefined( self ) )
	{
		wait( 1 + RandomFloatRange( 0.0, 0.2) );

		// do checks only if we moved more than a feet
		if( DistanceSquared( pre_origin, trace_ent.origin ) < 144 )
		{
			continue;
		}

		pre_origin = trace_ent.origin;

		trace = tracepoint( trace_ent.origin, trace_ent.origin - ( 0, 0, 100000 ) );
		//println( "btrace " + trace_ent.origin );
		trace_surface_type = trace["surfacetype"];

		if( !IsDefined( trace ) )
			continue; 

		pre_terrain = next_terrain;
		next_terrain = trace_surface_type;
		if( !IsDefined( pre_terrain ) || !IsDefined( next_terrain ) )
		{
			//printLn( "heli_script: this is in non defined trerrain" );
			continue;
		}

		if( !IsDefined( self.surface_type[next_terrain] ) || !IsDefined( self.surface_type[pre_terrain] ) )
		{
			/#
			//printLn( "^6 prop wash for terrain type: " + next_terrain + " or " + pre_terrain + " is not set up" );
			#/
			continue;
		}

		surf_type = self.surface_type[next_terrain];
		trace_real_ent = self.terrain_ent_array[surf_type];

		pre_surf_type = self.surface_type[pre_terrain];
		pre_trace_real_ent = self.terrain_ent_array[pre_surf_type];

		if( !IsDefined( trace["position"] ) )
		{
			if( IsDefined( pre_trace_real_ent ) )
			{
				pre_trace_real_ent StopLoopSound( 0.5 );
				//printLn( "^5heli_script: STOP playing terrain sound (position undefined): " + pre_surf_type );
			}
			continue; 
		}

		//update origin
		trace_real_ent.origin = trace["position"];
		pre_trace_real_ent.origin = trace["position"];
		if( IsDefined( surf_type ) )
		{
			if( ( surf_type == pre_surf_type ) && ( pre_trace_real_ent IsPlayingLoopSound() ) )
				continue;

			//printLn( "^5heli_script: STOP playing terrain sound: " + pre_surf_type + " surface '" + pre_terrain + "'" );
			pre_trace_real_ent StopLoopSound( 0.5 );

			//printLn( "^6heli_script: START playing terrain sound: " + surf_type + " surface '" + next_terrain + "'" );
			trace_real_ent PlayLoopSound( trace_real_ent.alias, 0.5 );
		}
	}	
}

aircraft_dustkick(localClientNum)
{

	printLn( "^stated aircraft_dustkick" );
	self endon( "entityshutdown" ); 
		
	maxHeight = 1200; 
	minHeight = 350; 

	slowestRepeatWait = 0.15; 
	fastestRepeatWait = 0.05; 

	numFramesPerTrace = 3; 
	doTraceThisFrame = numFramesPerTrace; 

	defaultRepeatRate = 1.0; 
	repeatRate = defaultRepeatRate; 

	trace = undefined; 
	d = undefined; 

	trace_ent = self; 

	while( isdefined( self ) )
	{
		if( repeatRate <= 0 )
		{
			repeatRate = defaultRepeatRate; 
		}

		if (!clientscripts\mp\_rewindobjects::serverWait( localClientNum, repeatRate ))
		{	// wait failed, we may have rewinded
			continue;
		}
		
		if( !isdefined( self ) )
		{
			return; 
		}
		
		doTraceThisFrame -- ; 

		 // prof_begin( "helicopter_dust_kickup" ); 

		if( doTraceThisFrame <= 0 )
		{
			doTraceThisFrame = numFramesPerTrace; 

			trace = bullettrace( trace_ent.origin, trace_ent.origin -( 0, 0, 100000 ), false, trace_ent ); 
			 /* 
			trace["entity"]
			trace["fraction"]
			trace["normal"]
			trace["position"]
			trace["surfacetype"]
			 */ 

			d = distance( trace_ent.origin, trace["position"] ); 

			repeatRate = ( ( d - minHeight ) /( maxHeight - minHeight ) ) *( slowestRepeatWait - fastestRepeatWait ) + fastestRepeatWait; 
		}

		if( !isdefined( trace ) )
		{
			continue; 
		}

		assert( isdefined( d ) ); 

		if( d > maxHeight )
		{
			repeatRate = defaultRepeatRate;
			continue; 
		}

		if( isdefined( trace["entity"] ) )
		{
			repeatRate = defaultRepeatRate; 
			continue; 
		}

		if( !isdefined( trace["position"] ) )
		{
			repeatRate = defaultRepeatRate; 
			continue; 
		}

		if( !isdefined( trace["surfacetype"] ) )
		{
			trace["surfacetype"] = "dirt"; 
		}
		
		//-- Glocke (12/16/2008) converted to prints from asserts while I come up with a better solution with Laufer
		if( !IsDefined( self.treadfx[trace["surfacetype"]] ) )
		{
			println("SCRIPT PRINT: Unknown surface type " + trace["surfacetype"] + " for vehicle type " + self.vehicletype);
			return;
		}
		//assertEx( isdefined( vehicle.treadfx[trace["surfacetype"]] ), "UNKNOWN SURFACE TYPE: " + trace["surfacetype"] ); 

		 // prof_end( "helicopter_dust_kickup" ); 

		if( IsDefined( self.treadfx[trace["surfacetype"]] ) )
		{
				//printLn( "^6this is defaulting dirt" );
				//println("SCRIPT PRINT: Unknown surface type " + trace["surfacetype"] + " for vehicle type " + self.vehicletype);				
			playfx( localClientNum, self.treadfx[trace["surfacetype"]], trace["position"] );
			//print3d( trace["position"], "+" + self.treadfx[trace["surfacetype"]], ( 0, 1, 0 ), 1, 3, 30 ); 
		}
	}	
}

play_targeting_sound( play, sound, handle )
{
	sound_ent = get_lock_sound_ent();
	if ( play )
	{
		 return sound_ent PlayLoopSound ( sound );
	}
	else if ( IsDefined(handle) )
	{
		sound_ent StopLoopSound( 0.1 );
		return undefined;
	}
}

play_targeted_sound( play )
{
	self.lockingSound = play_targeting_sound( play,  "veh_hind_alarm_missile_locking_mp", self.lockingSound );
}

play_locked_sound(play)
{
	self.lockedSound = play_targeting_sound( play,  "veh_hind_alarm_missile_locked_mp", self.lockedSound );
}

play_fired_sound(play)
{
	self.firedSound = play_targeting_sound( play,  "veh_hind_alarm_missile_fired", self.firedSound );
}

play_leaving_battlefield_alarm(play)
{
	sound_ent = get_leaving_sound_ent();
	if ( play )
	{
		 self.leavingBattlefieldSound = sound_ent PlayLoopSound ( "veh_helicopter_alarm" );
	}
	else if ( IsDefined(self.leavingBattlefieldSound) && self.leavingBattlefieldSound )
	{
		sound_ent StopLoopSound( 0.1 );
	}
}

get_lock_sound_ent()
{
	if ( !IsDefined(self.lock_sound_ent)) 
	{
		self.lock_sound_ent = spawn( 0, self GetTagOrigin( "snd_cockpit" ), "script_origin" );
		self.lock_sound_ent linkto( self, "snd_cockpit" );
	
		self thread heli_sound_ent_delete( self.lock_sound_ent );
	}
	
	return self.lock_sound_ent;
}

get_leaving_sound_ent()
{
	if ( !IsDefined(self.leaving_sound_ent)) 
	{
		self.leaving_sound_ent = spawn( 0, self GetTagOrigin( "snd_cockpit" ), "script_origin" );
		self.leaving_sound_ent linkto( self, "snd_cockpit" );
	
		self thread heli_sound_ent_delete( self.leaving_sound_ent );
	}
	
	return self.leaving_sound_ent;
}

heli_sound_ent_delete( real_ent )
{
	self waittill( "entityshutdown" );
	real_ent stoploopsound( 0.1 );
	real_ent delete();
}
