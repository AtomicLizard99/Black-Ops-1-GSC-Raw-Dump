//
// file: template_amb.csc
// description: clientside ambient script for template: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_busing;
#include clientscripts\_audio;

main()
{
 
    //**** AMBIENT PACKAGES/ROOMS ****\\
    
    		
 	//DEFAULT: Main Theater Area, where the seats and such are
 		declareAmbientRoom( "theater_main_room" );
 		declareAmbientPackage( "theater_main_room" );
 			setAmbientRoomTone( "theater_main_room", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_main_room","zmb_theater_main_room", 1, 1);
            addAmbientElement( "theater_main_room", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_main_room", "ringoff_plr", "indoor" );
            
    //Theater Lobby: Main lobby, quite large, mostly wood
 		declareAmbientRoom( "theater_lobby" );
 		declareAmbientPackage( "theater_lobby" );
 			setAmbientRoomTone( "theater_lobby", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_lobby","zmb_theater_lobby", 1, 1);
            addAmbientElement( "theater_lobby", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_lobby", "ringoff_plr", "indoor" );
            
    //Theater Sideroom: Sideroom to the theater, medium to small, all wood
 		declareAmbientRoom( "theater_sideroom" );
 		declareAmbientPackage( "theater_sideroom" );
 			setAmbientRoomTone( "theater_sideroom", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_sideroom","zmb_theater_sideroom", 1, 1);
            addAmbientElement( "theater_sideroom", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_sideroom", "ringoff_plr", "indoor" );               
     
    //Theater Hallway: It's a hallway, yo
 		declareAmbientRoom( "theater_hallway" );
 		declareAmbientPackage( "theater_hallway" );
 			setAmbientRoomTone( "theater_hallway", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_hallway","zmb_theater_hallway", 1, 1);
            addAmbientElement( "theater_hallway", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_hallway", "ringoff_plr", "indoor" );
            
    //Theater Parlour: Bar area for entertaining guests, Large room
 		declareAmbientRoom( "theater_parlour" );
 		declareAmbientPackage( "theater_parlour" );
 			setAmbientRoomTone( "theater_parlour", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_parlour","zmb_theater_parlour", 1, 1);
            addAmbientElement( "theater_parlour", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_parlour", "ringoff_plr", "indoor" );
            
    //Theater Dressing Room: Backstage dressing area
 	    declareAmbientRoom( "theater_dressing_room" );
 		declareAmbientPackage( "theater_dressing_room" );
 			setAmbientRoomTone( "theater_dressing_room", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_dressing_room","zmb_theater_dressing_room", 1, 1);
            addAmbientElement( "theater_dressing_room", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_dressing_room", "ringoff_plr", "indoor" ); 
            
    //Theater Backstage: Area behind curtain threshold. Initially, curtain closes it off from Main Theater Area
 	    declareAmbientRoom( "theater_backstage" );
 		declareAmbientPackage( "theater_backstage" );
 			setAmbientRoomTone( "theater_backstage", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_backstage","zmb_theater_backstage", 1, 1);
            addAmbientElement( "theater_backstage", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_backstage", "ringoff_plr", "indoor" );
            
    //Theater Backstage Stairwell: Metal stairs lead up a predominantly stone room
 	    declareAmbientRoom( "theater_backstage_stairwell" );
 		declareAmbientPackage( "theater_backstage_stairwell" );
 			setAmbientRoomTone( "theater_backstage_stairwell", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_backstage_stairwell","zmb_theater_backstage_stairwell", 1, 1);
            addAmbientElement( "theater_backstage_stairwell", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_backstage_stairwell", "ringoff_plr", "indoor" );
            
    //Theater Machiner: Room for running the lights, etc. Full of machinery, predominantly stone, smallish in size
 	    declareAmbientRoom( "theater_machinery" );
 		declareAmbientPackage( "theater_machinery" );
 			setAmbientRoomTone( "theater_machinery", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_machinery","zmb_theater_machinery", 1, 1);
            addAmbientElement( "theater_machinery", "2d_wood", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_machinery", "ringoff_plr", "indoor" );
            
    //Theater Under Machiner: Outdoor room, closed on 3 sides, located directly under machinery room, stone
 	    declareAmbientRoom( "theater_under_machinery" );
 		declareAmbientPackage( "theater_under_machinery" );
 			setAmbientRoomTone( "theater_under_machinery", "zmb_theater_under_machinery" );
 			setAmbientRoomReverb ("theater_under_machinery","arena", 1, 1);
            addAmbientElement( "theater_under_machinery", "2d_wood", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_under_machinery", "ringoff_plr", "outdoor" );
            
    //Theater Alleyway: Outdoor room, alleyway on the side of the theater
 	    declareAmbientRoom( "theater_alleyway" );
 		declareAmbientPackage( "theater_alleyway" );
 			setAmbientRoomTone( "theater_alleyway", "theater_amb_loop" );
 			setAmbientRoomReverb ("theater_alleyway","zmb_theater_alleyway", 1, 1);
            addAmbientElement( "theater_alleyway", "2d_wood", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_alleyway", "ringoff_plr", "outdoor" );
            
    //Theater Projector Booth: Very small room, can only warp to it, where the projector resides
 	    declareAmbientRoom( "theater_projector_booth" );
 		declareAmbientPackage( "theater_projector_booth" );
 			setAmbientRoomTone( "theater_projector_booth", "amb_theater_bg" );
 			setAmbientRoomReverb ("theater_projector_booth","zmb_theater_projector_booth", 1, 1);
            addAmbientElement( "theater_projector_booth", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_projector_booth", "ringoff_plr", "outdoor" );
            
    //Theater Tele Rooms: Teleporter Rooms, creepy
 	    declareAmbientRoom( "theater_teleroom" );
 		declareAmbientPackage( "theater_teleroom" );
 			setAmbientRoomTone( "theater_teleroom", "amb_teleroom_bg" );
 			setAmbientRoomReverb ("theater_teleroom","zmb_theater_main_room", 1, 1);
            //addAmbientElement( "theater_teleroom", "amb_wood_groan", 15, 60, 50, 150 );
            setAmbientRoomContext( "theater_teleroom", "ringoff_plr", "outdoor" );                                                                    
    

	//Default Ambient Package
        activateAmbientPackage( 0, "theater_main_room", 0 );
        activateAmbientRoom( 0, "theater_main_room", 0 );

  //MUSIC STATES		
	declareMusicState("WAVE");
		musicAliasloop("mus_theatre_underscore", 4, 2);	
		
	declareMusicState("EGG");
		musicAlias("mus_egg", 1);
		
	declareMusicState( "SILENCE" );
	    musicAlias("null", 1 );	
		
	//THREADED FUNCTIONS
	thread power_on_all();	
}

//POWER ON
power_on_all()
{
	level waittill( "pl1" );
	level thread telepad_loop();
	level thread teleport_2d();
	level thread teleport_2d_nopad();
	level thread teleport_beam_fx_2d();
	level thread teleport_specialroom_start();
	level thread teleport_specialroom_go();
}

//TELEPORTER
telepad_loop()
{
	/*
	power_loop = getstruct( "telepad_looper_0", "targetname" );
	gen_loop = getstruct( "telepad_looper_1", "targetname" );
	
	if(isdefined( power_loop ))
	{
		clientscripts\_audio::playloopat( 0, "power_loop", power_loop.origin, 1 );
	}
	
	if(isdefined( gen_loop ))
	{
		playsound( 0, "gen_start", gen_loop.origin );
		clientscripts\_audio::playloopat( 0, "gen_loop", gen_loop.origin, 1 );
	}
	*/
	
	telepad = getstructarray( "telepad", "targetname" );
	array_thread( telepad, ::teleportation_audio );
}

teleportation_audio()  //Plays warmup and cooldown audio for homepad and telepads
{
	teleport_delay = 2;
	
	while(1)
	{
		level waittill( "tpa" );

		if(IsDefined( self.script_sound ))
		{
			playsound( 0, "evt_" + self.script_sound + "_warmup", self.origin );
			realwait(teleport_delay);
			playsound( 0, "evt_" + self.script_sound + "_cooldown", self.origin );
		}
	}		
}

teleport_2d()  //Plays a 2d sound for a teleporting player 1.7 seconds after activating teleporter
{
	while(1)
	{
		level waittill( "t2d" );
		playsound( 0, "evt_teleport_2d_fnt", (0,0,0) );
		playsound( 0, "evt_teleport_2d_rear", (0,0,0) );
	}
}

teleport_2d_nopad()
{
	while(1)
	{
		level waittill( "t2dn" );
		playsound( 0, "evt_pad_warmup_2d", (0,0,0) );
		wait(1.3);
		playsound( 0, "evt_teleport_2d_fnt", (0,0,0) );
		playsound( 0, "evt_teleport_2d_rear", (0,0,0) );
	}
}

teleport_beam_fx_2d()
{
    while(1)
    {
        level waittill( "t2bfx" );
        playsound( 0, "evt_beam_fx_2d", (0,0,0) );
    }
}

teleport_specialroom_start()
{
    while(1)
    {
        level waittill( "tss" );
        playsound( 0, "evt_pad_warmup_2d", (0,0,0) );
    }
}

teleport_specialroom_go()
{
    while(1)
    {
        level waittill( "tsg" );
        playsound( 0, "evt_teleport_2d_fnt", (0,0,0) );
		playsound( 0, "evt_teleport_2d_rear", (0,0,0) );
    }
}