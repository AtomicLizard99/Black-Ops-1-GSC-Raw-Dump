//
// file: mp_havoc_amb.csc
// description: clientside ambient script for mp_havoc: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;


main()
{
		declareAmbientPackage( "default" );
		declareAmbientRoom( "default" );
			setAmbientRoomReverb( "default", "havoc_outside", 1, .1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
		
		declareAmbientPackage( "small_room" );
		declareAmbientRoom( "small_room" );
			setAmbientRoomReverb( "small_room", "havoc_small_room", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientPackage( "partial_room" );
		declareAmbientRoom( "partial_room" );
			setAmbientRoomReverb( "partial_room", "havoc_partial_room", 1, 1 );
			setAmbientRoomContext( "partial_room", "ringoff_plr", "outdoor" );	
			
		declareAmbientPackage( "rock_wall" );
		declareAmbientRoom( "rock_wall" );
			setAmbientRoomReverb( "rock_wall", "havoc_rock_wall", 1, 1 );
			setAmbientRoomContext( "rock_wall", "ringoff_plr", "outdoor" );	
			
		declareAmbientPackage( "stone_room" );
		declareAmbientRoom( "stone_room" );
			setAmbientRoomReverb( "stone_room", "havoc_stone_room", 1, 1 );
			setAmbientRoomContext( "stone_room", "ringoff_plr", "outdoor" );	
		
	 
	   thread snd_fx_create();

		activateAmbientRoom( 0, "default", 0 );
}

snd_fx_create ()

{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);

	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_md", "amb_fire_lg");
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_line_sm_thin", "amb_fire_lg");
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_column_creep_xsm", "amb_fire_lg");			
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_md_smolder", "amb_fire_md");
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_column_sm_thin", "amb_fire_md");
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_line_xsm_thin", "amb_fire_md");				
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_sm", "amb_fire_sm");	
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_sm_smolder", "amb_fire_sm_smolder");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_field_sm", "amb_smk_field_sm");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_field_md", "amb_smk_field_md");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_field_lg", "amb_smk_field_lg");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_plume_lg_blk", "amb_smk_plume_lg_blk");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_fire_md_smolder", "amb_fire_md_smolder");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_fire_sm_smolder", "amb_fire_sm_smolder");		

	
	
		
}	