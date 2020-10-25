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


		//Global Outdoor	
 		declareAmbientRoom( "zombies" );
 		setAmbientRoomReverb ("zombies","RV_ZOMBIES_SUMPF_OUTDOOR", 1, 1);
 		declareAmbientPackage( "zombies" );
 		setAmbientRoomContext( "zombies", "ringoff_plr", "outdoor" );
 		addAmbientElement( "zombies", "amb_spooky_2d", 5, 8, 300, 2000 );
 		addAmbientElement( "zombies", "amb_spooky_2d", 5, 8, 300, 2000 );
 
 		//SW Shack
	 	declareAmbientRoom( "shack" );
		setAmbientRoomReverb ("shack","RV_ZOMBIES_SUMPF_SHACK", 1, 1);
 		declareAmbientPackage( "shack" );
 		setAmbientRoomContext( "shack", "ringoff_plr", "outdoor" );
		addAmbientElement( "shack", "amb_spooky_2d", 5, 8, 300, 2000 );
		addAmbientElement( "shack", "wood_creak", 5, 12, 10, 450 );

		//S and SE Shacks 	
		declareAmbientRoom( "wood_shack" );
		setAmbientRoomReverb ("wood_shack","RV_ZOMBIES_SUMPF_SHACK", 1, 1);	
 		declareAmbientPackage( "wood_shack" );
 		setAmbientRoomContext( "wood_shack", "ringoff_plr", "outdoor" );
		addAmbientElement( "wood_shack", "amb_spooky_2d", 5, 8, 300, 2000 );
		addAmbientElement( "wood_shack", "wood_creak", 5, 12, 10, 450 );

 		//Center Building Downstairs	
 		declareAmbientRoom( "hut_downstairs" );
 		setAmbientRoomReverb ("hut_downstairs","RV_ZOMBIES_SUMPF_LARGE_ROOM", 1, 1);
 		declareAmbientPackage( "hut_downstairs" );
 		setAmbientRoomContext( "hut_downstairs", "ringoff_plr", "indoor" );
 		addAmbientElement( "hut_downstairs", "amb_spooky_2d", 10, 18, 300, 2000 );
 		addAmbientElement( "hut_downstairs", "wood_creak", 5, 12, 10, 450 );

		//NW and SW Buildings Enclosed
 		declareAmbientRoom( "perks_hut" );
		setAmbientRoomReverb ("perks_hut","RV_ZOMBIES_SUMPF_MEDIUM_ROOM", 1, 1);		
		declareAmbientPackage( "perks_hut" );
		setAmbientRoomContext( "perks_hut", "ringoff_plr", "indoor" );
		addAmbientElement( "perks_hut", "amb_spooky_2d", 5, 8, 300, 2000 );
		addAmbientElement( "perks_hut", "wood_creak", 5, 12, 10, 450 );

		//NE and SE Buildings Semi Open
 		declareAmbientRoom( "perks_hut_semi_open" );
		setAmbientRoomReverb ("perks_hut_semi_open","RV_ZOMBIES_SUMPF_SEMI_OPEN", 1, 1);		
		declareAmbientPackage( "perks_hut_semi_open" );
 		setAmbientRoomContext( "perks_hut_semi_open", "ringoff_plr", "indoor" );
		addAmbientElement( "perks_hut_semi_open", "amb_spooky_2d", 5, 8, 300, 2000 );
		addAmbientElement( "perks_hut_semi_open", "wood_creak", 5, 12, 10, 450 );
		

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
		musicAlias("mus_sumpf_egg",1);
		
	declareMusicState( "SILENCE" );
	    musicAlias("null", 1 );   

	thread play_meteor_loop();

	thread clientscripts\_waw_zombiemode_radio::init();
}

play_meteor_loop()
{
	meteor = clientscripts\_audio::playloopat(0,"meteor_loop", (11264, -1920, -592));
}

start_lights()
{
	level waittill ("start_lights");
	wait(2.0);

	array_thread(getstructarray( "electrical_circuit", "targetname" ), ::circuit_sound);
	playsound(0,"zmb_turn_on", (0,0,0));	


	wait (3.0);
	array_thread(getstructarray( "electrical_surge", "targetname" ), ::light_sound);
	array_thread(getstructarray( "low_buzz", "targetname" ), ::buzz_sound);

// Turns on 2D track for each player *move to client*
	playertrack = clientscripts\_audio::playloopat(0,"player_ambience", (0,0,0));
	
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
	playsound(0,"circuit", self.origin);
}
buzz_sound()
{
	lowbuzz = clientscripts\_audio::playloopat(0,"low_arc", self.origin);

}
