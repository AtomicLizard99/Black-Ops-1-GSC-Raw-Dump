//
// file: template_amb.csc
// description: clientside ambient script for template: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;

main()
{
    //**** AMBIENT PACKAGES/ROOMS ****\\
    		
 	//DEFAULT: Exterior, snowing, default
 		declareAmbientRoom( "default" );
 		declareAmbientPackage( "default" );
 			setAmbientRoomTone( "default", "amb_blizzard_st_looper", 1.5, 1 );
 			setAmbientRoomReverb ("default","full_outdoor", 1, 1);
            //addAmbientElement( "default", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
 	
 	//Lighthouse Bedroom: Interior, stone walls, some holes in the wall, medium to small
 		declareAmbientRoom( "lighthouse_bedroom" );
 		declareAmbientPackage( "lighthouse_bedroom" );
 			//setAmbientRoomTone( "lighthouse_bedroom", "" );
 			setAmbientRoomReverb ("lighthouse_bedroom","full_small_stone_full", 1, 1);
            //addAmbientElement( "lighthouse_bedroom", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "lighthouse_bedroom", "ringoff_plr", "indoor" );
            setAmbientRoomSnapshot( "lighthouse_bedroom", "zmb_coast_interior");
            
    //Coast Cave: Interior, cave, two openings, medium to large, stone (duuuh)
 		declareAmbientRoom( "coast_cave" );
 		declareAmbientPackage( "coast_cave" );
 			//setAmbientRoomTone( "coast_cave", "" );
 			setAmbientRoomReverb ("coast_cave","full_hangar", 1, 1);
            //addAmbientElement( "coast_cave", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "coast_cave", "ringoff_plr", "indoor" );
            setAmbientRoomSnapshot( "coast_cave", "zmb_coast_interior_partial");
            
    //Coast Bunker: Interior room, medium, stone and huge metal door, leads to cave
 		declareAmbientRoom( "coast_bunker" );
 		declareAmbientPackage( "coast_bunker" );
 			//setAmbientRoomTone( "coast_bunker", "" );
 			setAmbientRoomReverb ("coast_bunker","full_small_stone_full", 1, 1);
            //addAmbientElement( "coast_bunker", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "coast_bunker", "ringoff_plr", "indoor" );
            setAmbientRoomSnapshot( "coast_bunker", "zmb_coast_interior_partial");
            
    //Lighthouse Bottom: Bottom two floors of the lighthouse, a few windows, stone, dark, really tall
 		declareAmbientRoom( "lighthouse_bottom" );
 		declareAmbientPackage( "lighthouse_bottom" );
 			//setAmbientRoomTone( "lighthouse_bottom", "" );
 			setAmbientRoomReverb ("lighthouse_bottom","full_hangar", 1, 1);
            //addAmbientElement( "lighthouse_bottom", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "lighthouse_bottom", "ringoff_plr", "indoor" );
            setAmbientRoomSnapshot( "lighthouse_bottom", "zmb_coast_interior");
            
    //Lighthouse Top: Top 2 floors of the lighthhouse, a few windows, stone, not quite as tall anymore
 		declareAmbientRoom( "lighthouse_top" );
 		declareAmbientPackage( "lighthouse_top" );
 			//setAmbientRoomTone( "lighthouse_top", "" );
 			setAmbientRoomReverb ("lighthouse_top","full_hangar", 1, 1);
            //addAmbientElement( "lighthouse_top", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "lighthouse_top", "ringoff_plr", "indoor" );     
            setAmbientRoomSnapshot( "lighthouse_top", "zmb_coast_interior");  
            
    //Ship Crate: Small metal crate, two openings
 		declareAmbientRoom( "ship_crate" );
 		declareAmbientPackage( "ship_crate" );
 			//setAmbientRoomTone( "ship_crate", "" );
 			setAmbientRoomReverb ("ship_crate","full_ship_gas_chamber", 1, 1);
            //addAmbientElement( "ship_crate", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "ship_crate", "ringoff_plr", "indoor" );      
            //setAmbientRoomSnapshot( "ship_crate", "zmb_coast_interior");                  

    //Ship Room Small: Small interior, usually all metal, sometimes has water in the floor
 		declareAmbientRoom( "ship_room_small" );
 		declareAmbientPackage( "ship_room_small" );
 			setAmbientRoomTone( "ship_room_small", "amb_ship_looper", 3, 1 );
 			setAmbientRoomReverb ("ship_room_small","full_ship_gas_chamber", 1, 1);
            //addAmbientElement( "ship_room_small", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "ship_room_small", "ringoff_plr", "indoor" );
            setAmbientRoomSnapshot( "ship_room_small", "zmb_coast_interior");
    
    //Ship Room Medium: Medium Interior, usually all metal, sometimes has water in the floor
 		declareAmbientRoom( "ship_room_medium" );
 		declareAmbientPackage( "ship_room_medium" );
 			setAmbientRoomTone( "ship_room_medium", "amb_ship_looper", 3, 1 );
 			setAmbientRoomReverb ("ship_room_medium","full_ship_default", 1, 1);
            //addAmbientElement( "ship_room_medium", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "ship_room_medium", "ringoff_plr", "indoor" );  
            setAmbientRoomSnapshot( "ship_room_medium", "zmb_coast_interior"); 
            
    //Ship Partial: Medium-Large Partial Interior, an entire half is gone, open in the middle ceiling, water in the floor, metal all around
 		declareAmbientRoom( "ship_partial" );
 		declareAmbientPackage( "ship_partial" );
 			setAmbientRoomTone( "ship_partial", "amb_blizzard_st_looper", 1.5, 1 );
 			setAmbientRoomReverb ("ship_partial","full_ship_partial", 1, 1);
            //addAmbientElement( "ship_partial", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "ship_partial", "ringoff_plr", "outdoor" );   
            
    //Ship Walkway: Covered walkway, open to one side, metal all around and such
 		declareAmbientRoom( "ship_walkway" );
 		declareAmbientPackage( "ship_walkway" );
 			setAmbientRoomTone( "ship_walkway", "amb_blizzard_st_looper", 1.5, 1 );
 			setAmbientRoomReverb ("ship_walkway","full_under_walkway", 1, 1);
            //addAmbientElement( "ship_walkway", "", 15, 60, 50, 150 );
            setAmbientRoomContext( "ship_walkway", "ringoff_plr", "outdoor" );                       

  activateAmbientPackage( 0, "default", 0 );
  activateAmbientRoom( 0, "default", 0 );

  //MUSIC STATES		
	declareMusicState("WAVE");
		musicAliasloop("mus_cosmo_underscore", 6, 2);	
		
	declareMusicState("EGG");
		musicAlias("mus_egg", 2);
		
	declareMusicState( "SILENCE" );
	    musicAlias("null", 1 );
	
    level thread play_poweron_sounds();
    level thread lighthouse_looper();
    
    //For Wind Transition Sounds
    array_thread( getstructarray( "blizzard_transitions", "targetname" ), ::indoor_outdoor_transitions );
    level thread waitfor_revive_deactivate();
    level thread director_futz_change_on();
    level thread director_futz_change_off();
    level thread snd_start_autofx_audio();
}

