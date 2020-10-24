//
// file: mp_kowloon_amb.csc
// description: clientside ambient script for mp_kowloon: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	//************************************************************************************************
	//                                              Ambient Packages
	//************************************************************************************************

	//declare an ambientpackage, and populate it with elements
	//mandatory parameters are <package name>, <alias name>, <spawnMin>, <spawnMax>
	//followed by optional parameters <distMin>, <distMax>, <angleMin>, <angleMax>
	
	
	//************************************************************************************************
	//                                       ROOMS
	//************************************************************************************************

	//explicitly activate the base ambientpackage, which is used when not touching any ambientPackageTriggers
	//the other trigger based packages will be activated automatically when the player is touching them
	//the same pattern is followed for setting up ambientRooms
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

		declareAmbientRoom( "mp_kowloon_outside" );
			setAmbientRoomTone( "mp_kowloon_outside", "amb_rain_outdoor",.5,.5  );
			setAmbientRoomReverb( "mp_kowloon_outside", "kowloon_open_top", 1, 1 );
			setAmbientRoomContext( "mp_kowloon_outside", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom ("mp_kowloon_inside"); 
			setAmbientRoomTone( "mp_kowloon_inside", "amb_rain_indoor",.5,.5 );
			setAmbientRoomreverb ("mp_kowloon_inside", "kowloon_smallroom", 1, 1);
			setAmbientRoomContext( "mp_kowloon_inside", "ringoff_plr", "indoor" );
		
		
		
		activateAmbientRoom( 0, "mp_kowloon_outside", 0 );	
		
//		level thread start_raining();
			thread snd_start_autofx_audio();
// MOVED RAIN TO RANDOMS INSTEAD OF USING THE SCRIPT
	
}
//**********************
//  RAIN
//**********************

start_raining()
{
    //trigger_start1 = GetEnt( 0, "start_creek_raining_light", "targetname" );
    //trigger_start2 = GetEnt( 0, "start_creek_raining_heavy", "targetname" );
    //trigger_end1 = GetEnt( 0, "end_creek_raining_heavy", "targetname" );
    //trigger_end2 = GetEnt( 0, "end_creek_raining_light", "targetname" );
    
    //if( !IsDefined( trigger_start1 ) )
   // {
        //IPrintLnBold( "Your Rain Triggers Don't Exist" );
	  //  return;
		//}
	
	level.raining_audio = undefined;
	
	array_thread( ( getstructarray( "rain_structs", "targetname" ) ), ::rain_3d_structs );

	level thread rain_tracker( "heavy" );

	//trigger_start2 thread rain_tracker( "heavy" );
	//trigger_end1 thread rain_tracker( "light" );
	//trigger_end2 thread rain_tracker( "end" );
	
}
rain_tracker( type )
{
    //IPrintLnBold( "AUDIO RAIN TRIGGER " + type + " WAITING" );
    //self waittill( "trigger" );
    //IPrintLnBold( "RAIN TRIGGER " + type + " HIT" );
    
    if( type == "end" )
    {
        level notify( "end_rain" );
        return;
    }
    
    level.raining_audio = type;
}

rain_3d_structs()
{
    level endon( "end_rain" );
    
    wait( RandomFloatRange( .5, .75 ) );
    
    while(1)
    {
        while( IsDefined( level.raining_audio ) )
        {
            if( level.raining_audio == "heavy" )
            {
                PlaySound( 0, "amb_rain_on_heavy_" + self.script_sound, self.origin );
                wait(RandomFloatRange( 0, 0.2 ) );
            }
            else if( level.raining_audio == "light" )
            {
                if( self.script_sound != "rock" )
                    PlaySound( 0, "amb_rain_on_light_" + self.script_sound, self.origin );
                
                wait(RandomFloatRange( 0.5,0.75 ) );
            }
        }
        wait(1);
    }
}


delete_rain_ent()
{
    level waittill( "end_rain" );
    self Delete();
}

snd_start_autofx_audio()
{
	snd_play_auto_fx ( "fx_insects_swarm_md_light", "amb_flies");
	snd_play_auto_fx ( "fx_pipe_steam_md", "amb_steam_hiss");
	//snd_play_auto_fx ( "fx_mp_berlin_smk_vent", "amb_steam_hiss_vent");
	snd_play_auto_fx ( "fx_mp_water_roof_spill_splsh_shrt", "amb_rain_gutter", 0, 0, 0, true );
	//snd_play_auto_fx ( "fx_mp_water_drip_light_short", "amb_water_drip", 0, 0, 0, true );
	//snd_play_auto_fx ( "fx_mp_berlin_smk_smolder_sm", "amb_fire_sml");
	
	snd_play_auto_fx ( "fx_sign_glow1", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_sign_glow2", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_sign_glow3", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_sign_glow4", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_sign_glow5", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_sign_glow6", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_sign_glow7", "amb_light_flourescent");
	snd_play_auto_fx ( "fx_sign_glow8", "amb_light_flourescent");
	//snd_play_auto_fx ( "fx_light_fluorescent_tube_nobulb2", "amb_light_flourescent");	
	//snd_play_auto_fx ( "fx_light_floodlight_dim", "amb_light_hum");
	//snd_play_auto_fx ( "fx_mp_berlin_light_cone_tinhat", "amb_light_hum");
	//snd_play_auto_fx ( "fx_light_godray_sm_ylw", "amb_light_hum");

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
snd_play_auto_fx_area_emmiters()
{
	for( i = 0; i < level.createFXent.size; i++ )
	{	
		if( level.createFXent[i].soundEntArea > 1 )
		{
			//getentarray level.createFXent[i].soundEntArea
			
		}	
	}	
}	
snd_print_fx_id( fxid, type, ent )
{
/#
	if( getdvarint( #"debug_audio" ) > 0 )
	{
		printLn( "^5 ******* fxid; " + fxid + "^5 type; " + type );
	}	
#/			
}
