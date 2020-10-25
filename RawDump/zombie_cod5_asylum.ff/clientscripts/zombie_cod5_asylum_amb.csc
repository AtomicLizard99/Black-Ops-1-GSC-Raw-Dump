//
// file: template_amb.csc
// description: clientside ambient script for template: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;

main()
{
	//************************************************************************************************
	//                                              Ambient Packages
	
//************************************************************************************************

	//declare an ambientpackage, and populate it with elements
	//mandatory parameters are <package name>, <alias name>, <spawnMin>, <spawnMax>
	//followed by optional parameters <distMin>, <distMax>, <angleMin>, <angleMax>

		// DEFAULT "ZOMBIES" INDOOR	
		declareAmbientRoom( "zombies" );
		declareAmbientPackage( "zombies" );
		setAmbientRoomReverb ("zombies","RV_ZOMBIES_ASYLUM_DEFAULT", 1, 1);
		setAmbientRoomContext( "zombies", "ringoff_plr", "indoor" );
		addAmbientElement( "zombies", "amb_spooky_2d", 5, 8, 300, 2000 );

		// BATHROOM
 		declareAmbientRoom( "bathroom" );
 		declareAmbientPackage( "bathroom" );
 		setAmbientRoomReverb ("bathroom","RV_ZOMBIES_ASYLUM_BATHROOM", 1, 1);
 		setAmbientRoomContext( "bathroom", "ringoff_plr", "indoor" );
 		addAmbientElement( "bathroom", "amb_spooky_2d", 5, 8, 300, 2000 );
		addAmbientElement( "bathroom", "amb_water_drips_rand", 0.2, 0.5, 50, 350 );


		// OUTDOOR
 		declareAmbientRoom( "outside" );
 		declareAmbientPackage( "outside" );
		setAmbientRoomReverb ("outside","RV_ZOMBIES_ASYLUM_OUTDOOR", 1, 1);
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
		addAmbientElement( "outside", "amb_spooky_2d", 5, 8, 300, 2000 );
		
				
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

  activateAmbientPackage( 0, "zombies", 0 );
  activateAmbientRoom( 0, "zombies", 0 );


    declareMusicState("SPLASH_SCREEN"); //one shot dont transition until done
		musicAlias("mx_splash_screen", 12);	
		musicwaittilldone();
	   
	//C. Ayers 9/10/10: Adding these in for future use, once this branch has what I'll be submitting on Treyarch branch	
	declareMusicState("WAVE");
	  musicAliasloop("mus_zombie_wave_loop", 0, 4);
		
	declareMusicState("EGG");
		musicAlias("mus_asylum_egg", 1 );
		
	declareMusicState( "SILENCE" );
	    musicAlias("null", 1 );   

	thread start_lights();
	thread play_random_generator_sparks();

	thread clientscripts\_waw_zombiemode_radio::init();
}

start_lights()
{
	level waittill ("start_lights");
	wait(2.0);

	array_thread(getstructarray( "electrical_circuit", "targetname" ), ::circuit_sound);
//	playsound(0,"turn_on", (0,0,0));	


	wait (3.0);
	array_thread(getstructarray( "electrical_surge", "targetname" ), ::light_sound);
	array_thread(getstructarray( "low_buzz", "targetname" ), ::buzz_sound);
	array_thread(getstructarray( "oneshot_sparks_loop", "targetname"), ::play_oneshot_sparks_loop);
	array_thread(getstructarray( "light_ceiling", "targetname" ), ::light_sound);
	thread play_elec_room_sweets();


//	array_thread(getstructarray( "perksacola", "targetname" ), ::perks_a_cola_jingle);

	wait(7);
	playsound(0,"zmb_turn_on", (0,0,0));
// Turns on 2D track for each player *move to client*
	playertrack = clientscripts\_audio::playloopat(0,"player_ambience", (0,0,0));
	wait(2);
	playsound(0,"zmb_ann_vox_laugh_l", (-16, 184, 952));
//	array_thread(getstructarray( "electrical_room", "targetname" ), ::electrical_room_sound);
}
light_sound()
{

	wait(randomfloatrange(1,4));
	playsound(0,"evt_electrical_surge", self.origin);
	playfx (0, level._effect["electric_short_oneshot"], self.origin);
	wait(randomfloatrange(1,2));
	e1 = clientscripts\_audio::playloopat(0,"light",self.origin);
	
	self run_sparks_loop();
}
run_sparks_loop()
{
	//fx_spark = level._effect["fx_elec_sparking_oneshot"];
	while(1)
	{

		wait(randomfloatrange(4,15));
		if (randomfloatrange(0, 1) < 0.5)
		{
			playfx (0, level._effect["electric_short_oneshot"], self.origin);
			playsound(0,"evt_electrical_surge", self.origin);
		}
		wait(randomintrange(1,4));
	}
}
circuit_sound()
{
	wait(1);
	playsound(0,"zmb_circuit", self.origin);
}
buzz_sound()
{
	lowbuzz = clientscripts\_audio::playloopat(0,"low_arc", self.origin);

}
play_oneshot_sparks_loop()
{
//	lightbuzz = clientscripts\_audio::playloopat(0, "arc_loop_light", self.origin);
	while(1)
	{
		wait(randomfloatrange(0.25,0.5));
		playfx (0, level._effect["wire_sparks_oneshot"], self.origin);
		playsound(0,"arc_spark_light", self.origin);
	}

}
play_random_generator_sparks()
{
	level endon ("switch_flipped_generator");
		
	while(1)
	{
		
		wait(randomfloatrange(0.45, 0.85));
		{
			playsound(0,"elec_arc_generator", (-672, -264, 296));			
		}
	}
}
play_elec_room_sweets()
{
	while(1)
	{
		wait(randomfloatrange(0.25, 1));
		playsound(0, "elec_room_sweets", (-584, -392, 344));

	}
}
