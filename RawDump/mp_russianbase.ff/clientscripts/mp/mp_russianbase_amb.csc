//
// file: mp_russianbase_amb.csc
// description: clientside ambient script for mp_russianbase: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	declareAmbientRoom("outside" );
		setAmbientRoomtone ("outside", "outside", 1, 1);
		setAmbientRoomReverb( "outside", "russianbase_outside", 1, 1 );
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );

	declareAmbientRoom("alley" );
		setAmbientRoomtone ("alley", "amb_wind_out", 1, 1);
		setAmbientRoomReverb( "alley", "russianbase_alley", 1, 1 );
		setAmbientRoomContext( "alley", "ringoff_plr", "outdoor" );
		
	declareAmbientRoom("factory" );
		setAmbientRoomReverb( "factory", "russianbase_factory", 1, 1 );
		setAmbientRoomContext( "factory", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("factory_2" );
		setAmbientRoomReverb( "factory_2", "russianbase_factory_2", 1, 1 );
		setAmbientRoomContext( "factory_2", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("metal_room" );
		setAmbientRoomReverb( "metal_room", "russianbase_metal_room", 1, 1 );
		setAmbientRoomContext( "metal_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("small_room" );
		setAmbientRoomReverb( "small_room", "russianbase_small_room", 1, 1 );
		setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );

	thread snd_fx_create ();

	activateAmbientRoom( 0, "outside", 0 );		
}

snd_fx_create ()
{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_lg", "amb_fire_xlrg");		
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_md", "amb_fire_lrg");		
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_barrel_small", "amb_fire_med");		
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_sm_smolder", "amb_fire_sml");	
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_detail_sm", "amb_fire_sml");		
	clientscripts\mp\_audio::snd_play_auto_fx( "barrel_fire", "amb_fire_sml");		
}	

