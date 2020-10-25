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


	

		declareAmbientPackage( "mp_cairo_pkg" );
			
			//addAmbientElement( "mp_cairo_pkg", "amb_mp_cairo_bg_outdoor", 1, 3, 10, 200 );
		

		declareAmbientRoom( "mp_cairo_outside" );
	
			setAmbientRoomTone( "mp_cairo_outside", "amb_mp_cairo_bg_outdoor" );
			setAmbientRoomReverb( "mp_cairo_outside", "mp_cairo_outside", 1, 1 );
			setAmbientRoomContext( "mp_cairo_outside", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "mp_cairo_smallroom" );
			
			//setAmbientRoomTone( "mp_cairo_smallroom", "amb_mp_cairo_bg_indoor" );
			setAmbientRoomReverb( "mp_cairo_smallroom", "mp_cairo_smallroom", 1, 1 );
			setAmbientRoomContext( "mp_cairo_smallroom", "ringoff_plr", "indoor" );
		
		declareAmbientRoom( "mp_cairo_medroom" );
			
		//	setAmbientRoomTone( "mp_cairo_medroom", "amb_mp_cairo_bg_indoor" );
			setAmbientRoomReverb( "mp_cairo_medroom", "mp_cairo_medroom", 1, 1 );
			setAmbientRoomContext( "mp_cairo_medroom", "ringoff_plr", "indoor" );	
			
		
		declareAmbientRoom( "mp_cairo_lrgroom" );
			
			//setAmbientRoomTone( "mp_cairo_lrgroom", "amb_mp_cairo_bg_indoor" );
			setAmbientRoomReverb( "mp_cairo_lrgroom", "mp_cairo_lrgroom", 1, 1 );
			setAmbientRoomContext( "mp_cairo_lrgroom", "ringoff_plr", "indoor" );	
		
		declareAmbientRoom( "mp_cairo_tile_room" );
			
			//setAmbientRoomTone( "mp_cairo_tile_room", "amb_mp_cairo_bg_indoor" );
			setAmbientRoomReverb( "mp_cairo_tile_room", "mp_cairo_tile_room", 1, 1 );
			setAmbientRoomContext( "mp_cairo_tile_room", "ringoff_plr", "indoor" );	

		declareAmbientRoom( "mp_cairo_stairwell" );
			
			//setAmbientRoomTone( "mp_cairo_stairwell", "amb_mp_cairo_bg_indoor" );
			setAmbientRoomReverb( "mp_cairo_stairwell", "mp_cairo_stairwell", 1, 1 );
			setAmbientRoomContext( "mp_cairo_stairwell", "ringoff_plr", "indoor" );	
	




	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************
	

		
		activateAmbientPackage( 0, "mp_cairo_pkg", 0 );
		activateAmbientRoom( 0, "mp_cairo_outside", 0 );
		
		//declareMusicState("INTRO"); 
			//musicAlias("mx_thunt_into", 0);
		
thread snd_fx_create(); 
thread sound_loopers_start();

}
snd_fx_create ()
{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);
	
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_water_drip_xlight_short", "amb_water_drip");		
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_water_drip_light_short", "amb_water_drip");		
  clientscripts\mp\_audio::snd_play_auto_fx( "fx_mp_insect_swarm", "amb_flies");			
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_light_office_light_01", "amb_light_hum");				
	clientscripts\mp\_audio::snd_play_auto_fx( "fx_insects_swarm_md_light", "amb_flies");		
}
sound_loopers_start()
{
	//Loopers
	thread sound_playloop_sound ((-7,506,124),"amb_neon");
	thread sound_playloop_sound ((253,935,127),"amb_neon");	
	

}
sound_playloop_sound ( org, alias)
{
	 sound = spawn( 0, org, "script_origin" );
	 sound playloopsound ( alias );
}