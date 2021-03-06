#include maps\mp\_utility;
#include common_scripts\utility;


//========================================================
//					main
//========================================================
main()
{
	//needs to be first for create fx
	maps\mp\mp_drivein_fx::main();

	maps\mp\_load::main();
//	maps\mp\_compass::setupMiniMap("compass_map_mp_drivein");
	if ( GetDvarInt( #"xblive_wagermatch" ) == 1 )
	{
		maps\mp\_compass::setupMiniMap("compass_map_mp_drivein_wager");
	}
	else
	{
		maps\mp\_compass::setupMiniMap("compass_map_mp_drivein");
	}	

	maps\mp\mp_drivein_amb::main();
	maps\mp\createart\mp_drivein_art::main();

	// If the team nationalites change in this file, you must also update the level's csc file,
	// the level's csv file, and the share/raw/mp/mapsTable.csv
	maps\mp\gametypes\_teamset_urbanspecops::level_init();

	// Set up the default range of the compass
	setdvar("compassmaxrange","2100");

	// Set up some generic War Flag Names.
	// Example from COD5: CALLSIGN_SEELOW_A is the name of the 1st flag in Selow whose string is "Cottage" 
	// The string must have MPUI_CALLSIGN_ and _A. Replace Mapname with the name of your map/bsp and in the 
	// actual string enter a keyword that names the location (Roundhouse, Missle Silo, Launchpad, Guard Tower, etc)

	game["strings"]["war_callsign_a"] = &"MPUI_CALLSIGN_MAPNAME_A";
	game["strings"]["war_callsign_b"] = &"MPUI_CALLSIGN_MAPNAME_B";
	game["strings"]["war_callsign_c"] = &"MPUI_CALLSIGN_MAPNAME_C";
	game["strings"]["war_callsign_d"] = &"MPUI_CALLSIGN_MAPNAME_D";
	game["strings"]["war_callsign_e"] = &"MPUI_CALLSIGN_MAPNAME_E";
	
	game["strings_menu"]["war_callsign_a"] = "@MPUI_CALLSIGN_MAPNAME_A";
	game["strings_menu"]["war_callsign_b"] = "@MPUI_CALLSIGN_MAPNAME_B";
	game["strings_menu"]["war_callsign_c"] = "@MPUI_CALLSIGN_MAPNAME_C";
	game["strings_menu"]["war_callsign_d"] = "@MPUI_CALLSIGN_MAPNAME_D";
	game["strings_menu"]["war_callsign_e"] = "@MPUI_CALLSIGN_MAPNAME_E";
	
	// enable new spawning system
	maps\mp\gametypes\_spawning::level_use_unified_spawning(true);

	level.const_fx_exploder_police_barricades = 1001;
	level thread policeBarricades();
}

policeBarricades()
{
	waittillframeend;
	if( level.wagermatch )
	{
		if ( isdefined( level.const_fx_exploder_police_barricades  ) )
		{
			exploder( level.const_fx_exploder_police_barricades );	
		}
	}
}

