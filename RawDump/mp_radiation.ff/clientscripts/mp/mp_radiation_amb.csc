//
// file: mp_radiation_amb.csc
// description: clientside ambient script for mp_radiation: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
//Commented out by Leif as a temp fix for bug.
//thread wind_trigger();
	
	
declareAmbientroom ("outside");
	setAmbientRoomtone ("outside", "amb_wind_gen_rm", .7, 1.2);
	setAmbientroomreverb ("outside", "radiation_outdoor", 1, 1);
	setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
	
declareAmbientroom ("recessed");
	setAmbientroomtone ("recessed", "amb_wind_gen_lp", .7, 1.2);
	setAmbientroomreverb ("recessed", "radiation_recessed", 1, 1);
	setAmbientRoomContext( "recessed", "ringoff_plr", "outdoor" );
		
declareAmbientroom ("corridor");
	setAmbientroomreverb ("corridor", "radiation_stonecorridor", 1, 1);
	setAmbientRoomContext( "corridor", "ringoff_plr", "outdoor" );
	
declareAmbientroom ("crawlspace");
	setAmbientroomtone ("crawlspace", "amb_wind_gen_lp", .7, 1.2);
	setAmbientroomreverb ("crawlspace", "radiation_crawlspace", 1, 1);
	setAmbientRoomContext( "crawlspace", "ringoff_plr", "indoor" );
	
declareAmbientroom ("crawlspace_2");
	setAmbientroomreverb ("crawlspace_2", "radiation_crawlspace_2", 1, 1);
	setAmbientRoomContext( "crawlspace_2", "ringoff_plr", "indoor" );
	
declareAmbientroom ("tunnel");
	setAmbientroomreverb ("tunnel", "radiation_tunnel", 1, 1);
	setAmbientRoomContext( "tunnel", "ringoff_plr", "indoor" );
	
declareAmbientroom ("under_room");
	setAmbientroomreverb ("under_room", "radiation_under_room", 1, 1);
	setAmbientRoomContext( "under_room", "ringoff_plr", "indoor" );
	
declareAmbientroom ("int_large");
	setAmbientroomreverb ("int_large", "radiation_large", 1, 1);
	setAmbientRoomContext( "int_large", "ringoff_plr", "indoor" );
	
declareAmbientroom ("int_small");
	setAmbientroomreverb ("int_small", "radiation_smallroom", 1, 1);
	setAmbientRoomContext( "int_small", "ringoff_plr", "indoor" );
	
declareAmbientroom ("stairwell");
	setAmbientroomreverb ("stairwell", "radiation_stairwell", 1, 1);
	setAmbientRoomContext( "stairwell", "ringoff_plr", "indoor" );

declareAmbientroom ("conveyor_corridor");
	setAmbientroomreverb ("conveyor_corridor", "radiation_corridor", 1, 1);
	setAmbientRoomContext( "conveyor_corridor", "ringoff_plr", "indoor" );
		
activateAmbientroom (0, "outside", 0);

thread pa_timer( "vox_russ_pa_", 7 );	
thread audio_crush_trigger ();
thread audio_crush_loop ();
thread audio_light_buzz();

}
pa_timer ( alias, alarmTimes)
{
	while (1)
	{
		for (i=0; i < alarmTimes; i++)
		{
			aliasNum = alias + i;
		
			wait(randomintrange(2, 8));	
			
			playsound(0, aliasNum,(-664,110,436));	
	
			playsound(0, aliasNum,(-664,-72,436));	
			
			playsound(0, aliasNum,(-666,-602,436));
			
			playsound(0, aliasNum,(-666,660,444));			
						
			wait(randomintrange(20, 40));	
		}
	}
}	
/*
wind_trigger()
	{
		wind_trig = GetEnt (0, "wind_spot", "targetname");
		wind_trig waittill ("trigger", trig_player);
		if ( IsDefined( wind_trig ) )
		{
			while (trig_player istouching(wind_trig))
				{
					wind_trig thread play_wind();
					wait (.05);
				}
		}		
	}
			
			
play_wind()
	{
		wind = GetEnt (0, "outside_wind", "targetname");
		wind PlayLoopSound ("amb_wind_opening");
	}
*/
audio_crush_trigger()
{
	while(1)
	{
		trigger = GetEnt (0, "audio_crush_trigger", "targetname");
		trigger waittill ("trigger", trig_player);
		trig_player playsound (0, "evt_grindor_crush");
		wait (2);
	}
}
audio_crush_loop()
{
	 audio_crush_loop = spawn( 0, (2134,1036,283), "script_origin" );
	 audio_crush_loop playloopsound ( "evt_grindor_loop" );
}	
audio_light_buzz()
{
	thread sound_playloop_sound ((2246,163,379),"amb_light_buzz");//hall above green sludge
	thread sound_playloop_sound ((2246,546,379),"amb_light_buzz");//hall above green sludge
	thread sound_playloop_sound ((1391,998,273),"amb_light_buzz");//Next to conveyor
	thread sound_playloop_sound ((848,-726,227),"amb_light_buzz");//entrance next to digger
	
	
}	
sound_playloop_sound ( org, alias)
{
	 sound = spawn( 0, org, "script_origin" );
	 sound playloopsound ( alias );
}	