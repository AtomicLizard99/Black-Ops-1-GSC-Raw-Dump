//
// file: mp_villa_amb.csc
// description: clientside ambient script for mp_villa: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
// MP VILLA

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;


main()
{
DeclareAmbientRoom ("outside"); 
	//SetAmbientRoomtone ("outside", "amb_wind_room_out", 1.5, 1.1);
 	SetAmbientRoomreverb ("outside", "villa_outside", 1, 1);
 	setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
	
DeclareAmbientRoom ("small_room"); 
	SetAmbientRoomreverb ("small_room", "villa_small_room", 1, 1);
	setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
	
DeclareAmbientRoom ("med_room"); 
	SetAmbientRoomreverb ("med_room", "villa_med_room", 1, 1);
	setAmbientRoomContext( "med_room", "ringoff_plr", "indoor" );
	
DeclareAmbientRoom ("large_room"); 
	SetAmbientRoomreverb ("large_room", "villa_large_room", 1, 1);
	setAmbientRoomContext( "large_room", "ringoff_plr", "indoor" );
	
DeclareAmbientRoom ("partial_room"); 
	SetAmbientRoomreverb ("partial_room", "villa_partial_room", 1, 1);
	setAmbientRoomContext( "partial_room", "ringoff_plr", "outdoor" );
	
DeclareAmbientRoom ("barn"); 
	SetAmbientRoomreverb ("barn", "villa_barn", 1, 1);
	setAmbientRoomContext( "barn", "ringoff_plr", "outdoor" );
	
DeclareAmbientRoom ("hallway"); 
	SetAmbientRoomreverb ("hallway", "villa_hallway", 1, 1);
	setAmbientRoomContext( "hallway", "ringoff_plr", "indoor" );
	
DeclareAmbientRoom ("large_open_room"); 
	SetAmbientRoomreverb ("large_open_room", "villa_large_open_room", 1, 1);
	setAmbientRoomContext( "large_open_room", "ringoff_plr", "indoor" );


activateAmbientRoom( 0, "outside", 0 );		

thread snd_fx_create(); 
thread sound_loopers_start();
}
snd_fx_create ()
{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);
	
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_fire_sm", "amb_fire_med");		
	//clientscripts\mp\_audio::snd_play_auto_fx( "fx_chandelier_candle", "amb_fire_med");		
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_light_floodlight_int_blue", "amb_light_hum");			
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_light_floodlight_ext_warm", "amb_light_hum");				
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_insects_swarm_md_light", "amb_mpl_flies");		
}
sound_loopers_start()
{
	//Loopers
	thread sound_playloop_sound ((4054,-2060,2063),"amb_battle_dist");
	

}
sound_playloop_sound ( org, alias)
{
	 sound = spawn( 0, org, "script_origin" );
	 sound playloopsound ( alias );
}