director_futz_change_on()
{
    while(1)
    {
        level waittill( "dclm" );
        setdvarfloat( "snd_futz", 0 );
    }
}
director_futz_change_off()
{
    while(1)
    {
        level waittill( "dmad" );
        setdvarfloat( "snd_futz", 1 );
    }
}

waitfor_revive_deactivate()
{
    level waittill( "drb" );
    level notify( "deactivate_revive_bump" );
}

play_poweron_sounds()
{
    level waittill( "LHL" );
    
    PlaySound( 0, "evt_flip_sparks_left", (-739, -876, 682 ) );
    PlaySound( 0, "evt_flip_sparks_right", (-687, -1124, 709 ) );
    
    wait(.75);
    PlaySound( 0, "zmb_lighthouse_light_flash", ( -52, 1353, 2503 ) );
    PlaySound( 0, "evt_poweron_front", (0,0,0) );
    
    wait(5);
    
    PlaySound( 0, "zmb_ship_horn_poweron", (-694, -990, 1025 ) );
}

lighthouse_looper()
{
    level waittill( "LHL" );
    
    sound_ent = spawn( 0, ( -61, 1359, 1049 ), "script_origin" );
    
    PlaySound( 0, "zmb_lighthouse_start", sound_ent.origin );
    sound_ent PlayLoopSound( "zmb_lighthouse_loop", 1 );
    
    //INSERT SOMETHING HERE FOR WHEN THIS GUY STOPS
    level waittill( "forever" );
    
    sound_ent stoploopsound( 1 );
    PlaySound( 0, "zmb_lighthouse_end", sound_ent.origin );
}

indoor_outdoor_transitions()
{
    wait( RandomFloatRange( .5, 2 ) );
    
    while(1)
    {
        while( IsDefined( level.blizzard ) )
        {
            if( level.blizzard == true )
            {
                PlaySound( 0, "amb_blizzard_rand_heavy", self.origin );
                wait(RandomFloatRange( 1,1.5 ) );
               	waitforclient(0);

            }
            else if( level.blizzard == false )
            {
                PlaySound( 0, "amb_blizzard_rand_light", self.origin );
                
                wait(RandomFloatRange( 1,1.5 ) );
               	waitforclient(0);
            }
        }
        wait(1);
       	waitforclient(0);
    }
}

		
snd_start_autofx_audio()
{
	snd_play_auto_fx ( "fx_fire_line_xsm", "amb_fire");
	

}

snd_play_auto_fx( fxid, alias, offsetx, offsety, offsetz, onground, area )
{


	for( i = 0; i < level.createFXent.size; i++ )
	{
		if( level.createFXent[i].v["fxid"] == fxid )
		{
			level.createFXent[i].soundEnt = spawnFakeEnt( 0 );
			
			if (isdefined (area))
			{
				level.createFXent[i].soundEntArea = area;
			}	
			
			origin = level.createFXent[i].v["origin"];
			
			if (isdefined (offsetx) && offsetx > 0 )
			{
				//add offset to origin
				origin = origin + (offsetx,0,0);
			}
			if (isdefined (offsety) && offsetx > 0 )
			{
				//add offset to origin
				origin = origin + (0,offsety,0);
			}
			if (isdefined (offsetz) && offsetx > 0 )
			{
				//add offset to origin
				origin = origin + (0,0,offsetz);
			}
			if (isdefined (onground) && onground )
			{
				//check to ground move origin to ground + offest to ensure is above ground
			trace = undefined; 
			d = undefined; 

			FxOrigin = origin; 
			trace = bullettrace( FxOrigin, FxOrigin -( 0, 0, 100000 ), false, undefined ); 

			d = distance( FxOrigin, trace["position"] ); 
			
			origin =  trace["position"];
					
			}														
			setfakeentorg( 0, level.createFXent[i].soundEnt, origin );
			
			playloopsound( 0, level.createFXent[i].soundEnt, alias, .5 );

		}
	}
}


