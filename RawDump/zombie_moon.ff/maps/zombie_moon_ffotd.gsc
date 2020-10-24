#include maps\_utility;
#include common_scripts\utility;
#include maps\_zombiemode_utility;
#include animscripts\zombie_Utility;


main_start()
{
	SetSavedDvar( "sm_sunShadowSmallScriptPS3OnlyEnable", true );

	PreCacheModel("collision_wall_512x512x10");
	PreCacheModel("collision_geo_64x64x256");
}


main_end()
{
	// fix for pathing below player at drop offs.
	SetSavedDvar( "zombiemode_path_minz_bias", 40 );
	
	// kill brushes under stairs.
	maps\_zombiemode::spawn_kill_brush( (-866, 634, -219), 100, 60 );
	maps\_zombiemode::spawn_kill_brush( (-686, 634, -219), 100, 128 );
	
	maps\_zombiemode::spawn_kill_brush( (846, 634, -219), 100, 60 );
	maps\_zombiemode::spawn_kill_brush( (676, 634, -219), 100, 128 );

	//cliff hanging kill brush.
	maps\_zombiemode::spawn_kill_brush( (-866, -19, -380), 128, 64 );

	
	// teleporter area collision fix.
	collision = spawn("script_model", (377, 3464, 244));
	collision setmodel("collision_wall_512x512x10");
	collision.angles = (0, 298, 0);
	collision Hide();

	collision2 = spawn("script_model", (1231, 4536, 186));
	collision2 setmodel("collision_geo_64x64x256");
	collision2.angles = (0, 0, 0);
	collision2 Hide();	
	
	level thread force_player_move_init();
}

force_player_move_init()
{
	trig_radius = 32;
	trig_height = 128;
	
	moveit_trig1 = Spawn( "trigger_radius", (530, 7433, 135), 0, trig_radius, trig_height );
	moveit_trig1 thread force_player_move();

	moveit_trig2 = Spawn( "trigger_radius", (-8, 6735, 166), 0, trig_radius, trig_height );
	moveit_trig2 thread force_player_move();

	moveit_trig2 = Spawn( "trigger_radius", (1.2, 5548.6, 171), 0, trig_radius, trig_height );
	moveit_trig2 thread force_player_move();	
}
	
force_player_move()
{
	while(true)
	{
		self waittill("trigger",who);
		
		if(IsPlayer(who))
		{
			who setorigin( self.origin + (-40, -40, 0));
		}	
		wait(2);
	}	
}	

