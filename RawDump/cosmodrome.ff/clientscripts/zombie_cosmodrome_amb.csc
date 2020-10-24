#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_busing;
#include clientscripts\_audio;

main()
{
    //**** AMBIENT PACKAGES/ROOMS ****\\
    
    		
 	//DEFAULT: Cosmodrome Exterior, large areas with dirt floor
 		declareAmbientRoom( "cosmo_exterior" );
 		declareAmbientPackage( "cosmo_exterior" );
 			//setAmbientRoomTone( "cosmo_exterior", "" );
 			setAmbientRoomReverb ("cosmo_exterior","flashpoint_outside", 1, 1);
            //addAmbientElement( "cosmo_exterior", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "cosmo_exterior", "ringoff_plr", "outdoor" );
            
    //Centrifuge: Interior room, large, mostly metal, centrifuge trap is in the center
 		declareAmbientRoom( "cosmo_centrifuge" );
 		declareAmbientPackage( "cosmo_centrifuge" );
 			//setAmbientRoomTone( "cosmo_centrifuge", "" );
 			setAmbientRoomReverb ("cosmo_centrifuge","flashpoint_concrete_room", 1, 1);
            //addAmbientElement( "cosmo_centrifuge", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "cosmo_centrifuge", "ringoff_plr", "indoor" );
            
    //Cosmo Medium: Interior room, medium, mostly stone and metal
 		declareAmbientRoom( "cosmo_medium" );
 		declareAmbientPackage( "cosmo_medium" );
 			//setAmbientRoomTone( "cosmo_medium", "" );
 			setAmbientRoomReverb ("cosmo_medium","flashpoint_facility_tunnel", 1, 1);
            //addAmbientElement( "cosmo_medium", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "cosmo_medium", "ringoff_plr", "indoor" );
            
    //Cosmo Partial Metal: Exterior, metal walls on some sides, open top, usually a metal floor, still open to the outside
 		declareAmbientRoom( "cosmo_partial_metal" );
 		declareAmbientPackage( "cosmo_partial_metal" );
 			//setAmbientRoomTone( "cosmo_partial_metal", "" );
 			setAmbientRoomReverb ("cosmo_partial_metal","flashpoint_facility_small_b", 1, 1);
            //addAmbientElement( "cosmo_partial_metal", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "cosmo_partial_metal", "ringoff_plr", "outdoor" );
            
    //Cosmo Rocket Room: No ceiling, humongoid, stone and metal, houses the rocket (obviously)
 		declareAmbientRoom( "cosmo_rocket_room" );
 		declareAmbientPackage( "cosmo_rocket_room" );
 			//setAmbientRoomTone( "cosmo_rocket_room", "" );
 			setAmbientRoomReverb ("cosmo_rocket_room","flashpoint_rocket_pad", 1, 1);
            //addAmbientElement( "cosmo_rocket_room", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "cosmo_rocket_room", "ringoff_plr", "outdoor" );       
            
    //Cosmo Packa Room: Fully closed room, large, mostly stone and metal, floor is way beneath walkway you stand on
 		declareAmbientRoom( "cosmo_packa_room" );
 		declareAmbientPackage( "cosmo_packa_room" );
 			//setAmbientRoomTone( "cosmo_packa_room", "" );
 			setAmbientRoomReverb ("cosmo_packa_room","flashpoint_drainage_room", 1, 1);
            //addAmbientElement( "cosmo_packa_room", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "cosmo_packa_room", "ringoff_plr", "indoor" );                                  

  activateAmbientPackage( 0, "cosmo_exterior", 0 );
  activateAmbientRoom( 0, "cosmo_exterior", 0 );

  //MUSIC STATES		
	declareMusicState("WAVE");
		musicAliasloop("mus_cosmo_underscore", 6, 2);	
		
	declareMusicState("EGG");
		musicAlias("mus_egg", 2);
		
	declareMusicState( "SILENCE" );
	    musicAlias("null", 1 );
	    
	
    //FUNCTIONS
	level thread alarm_a_timer();	
	level thread alarm_b_timer();	
	level thread spawn_fx_loopers();
	level thread play_minigun_loop();
	level thread samantha_is_angry_setup();
	//level thread nesting_doll_vox_setup();
}

