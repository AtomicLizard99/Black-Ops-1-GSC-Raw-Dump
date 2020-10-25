#include maps\mp\_utility;
#include common_scripts\utility;


//========================================================
//						main
//========================================================
main()
{
	//needs to be first for create fx
	maps\mp\mp_area51_fx::main();
	maps\mp\_load::main();
//	maps\mp\_compass::setupMiniMap("compass_map_mp_area51");
	if ( GetDvarInt( #"xblive_wagermatch" ) == 1 )
	{
		maps\mp\_compass::setupMiniMap("compass_map_mp_area51_wager");
	}
	else
	{
		maps\mp\_compass::setupMiniMap("compass_map_mp_area51");
	}	

	maps\mp\mp_area51_amb::main();

	// If the team nationalites change in this file,
	// you must update the team nationality in the level's csc file as well!
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

	level thread apple_damage_think();
}

apple_damage_think()
{
	apple_struct = GetStruct( "apple_origin", "targetname" );
	radius = 2;
	height = 5;

	if ( !IsDefined( apple_struct ) )
	{
		return;
	}

	damage_trigger = Spawn( "trigger_damage", apple_struct.origin - ( 0, 0, 1 ), 0, radius, height );

	for ( ;; )
	{
		damage_trigger waittill( "damage", amount, attacker, direction, point, type );

		if ( !IsDefined( type ) )
		{
			continue;
		}

		if ( type != "MOD_PISTOL_BULLET" && type != "MOD_RIFLE_BULLET" )
		{
			continue;
		}

		level ClientNotify( "afx" ); // "apple fx" 
		wait( 0.5 );
	}
}