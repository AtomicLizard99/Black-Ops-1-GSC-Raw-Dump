//
// file: mp_hanoi_amb.csc
// description: clientside ambient script for mp_hanoi: setup ambient sounds, etc.


#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
		declareAmbientRoom( "default" );
			setAmbientRoomReverb( "default", "hanoi_outside", 1, 1 );
			setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
		
		declareAmbientRoom( "small_room" );
			setAmbientRoomTone ( "small_room", "amb_wind_inside", .8, 1);
			setAmbientRoomReverb( "small_room", "hanoi_small_room", 1, 1 );
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "partial_room" );
			setAmbientRoomTone ( "partial_room", "amb_wind_inside", .8, 1);
			setAmbientRoomReverb( "partial_room", "hanoi_partial_room", 1, 1 );
			setAmbientRoomContext( "partial_room", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "wood_room" );
			setAmbientRoomReverb( "wood_room", "hanoi_wood_room", 1, 1 );
			setAmbientRoomContext( "wood_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "large_room" );
			setAmbientRoomTone ( "large_room", "amb_wind_inside", .8, 1);
			setAmbientRoomReverb( "large_room", "hanoi_largeroom", 1, 1 );
			setAmbientRoomContext( "large_room", "ringoff_plr", "indoor" );


		activateAmbientRoom( 0, "default", 0 );
		
		thread snd_fx_create(); 
		thread sound_loopers_start();
}



snd_fx_create ()
{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);
	
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_water_drip_light_short", "amb_water_drip");		
//	clientscripts\mp\_audio::snd_play_auto_fx( "fx_insect_swarm", "amb_flies");		
 // clientscripts\mp\_audio::snd_play_auto_fx( "fx_insects_moths_flutter", "amb_flies");			
	//clientscripts\mp\_audio::snd_play_auto_fx( "fx_insects_moths_light_source", "amb_flies");				
	//clientscripts\mp\_audio::snd_play_auto_fx( "fx_insects_moths_light_source_md", "amb_flies");		
	
}
sound_loopers_start()
{
	//Loopers
	thread sound_playloop_sound ((3216,-1201,666),"amb_battle_dist");
	//thread sound_playloop_sound ((253,935,127),"amb_neon");	
	

}
sound_playloop_sound ( org, alias)
{
	 sound = spawn( 0, org, "script_origin" );
	 sound playloopsound ( alias );
}