spawn_fx_loopers()
{
    //Fires
    clientscripts\_audio::snd_play_auto_fx( "fx_fire_line_xsm", "amb_fire_medium");
    clientscripts\_audio::snd_play_auto_fx( "fx_fire_line_sm", "amb_fire_large");
    clientscripts\_audio::snd_play_auto_fx( "fx_fire_wall_back_sm", "amb_fire_large");
    clientscripts\_audio::snd_play_auto_fx( "fx_fire_destruction_lg", "amb_fire_extreme");
    clientscripts\_audio::snd_play_auto_fx( "fx_zmb_fire_sm_smolder", "amb_fire_medium");
    
    clientscripts\_audio::snd_play_auto_fx( "fx_elec_terminal", "amb_break_arc");
    clientscripts\_audio::snd_play_auto_fx( "fx_zmb_elec_terminal_bridge", "amb_break_arc");
    clientscripts\_audio::snd_play_auto_fx( "fx_zmb_pipe_steam_md", "amb_steam_medium");
    clientscripts\_audio::snd_play_auto_fx( "fx_zmb_pipe_steam_md_runner", "amb_steam_medium");
    clientscripts\_audio::snd_play_auto_fx( "fx_zmb_steam_hallway_md", "amb_steam_medium");
    clientscripts\_audio::snd_play_auto_fx( "fx_zmb_water_spray_leak_sm", "amb_water_spray_small");
}

play_minigun_loop()
{
    while(1)
    {
        level waittill( "minis" );
        ent = spawn( 0, (0,0,0), "script_origin" );
        ent PlayLoopSound( "zmb_insta_kill_loop" );
        level waittill( "minie" );
        PlaySound( 0, "zmb_insta_kill", (0,0,0) );
        ent stoploopsound( .5 );
        wait(.5);
        ent Delete();
    }
}

// ********************* Gantry Alarm Event *********************************

alarm_a_timer()
{
	level waittill("power_on");
	wait(2.5);
	level thread alarm_a();
	wait(21);
	level notify ("alarm_a_Off");
}

alarm_b_timer()
{
	level waittill("power_on");
	wait(8.5);
	level thread alarm_b();
}

play_alarm_a()
{
	level endon ("alarm_a_Off");

	while(1)
	{
		playsound(0,"evt_alarm_a", self.origin);
		wait(1.1);		
	}	
}

play_alarm_b()
{
		//iprintlnbold("ALARM BELLS");
		alarm_bell = spawn(0, self.origin, "script.origin");
		alarm_bell playloopsound("evt_alarm_b_loop", 0.8);
		wait(8.8);		
		playsound(0,"evt_alarm_b_end", self.origin);
		wait(0.1);
		alarm_bell stoploopsound(0.6);
		wait(3);
		alarm_bell delete();
}

alarm_a()
{
	array_thread(getstructarray( "amb_warning_siren", "targetname" ), ::play_alarm_a);
	//array_thread(getstructarray( "amb_warning_bell", "targetname" ), ::play_pa_vox);		
}

alarm_b()
{
	array_thread(getstructarray( "amb_warning_bell", "targetname" ), ::play_alarm_b);
}

play_pa_vox()
{
	wait(2);
	playsound(0,"amb_vox_rus_PA", self.origin);
}

samantha_is_angry_setup()
{
    waitforclient( 0 );
    
    player = getlocalplayers();
    for(i=0;i<player.size;i++)
    {
        player[i] thread samantha_is_angry_earthquake_and_rumbles();
    }
}

samantha_is_angry_earthquake_and_rumbles()
{
    self endon("death");
	self endon("disconnect");
	
	level waittill( "sia" );
	
	snd_set_snapshot( "zmb_samantha_scream" );
	self Earthquake( .4, 10, self.origin, 150 );
	self clientscripts\_zombiemode::zombie_vision_set_apply( level._visionset_map_nopower, 8 );
	self thread do_that_sam_rumble();
	wait(6);
	snd_set_snapshot( "default" );
	self clientscripts\_zombiemode::zombie_vision_set_remove( level._visionset_map_nopower, 3 );
}

do_that_sam_rumble()
{
    count = 0;
    
    while( count <= 4 )
    {
        self PlayRumbleOnEntity( 0, "damage_heavy" );
        wait(.1);
        count = count + .1;
    }
}

/*
nesting_doll_vox_setup()
{
	players = getlocalplayers();
	
	for(i=0;i<players.size;i++)
	{
	    players[i] thread plr_nesting_doll_vox_wait();
	}
}

plr_nesting_doll_vox_wait()
{
    self endon( "disconnect" );
    
    while(1)
    {
        level waittill( "notetrack", localclientnum, note );
		
		IPrintLnBold( "GOT HERE" );
		
		if( note == "audio_nesting_doll_vox" )
		{
		    localPlayer = GetLocalPlayer( localClientNum );
		    
		    if( self == localPlayer )
		    {
		        entNum = self GetEntityNumber();
		        
		        //PlaySound( 0, "vox_nesting_" + entNum, (0,0,0) );
		    }
		}
    }
}
*/