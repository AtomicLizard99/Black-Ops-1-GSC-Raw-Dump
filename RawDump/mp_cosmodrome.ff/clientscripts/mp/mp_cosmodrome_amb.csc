//
// file: mp_cosmodrome_amb.csc
// description: clientside ambient script for mp_cosmodrome: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	//***************
	//DEFaULT ROOM\PACKAGE
	//*************** 

		declareAmbientRoom( "DEFAULT" );	
//			setAmbientRoomTone( "DEFAULT", "bgt_dull_wind" );
			setAmbientRoomReverb( "DEFAULT", "cosmo_outdoor",  1, 1 );
			setAmbientRoomContext( "DEFAULT", "ringoff_plr", "outdoor" );
			
		declareAmbientPackage( "small_room" );
		declareAmbientRoom( "small_room" );
			setAmbientRoomReverb( "small_room", "cosmo_small_room", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
//			setAmbientRoomTone( "small_room", "amb_default_indoor" );
			
		declareAmbientPackage( "med_room" );
		declareAmbientRoom( "med_room" );
			setAmbientRoomReverb( "med_room", "cosmo_med_room", 1, 1 );
			setAmbientRoomContext( "med_room", "ringoff_plr", "indoor" );
//			setAmbientRoomTone( "med_room", "amb_default_indoor" );

		declareAmbientPackage( "comp_room" );
		declareAmbientRoom( "comp_room" );
			setAmbientRoomReverb( "comp_room", "cosmo_comp_room", 1, 1 );
			setAmbientRoomTone( "comp_room", "amb_comp_room", .7, .7 );
			setAmbientRoomContext( "comp_room", "ringoff_plr", "indoor" );
			
		declareAmbientPackage( "partial_room" );
		declareAmbientRoom( "partial_room" );
			setAmbientRoomReverb( "partial_room", "cosmo_partial_room", 1, 1 );
			setAmbientRoomContext( "partial_room", "ringoff_plr", "outdoor" );
//			setAmbientRoomTone( "partial_room", "amb_default_indoor" );
			
		declareAmbientPackage( "rocket_room" );
		declareAmbientRoom( "rocket_room" );
			setAmbientRoomReverb( "rocket_room", "cosmo_rocket_room", 1, 1 );
			setAmbientRoomContext( "rocket_room", "ringoff_plr", "indoor" );
//			setAmbientRoomTone( "rocket_room", "amb_default_indoor" );
			
		declareAmbientPackage( "metal_hall" );
		declareAmbientRoom( "metal_hall" );
			setAmbientRoomReverb( "metal_hall", "cosmo_metal_hall", 1, 1 );
			setAmbientRoomContext( "metal_hall", "ringoff_plr", "indoor" );
//	setAmbientRoomTone( "metal_hall", "amb_default_indoor" );
			
		declareAmbientPackage( "metal_container" );
		declareAmbientRoom( "metal_container" );
			setAmbientRoomReverb( "metal_container", "cosmo_metal_container", 1, 1 );
			setAmbientRoomContext( "metal_container", "ringoff_plr", "indoor" );
//	setAmbientRoomTone( "metal_container", "amb_default_indoor" );
			
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

		//activateAmbientPackage( 0, "DEFAULT", 0 );
		
		activateAmbientRoom( 0, "DEFAULT", 0 );
		
	
			
		thread alarm_timer();	
		thread alarm_prelaunch ();
		
}


alarm_timer()
{
	level endon( "rocket_launch" );
	
	while(1)
	{
		wait(randomintrange(30, 60));
		level thread ambient_alarm("amb_vox_rus_pa_1");
		wait(randomintrange(10, 15));
		level notify ("alarm_Off");
		wait(randomintrange(20, 40));
		level thread ambient_alarm("amb_vox_rus_pa_2");
		wait(randomintrange(10, 15));	
		level notify ("alarm_Off");

		
		
		//wait(randomintrange(20, 40));
		//level notify ("alarm_Off");
		//wait(randomintrange(60, 240));
	}

}
alarm_timer_post_rocket()
{
	level notify ("alarm_Off");
	
	wait(randomintrange(20, 60));
	level thread ambient_alarm("amb_vox_rus_pa_3");
	wait(randomintrange(10, 15));		
	level notify ("alarm_Off");
	wait(randomintrange(60, 240));
	level thread ambient_alarm("amb_vox_rus_pa_4");
	wait(randomintrange(10, 15));				
	level notify ("alarm_Off");
}
ambient_alarm( vox )
{
	array_thread(getstructarray( "amb_warning_siren", "targetname" ), ::play_ambient_alarm);
	array_thread(getstructarray( "amb_warning_siren", "targetname" ), ::play_amb_vox, vox );		
}
play_amb_vox( vox )
{
	//level endon ("alarm_Off");
												//iprintlnbold("woot");
	playsound(0, vox, self.origin);

}
play_ambient_alarm()
{
	level endon ("alarm_Off");
												//iprintlnbold("woot");
	
	while(1)
	{
		playsound(0,"amb_alarm_buzz", self.origin);
		wait(2);		
	}

}
alarm_prelaunch ()
{
	level waittill ( "snd_rocket_launch" );

	array_thread(getstructarray( "amb_warning_siren", "targetname" ), ::play_ambient_alarm);
  //iprintlnbold("playing pre launch alarm");
			
	wait(6);	

	level notify ("alarm_Off");

	thread alarm_timer_post_rocket();
	
}	
