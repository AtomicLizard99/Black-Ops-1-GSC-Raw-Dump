//
// file: mp_nuked_amb.csc
// description: clientside ambient script for mp_nuked: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	thread clientscripts\mp\mp_nuked_amb_platform::main();
	
	thread pa_think("notify_20","amb_pa_notify_20");
	thread pa_think("notify_10","amb_pa_notify_10");
	thread pa_think("notify_5","amb_pa_notify_5");
	thread pa_think("notify_1","amb_pa_notify_1");
	thread pa_think("notify_stones","mus_sympathy_for_the_devil");
 	thread snd_fx_create();
	//thread pa_think("notify_count","amb_pa_countdown");
  //thread sprint_mighty_wind2();
	
declareAmbientRoom ("default");
	setAmbientRoomReverb ("default", "nuked_outdoor", 1, 1);
	setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
	
declareAmbientRoom ("int_room");
	setAmbientRoomReverb ("int_room", "nuked_house", 1, 1);
	setAmbientRoomContext( "int_room", "ringoff_plr", "indoor" );
//	setAmbientRoomTone ("int_room", "amb_int_wind", 1.7, 1.2);
	
declareAmbientRoom ("truck_room");
	setAmbientRoomReverb ("truck_room", "nuked_truck", 1, 1);
	setAmbientRoomContext( "truck_room", "ringoff_plr", "indoor" );

declareAmbientRoom ("garage");
	setAmbientRoomReverb ("garage", "nuked_garage", 1, 1);
	setAmbientRoomContext( "garage", "ringoff_plr", "outdoor" );
	
declareAmbientRoom ("wood_room");
	setAmbientRoomReverb ("wood_room", "nuked_wood_room", 1, 1);
	setAmbientRoomContext( "wood_room", "ringoff_plr", "outdoor" );

		activateAmbientRoom( 0, "default", 0 );		

	 



}
snd_fx_create ()
{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);
	
	
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_mp_nuked_sprinkler", "amb_sprinklers");		

	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_plume_xlg_tall_blk", "amb_smk_plume_xlg_tall_blk");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_field_sm", "amb_smk_field_sm");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_field_md", "amb_smk_field_md");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_field_lg", "amb_smk_field_lg");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_plume_lg_blk", "amb_smk_plume_lg_blk");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_plume_xlg_blk", "amb_smk_plume_xlg_blk");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_smolder_sm", "amb_smk_smolder_sm");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_debris_papers", "amb_debris_papers");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_fumes_vent_sm", "amb_fumes_vent_sm");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_pipe_steam_md", "amb_pipe_steam_md");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_fire_md_smolder", "amb_fire_md_smolder");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_fire_sm_smolder", "amb_fire_sm_smolder");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_dust_crumble_int_sm", "amb_dust_crumble_int_sm");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_sand_gust_sm_os", "amb_sand_gust_sm_os");		
		
	
	
	
	
	
	
		
}	



pa_think(notifyName, alias)
{
		level waittill (notifyName);
		speakers = getentarray(0, "loudspeaker", "targetname");
		for(i=0; i<speakers.size; i++)
		{
			speakers[i] thread pa_play(alias);
		}
}

pa_play(alias)
{
	wait (self.script_wait_min);
	self PlaySound (0, alias);
}

bomb_sound_go()
{
	level waittill ("notify_nuke");
	playSound (0, "amb_end_nuke", (0,0,0));
}
/*sprint_wind()
{
	while (1)
	{
		player = getlocalplayers();
		while (player.issprinting)
		{
			player PlayLoopSound (0, "sprint_wind", 1);
			if (player.issprinting == false)
				{
					player StopLoopSound (0, .5);
				}
			wait (.01);
		}
}*/		

/*
sprint_mighty_wind()
{
	player = getlocalplayers();
	wind = Spawn(0, player.origin, "script.origin");
	while (1)
	{
		if (IsDefined (player))
		{	
			if (player.issprinting)
			{
				if (IsDefined (wind))
				{		
					wind PlayLoopSound (0, "sprint_wind", 1);
					//waittill player.issprinting == false
				}
			}
		else
			{
		   StopLoopSound( 0, wind, 1);
			}
		}
		wait (.05);
	}
}		
*/
sprint_mighty_wind2()
{
	player = getlocalplayers();
	/*wind = Spawn(0, player.origin, "script.origin");
	while (1)
	{
		if (IsDefined (player))
		{	
			/#
			IPrintLnBold("we have player");
			#/
			if (IsDefined (player[0].movementtype) && player[0].movementtype == "sprint")
			{
					
				wind_id = player[0] PlayLoopSound (0, "sprint_wind", 1);
				//waittill player.issprinting == false

			}
//			if (IsDefined (wind_id) )
//			{
//		   StopLoopSound( 0, wind_id, 1);
//			}
			else
			{
							/#
							IPrintLnBold("no match" + player.movementtype);
							#/
			}	
		}
		wait (.05);
	}*/
}	
