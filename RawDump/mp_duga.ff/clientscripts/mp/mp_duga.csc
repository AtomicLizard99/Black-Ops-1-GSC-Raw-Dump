// Test clientside script for mp_duga
#include clientscripts\mp\_utility;

main()
{
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_winterspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_duga_fx::main();

//	thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_duga_amb::main();

	// after _load::main
	level.rcbombSurfaceTypeForScreenFx = clientscripts\mp\_rcbomb::snowy_level_surface_type_for_screen_fx;
	level.rcbombSurfaceTypeForTreadFx = clientscripts\mp\_rcbomb::snowy_level_surface_type_for_tread_fx;

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : mp_duga running...");
	
	//level thread electric_explosion_init();
	//level thread event_debug();
	//level thread final_explosion();
	
	///#
		//level thread devgui_setup();
	//#/
}

//Sets up the preparation for a series of explosions.
electric_explosion_init()
{
	first_transformer_structs = getstructarray("transformer_struct","targetname");
	AssertEx( first_transformer_structs.size > 0, "Unable to find entity with targetname: 'transformer_struct'" );
	
	transformer_array = [];
	
	for( i=0; i < first_transformer_structs.size; i++)
	{
		current_struct = first_transformer_structs[i];
		level._transformer_array = add_to_array(level._transformer_array, current_struct);
			
		while(IsDefined(current_struct.target))
		{
			current_struct = getstruct(current_struct.target, "targetname");
			level._transformer_array = add_to_array(level._transformer_array, current_struct);	
		}
	}
	array_thread(level._transformer_array, ::electric_explosion_think);
	
	//TO DO: This 'wait' is temp.
	wait 2;
	
	for( i=0; i < first_transformer_structs.size; i++)
	{
		first_transformer_structs[i] notify ("transformer_explode");
	}
}

electric_explosion_think()
{
	self endon ("entityshutdown");
	//TO DO: 'While' loop is temp, as is most of the FX.
	while(1)
	{	
		self waittill ("transformer_explode");
		
		//IPrintLnBold("explode "+self.origin);
		
		//This is the initial electric explosion
		PlayFX(0,level._effect["elec_explosion_md"], self.origin );
		PlayFX(0,level._effect["burning_sparks"], self.origin );
		
		electric_ent = Spawn(0,self.origin + (0,0,-10),"script_model");
		electric_ent SetModel("tag_origin");
		
		wait .05;
		
		//Start electricity effects.
		PlayFXOnTag(0,level._effect["elec_idle"], electric_ent,"tag_origin" );
		PlayFXOnTag(0,level._effect["elec_bolt"], electric_ent,"tag_origin" );
		
		level waittill ("go");
		 
		//Start blue fire. This represents the escalation phase of the action.
		PlayFX( 0,level._effect["elec_fire_md"], self.origin + (0,0,-25)  );
		
		wait RandomFloatRange(3,4);
		
		electric_ent Delete();
		
		//This is the climax of the transformer explosion. We may want to add another effect to show the transformer fire calming down after ~6 seconds.
		PlayFX( 0,level._effect["elec_explosion_lg"], self.origin );
		PlayFX( 0,level._effect["exp_antenna"], self.origin );
		
		if(IsDefined(self.target))
		{
			new_transformer = getstruct(self.target, "targetname");
			vertical_offset = (0,0,-50);
			
			//Spawn in entity to play moving effect on
			effect_ent = Spawn(0,(self.origin + vertical_offset),"script_model");
			effect_ent SetModel("tag_origin");
			
			//Needed to get 'playfxontag' to properly work, as the setmodel needs a frame.
			wait .05;
		
			//This is the power surge effect that travel down 
			PlayFXOnTag(0,level._effect["wire_surge"], effect_ent,"tag_origin" );
			PlayFXOnTag(0,level._effect["elec_trail"], effect_ent,"tag_origin" );
					
			effect_ent MoveTo((new_transformer.origin + vertical_offset),3);
			
			effect_ent waittill("movedone");
			
			effect_ent Delete();
			new_transformer notify ("transformer_explode");
		}
	}
}

//Blows up the Duga array at the end of the map. Currently the FX is placeholder. 
final_explosion()
{
	final_struct = getstruct("final_boom_struct","targetname");
	AssertEx(IsDefined(final_struct),"Unable to find targetname 'final_boom_struct'");
	
	//Loop is TEMP
	while(1)
	{
		level waittill ("fin");
		PlayFX( 0,level._effect["exp_nuke"], final_struct.origin );	
	}
}

//TEMP
event_debug()
{
	while(1)
	{
		level waittill("next_boom");
		/#
		IPrintLnBold("hit!");
		#/
	}
}

//TO DO: Fix DEV GUI	
devgui_setup()
{
	while(1)
	{
		wait( 0.5 );
		
		devgui_string = GetDvar( #"devgui_notify" );
		
		switch(devgui_string)
		{
			case "":
			break;
			
			case "transformer_explode1":
				level._transformer_array[0] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode2":
				level._transformer_array[1] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode3":
				level._transformer_array[2] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode4":
				level._transformer_array[3] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode5":
				level._transformer_array[4] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode6":
				level._transformer_array[5] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode7":
				level._transformer_array[6] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode8":
				level._transformer_array[7] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode9":
				level._transformer_array[8] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode10":
				level._transformer_array[9] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode11":
				level._transformer_array[10] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "transformer_explode12":
				level._transformer_array[11] notify ("transformer_explode");
				level waittill ("ready");
				level notify ("go");
			break;
			
			case "final_explode":
				level notify ("fin");
			break;

			default:
				level notify( devgui_string );
			break;
		}
	}
}