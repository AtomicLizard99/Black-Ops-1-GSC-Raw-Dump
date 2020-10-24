//
// file: template_amb.csc
// description: clientside ambient script for template: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;
#include clientscripts\mp\_music;
#include clientscripts\mp\_busing;

main()
{


	

		declareAmbientPackage( "mp_crisis_pkg" );
			
			addAmbientElement( "mp_crisis_pkg", "amb_mp_crisis_bg_outdoor", 1, 3, 10, 200 );
		

		declareAmbientRoom( "mp_crisis_outside" );
	
			setAmbientRoomTone( "mp_crisis_outside", "amb_mp_crisis_bg_outdoor" );
			setAmbientRoomReverb( "mp_crisis_outside", "crisis_outside", 1, 1 );
			setAmbientRoomContext( "mp_crisis_outside", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "bunker_int" );
			
			setAmbientRoomTone( "bunker_int", "amb_room_tone_lf2", 0.5, 0.5 );
			setAmbientRoomReverb( "bunker_int", "crisis_bunker_int", 1, 1 );
 			setAmbientRoomContext( "bunker_int", "ringoff_plr", "indoor" );
 						
		declareAmbientRoom( "computer_room" );
			
			setAmbientRoomTone( "computer_room", "amb_room_tone_lf", 0.5, 0.5 );
			setAmbientRoomReverb( "computer_room", "crisis_computer_room", 1, 1 );
 			setAmbientRoomContext( "computer_room", "ringoff_plr", "indoor" );
 			
 		declareAmbientRoom( "cave" );
			
			setAmbientRoomTone( "cave", "amb_room_tone_lf", 0.5, 0.5 );
			setAmbientRoomReverb( "cave", "crisis_cave", 1, 1 );
 			setAmbientRoomContext( "cave", "ringoff_plr", "outdoor" );
 			
 		 declareAmbientRoom( "stone_room" );
			
			setAmbientRoomTone( "stone_room", "amb_room_tone_lf", 0.5, 0.5 );
			setAmbientRoomReverb( "stone_room", "crisis_stone_room", 1, 1 );
 			setAmbientRoomContext( "stone_room", "ringoff_plr", "indoor" );
 			
 		declareAmbientRoom( "small_room" );
			
			setAmbientRoomTone( "small_room", "amb_room_tone_lf", 0.5, 0.5 );
			setAmbientRoomReverb( "small_room", "crisis_small_room", 1, 1 );
 			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientPackage( "mp_crisis_inside_pkg" );
			

	

	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************
	

		
		activateAmbientPackage( 0, "mp_crisis_pkg", 0 );
		activateAmbientRoom( 0, "mp_crisis_outside", 0 );
		
		//declareMusicState("INTRO"); 
			//musicAlias("mx_thunt_into", 0);
		

thread snd_fx_create();

}

vox_comp_radio ()
{
	while (1)
	{
		wait(randomintrange(12, 30));	
		playsound(0,"vox_comp_radio", (2635,1596,406));
	}	
}
vox_comp_radio_mainframe ()
{
	while (1)
	{
		wait(randomintrange(12, 30));	
		playsound(0,"vox_comp_radio", (2734,-842,379));
	}	
}	
snd_random (min, max, position, alias)
{
	while (1)
	{
		wait(randomintrange(min, max));	
		playsound(0, alias, (position));
	}	
}	
snd_fx_create ()
{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);
		
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_water_drip_light_short", "amb_water_drip");	

		
}
