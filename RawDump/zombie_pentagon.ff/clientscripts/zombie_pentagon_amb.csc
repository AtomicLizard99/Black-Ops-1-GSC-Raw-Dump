//
// file: zombie_pentagon_amb.csc
// description: clientside ambient script for zombie_pentagon: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;

main()
{
//**** AMBIENT PACKAGES/ROOMS ****\\

		
//DEFAULT: Top floor, mainly pentagon offices, woody, all medium-sized
	declareAmbientRoom( "pentagon_default" );
	declareAmbientPackage( "pentagon_default" );
		setAmbientRoomTone( "pentagon_default", "amb_office_bg" );
		setAmbientRoomReverb ("pentagon_default","zmb_theater_main_room", 1, 1);
        //addAmbientElement( "pentagon_default", "amb_wood_groan", 15, 60, 50, 150 );
        setAmbientRoomContext( "pentagon_default", "ringoff_plr", "indoor" );
        
    //First elevator, smallish, regular type elevator same as in Pentagon SP level
    declareAmbientRoom( "pentagon_elevator" );
	declareAmbientPackage( "pentagon_elevator" );
		setAmbientRoomTone( "pentagon_elevator", "amb_office_bg" );
		setAmbientRoomReverb ("pentagon_elevator","zmb_theater_main_room", 1, 1);
        //addAmbientElement( "pentagon_elevator", "amb_wood_groan", 15, 60, 50, 150 );
        setAmbientRoomContext( "pentagon_elevator", "ringoff_plr", "indoor" );
        
    //Big ass warroom, same as in Pentagon SP
    declareAmbientRoom( "pentagon_warroom" );
	declareAmbientPackage( "pentagon_warroom" );
		setAmbientRoomTone( "pentagon_warroom", "amb_warroom_bg" );
		setAmbientRoomReverb ("pentagon_warroom","zmb_theater_main_room", 1, 1);
        //addAmbientElement( "pentagon_warroom", "amb_wood_groan", 15, 60, 50, 150 );
        setAmbientRoomContext( "pentagon_warroom", "ringoff_plr", "indoor" );
        
    //Presidential offshoot from the War Room, mostly woody and carpeted, medium
    declareAmbientRoom( "pentagon_warroom_suite" );
	declareAmbientPackage( "pentagon_warroom_suite" );
		setAmbientRoomTone( "pentagon_warroom_suite", "amb_office_bg" );
		setAmbientRoomReverb ("pentagon_warroom_suite","zmb_theater_main_room", 1, 1);
        //addAmbientElement( "pentagon_warroom_suite", "amb_wood_groan", 15, 60, 50, 150 );
        setAmbientRoomContext( "pentagon_warroom_suite", "ringoff_plr", "indoor" );
        
    //Lab Elevator off of the war room, larger freight type elevator, metal-ish
    declareAmbientRoom( "lab_elevator" );
	declareAmbientPackage( "lab_elevator" );
		setAmbientRoomTone( "lab_elevator", "amb_lab_bg" );
		setAmbientRoomReverb ("lab_elevator","zmb_theater_main_room", 1, 1);
        //addAmbientElement( "lab_elevator", "amb_wood_groan", 15, 60, 50, 150 );
        setAmbientRoomContext( "lab_elevator", "ringoff_plr", "indoor" );
        
    //Lab, same as Rebirth labs in SP, hallways and medium sized rooms, all one trigger
    declareAmbientRoom( "lab" );
	declareAmbientPackage( "lab" );
		setAmbientRoomTone( "lab", "amb_lab_bg" );
		setAmbientRoomReverb ("lab","zmb_theater_main_room", 1, 1);
        //addAmbientElement( "lab", "amb_wood_groan", 15, 60, 50, 150 );
        setAmbientRoomContext( "lab", "ringoff_plr", "indoor" );                                                                               


//Default Ambient Package
    activateAmbientPackage( 0, "pentagon_default", 0 );
    activateAmbientRoom( 0, "pentagon_default", 0 );
    
    
//MUSIC STATES
  
	declareMusicState("WAVE");
		musicAliasloop("mus_pentagon_underscore", 4, 2);	
		
	declareMusicState("EGG");
		musicAlias("mus_egg_mature", 1);
		
	declareMusicState("EGG_SAFE");
		musicAlias("mus_egg_safe", 1);	
		
	declareMusicState( "SILENCE" );
	    musicAlias("null", 1 );    	
		
//FUNCTIONS
    
    level thread play_elevator1_audio();
    level thread play_elevator2_audio();
    level thread play_minigun_loop();
}

play_elevator1_audio()
{
    while(1)
    {
        level waittill( "ele1" );
        ent = spawn( 0, (0,0,0), "script_origin" );
        PlaySound( 0, "evt_elevator_office_start", ent.origin );
        ent PlayLoopSound( "evt_elevator_office_run", 1 );
        level waittill( "ele1e" );
        ent stoploopsound( 1 );
        PlaySound( 0, "evt_elevator_office_stop", ent.origin );
        wait(1);
        ent Delete();
    }
}

play_elevator2_audio()
{
    while(1)
    {
        level waittill( "ele2" );
        ent = spawn( 0, (0,0,0), "script_origin" );
        PlaySound( 0, "evt_elevator_freight_start", ent.origin );
        ent PlayLoopSound( "evt_elevator_freight_run", 1 );
        level waittill( "ele2e" );
        ent stoploopsound( 1 );
        PlaySound( 0, "evt_elevator_freight_stop", ent.origin );
        wait(1);
        ent Delete();
    }
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