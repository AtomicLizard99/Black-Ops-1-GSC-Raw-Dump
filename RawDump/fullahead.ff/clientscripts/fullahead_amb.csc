//
// file: fullahead_amb.csc
// description: clientside ambient script for fullahead: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_busing;
#include clientscripts\_audio;

main()
{
	//**AMBIENT PACKAGES**\\
	
	    //Default: SNOWY, OUTDOOR, THINK WMD
		    declareAmbientRoom( "default" );
		    declareAmbientPackage( "default" );
		        setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("default","full_outdoor", 1, 1);
			    setAmbientRoomTone( "default", "amb_blizzard_st_looper", .5, .5 );
			    //addAmbientElement( "default", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Small Sheet Partial: Small, rounded, made from sheet metal, open from multiple points
		    declareAmbientRoom( "small_sheet_partial" );
		    declareAmbientPackage( "small_sheet_partial" );
		        setAmbientRoomContext( "small_sheet_partial", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("small_sheet_partial","full_small_partial", 1, 1);
			    //setAmbientRoomTone( "small_sheet_partial", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "small_sheet_partial", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Small Sheet Full: Small, made mostly from sheet metal, has some wood and various pieces of furniture
		    declareAmbientRoom( "small_sheet_full" );
		    declareAmbientPackage( "small_sheet_full" );
		        setAmbientRoomContext( "small_sheet_full", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("small_sheet_full","full_small_full", 1, 1);
			    //setAmbientRoomTone( "small_sheet_full", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "small_sheet_full", "amb_wind_dirty_gust", 4, 13, 50, 1100 );	    
		
		//Small Stone Partial: Small stone-based room, open on one or more sides
		    declareAmbientRoom( "small_stone_partial" );
		    declareAmbientPackage( "small_stone_partial" );
		        setAmbientRoomContext( "small_stone_partial", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("small_stone_partial","full_small_stone_partial", 1, 1);
			    //setAmbientRoomTone( "small_stone_partial", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "small_stone_partial", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Small Stone Full: Small stone-based room, equipment and other crap instead
		    declareAmbientRoom( "small_stone_full" );
		    declareAmbientPackage( "small_stone_full" );
		        setAmbientRoomContext( "small_stone_full", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("small_stone_full","full_small_stone_full", 1, 1);
			    //setAmbientRoomTone( "small_stone_full", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "small_stone_full", "amb_wind_dirty_gust", 4, 13, 50, 1100 );	    
			    
		//Small Wood Partial: Wood ceiling, open on multiple sides, small
		    declareAmbientRoom( "small_wood_partial" );
		    declareAmbientPackage( "small_wood_partial" );
		        setAmbientRoomContext( "small_wood_partial", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("small_wood_partial","full_small_wood_partial", 1, 1);
			    //setAmbientRoomTone( "small_wood_partial", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "small_wood_partial", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Hangar: Medium sized, combo of metal and stone
		    declareAmbientRoom( "hangar" );
		    declareAmbientPackage( "hangar" );
		        setAmbientRoomContext( "hangar", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("hangar","full_hangar", 1, 1);
			    //setAmbientRoomTone( "hangar", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "hangar", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Under Walkway: Area under a mostly stone/metal walkway.  Between the last two buildings of the village battle
		    declareAmbientRoom( "under_walkway" );
		    declareAmbientPackage( "under_walkway" );
		        setAmbientRoomContext( "under_walkway", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("under_walkway","full_under_walkway", 1, 1);
			    //setAmbientRoomTone( "under_walkway", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "under_walkway", "amb_wind_dirty_gust", 4, 13, 50, 1100 );	
			    
		//Ship Default: This includes EVERY area of the ship except the deck, which uses default, and a few special rooms
		    declareAmbientRoom( "ship_default" );
		    declareAmbientPackage( "ship_default" );
		        setAmbientRoomContext( "ship_default", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("ship_default","full_ship_default", 1, 1);
			    setAmbientRoomTone( "ship_default", "amb_ghost_ship_looper", .5, .5 );
			    addAmbientElement( "ship_default", "amb_ghost_ship_randoms", 6, 18, 250, 1400 );		
			    
		//Ship Partial: Partially covered ship, should be close to default
		    declareAmbientRoom( "ship_partial" );
		    declareAmbientPackage( "ship_partial" );
		        setAmbientRoomContext( "ship_partial", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("ship_partial","full_ship_partial", 1, 1);
			    //setAmbientRoomTone( "ship_partial", "amb_ghost_ship_looper", .5, .5 );
			    //addAmbientElement( "ship_partial", "amb_ghost_ship_randoms", 9, 30, 250, 1400 );
			    
		//Ship Gas Chamber: Small metal chamber you're locked in. Added in case we wanted a different verb
		    declareAmbientRoom( "ship_gas_chamber" );
		    declareAmbientPackage( "ship_gas_chamber" );
		        setAmbientRoomContext( "ship_gas_chamber", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("ship_gas_chamber","full_ship_gas_chamber", 1, 1);
			    //setAmbientRoomTone( "ship_gas_chamber", "bgt_outdoor_wind_high", .5, .5 );
			    //addAmbientElement( "ship_gas_chamber", "amb_wind_dirty_gust", 4, 13, 50, 1100 );	 
			       		            	    	    		    	    
	    //DEFAULT AMBIENT PACKAGES
	        activateAmbientPackage( 0, "default", 0 );
	        activateAmbientRoom( 0, "default", 0 );
	
	//**MUSIC STATES**\\
	
		declareMusicState ("INTRO");
			musicAlias ("mus_kgb_intro", 0);
			
		declareMusicState ("SLED");
			musicAliasloop ("mus_kgb_sled", 2, 3);
		
		declareMusicState ("NARRATION_POST_DOGSLED");
			musicAliasloop ("mus_kgb_intro_loop", 0, 3);
		
		declareMusicState ("FIRST_FIGHT");
			musicAliasloop ("mus_ber3waw_fullahead_short", 0, 2);
			musicStinger ("mus_ber3waw_fullahead_stg", 7, true);
		
		declareMusicState ("NOT_HERE");
			musicAliasloop ("mus_kgb_sled", 0, 3);
			
		declareMusicState ("MORTARS");
			musicAliasloop ("mus_ber3waw_fullahead_long", 0, 3);
			musicStinger ("mus_ber3waw_fullahead_long_stg", 7, true);
			
		declareMusicState ("POST_MORTARS");
			musicAliasloop ("mus_kgb_intro_loop", 4, 2);
			
		declareMusicState ("PRE_STEINER");
			musicAliasloop ("mus_russianswaw_fullahead", 3, 4);
//			musicStinger ("mus_russianswaw_fullahead_stg", 25, true);
		
	
		declareMusicState ("STIENER");
			musicAliasloop ("mus_panthers_steiners", 0, 3);

		declareMusicState ("BOAT_ARRIVE");
			musicAliasloop ("mus_panthers_boat_arrive", 2, 2);
		
		declareMusicState ("BOAT_WALK");
			musicAliasloop ("mus_panthers_boat_arrive", 0, 2);

		declareMusicState ("BLACK");
			musicAliasloop ("mus_panthers_black", 0, 2);
		
		declareMusicState ("ESCAPE");
			musicAliasloop ("mus_ber3waw_fullahead_short", 0, 2);
			musicStinger ("mus_ber3waw_fullahead_stg", 2, true);

		declareMusicState ("IT_IS_OVER");
			musicAliasloop ("mus_kgb_intro_loop", 3, 2);
		
		
		declareMusicstate ("UBER_TEMP");
			musicAliasloop("mus_panthers_TEMP_loop", 0,0);
	
		
		level thread snapshot_manager_1();	
		level thread snapshot_manager_2();	
		level thread snapshot_manager_3();	
		level thread snapshot_manager_4();	
		level thread snapshot_manager_5();
		level thread vorkuta_fire_looper();		
	
	//OLD CRAP
	
	declareAmbientRoom( "ship_tunnel_room" );
		setAmbientRoomReverb( "ship_tunnel_room", "full_ship_tunnel_room", 1, 1 );
                setAmbientRoomTone( "ship_tunnel_room", "amb_bg_ghost_ship_int", 0.7, 2.0);
	
	declareAmbientRoom( "arctic_ext_room" );
		setAmbientRoomReverb( "arctic_ext_room", "full_outdoor", 1, 1 );
              	setAmbientRoomTone( "arctic_ext_room", "amb_bg_blizzard", 0.3, 2.5);
}

snapshot_manager_1()
{
		 realwait( 2 );
		 playsound ( 0,"evt_blizzard_gust", (0,0,0));		 
		 realwait( 6 );
     snd_set_snapshot( "fullahead_flashbacks" );
     level waittill( "snapshot_default_1" );
     snd_set_snapshot( "default" );
}

snapshot_manager_2()
{
		 realwait( 4 );
     level waittill( "snapshot_flashback_2" );
     snd_set_snapshot( "fullahead_flashbacks" );
}

snapshot_manager_3()
{
     level waittill( "snapshot_default_2" );
     snd_set_snapshot( "default" );
}

snapshot_manager_4()
{
     level waittill( "snapshot_flashback_3" );
     snd_set_snapshot( "fullahead_flashbacks" );
}

snapshot_manager_5()
{
     level waittill( "snapshot_default_3" );
     snd_set_snapshot( "default" );
}

vorkuta_fire_looper()
{

	num_ent = spawn (0, ((-1165, -1163, -14)), "script_origin");		
	num_ent playloopsound ("amb_reznov_fire", 1);
					
}