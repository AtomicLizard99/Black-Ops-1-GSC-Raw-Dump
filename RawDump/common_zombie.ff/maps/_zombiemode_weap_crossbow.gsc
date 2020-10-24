//*******************************************************************************
// Houses functions for the crossbow found in Zombies
// Currently holds only the monkey bolt functions but can be expanded to other 
// crossbow related functions.
// Monkey Bolt: When packing the crossbow the bolts then act similar to the Cymbal
// monkey. The function watch_for_monkey_bolt() is called from _zombiemode

//*******************************************************************************
#include maps\_utility; 
#include common_scripts\utility;
#include maps\_zombiemode_utility;

init()
{
	if( !maps\_zombiemode_weapons::is_weapon_included( "crossbow_explosive_zm" ) )
	{
		return;
	}
	
	level thread crossbow_on_player_connect();
}

crossbow_on_player_connect()
{
	for( ;; )
	{
		level waittill( "connecting", player ); 
		player thread watch_for_monkey_bolt();
	}
}

// ww: watch for the monkey bolt to fire
watch_for_monkey_bolt()
{
	self endon( "death" );
	self endon( "disconnect" );
	
	if ( GetDvar( #"zombiemode" ) != "1" )
	{
		return;
	}
	
	for (;;)
	{
		self waittill ( "grenade_fire", grenade, weaponName, parent );
		
		switch( weaponName )
		{
			case "explosive_bolt_upgraded_zm":
				grenade thread crossbow_monkey_bolt( self );
				break;
		}
	}
	
}

// WWilliams (8/14/10): Functionality for the upgraded crossbow shot in zombies. SELF == BOLT/GRENADE
// Nicknamed the "monkey_bolt" the bold acts like a monkey bomb by capturing zombie attention
crossbow_monkey_bolt( player_who_fired )
{
	level thread monkey_bolt_cleanup( self );
	
	attract_dist_diff = level.monkey_attract_dist_diff; // Min distance to attract positions
	if( !isDefined( attract_dist_diff ) )
	{
		attract_dist_diff = 45;
	}
		
	num_attractors = level.num_monkey_attractors; // Min number of attractors
	if( !isDefined( num_attractors ) )
	{
		num_attractors = 96;
	}
	
	max_attract_dist = level.monkey_attract_dist; // Max attract distance 
	if( !isDefined( max_attract_dist ) )
	{
		max_attract_dist = 1536; //
	}
	
	// check to see if it is on a entity or not
	if( IsDefined( level.monkey_bolt_holder ) )
	{
		if( IsPlayer( level.monkey_bolt_holder ) )
		{
			// create_zombie_point_of_interest( attract_dist, num_attractors, added_poi_value, start_turned_on );
			self create_zombie_point_of_interest( max_attract_dist, num_attractors, 10000, true );
			valid_poi = maps\_zombiemode_utility::check_point_in_active_zone( self.origin );
			
				// ww: tracking for bolt on back achievement
				level._bolt_on_back = 0;
				level thread monkey_bolt_on_back( self, player_who_fired, level.monkey_bolt_holder );
			
			if( !valid_poi ) 
			{	
				valid_poi = check_point_in_playable_area( self.origin );
			}
			
			if(valid_poi)
			{
				// self thread create_zombie_point_of_interest_attractor_positions( 4, attract_dist_diff );
			}
			else
			{
				player_who_fired.script_noteworthy = undefined;
			}
		}
		else if( IsAI( level.monkey_bolt_holder ) )
		{
			if( IsAlive( level.monkey_bolt_holder ) )
			{
				level.monkey_bolt_holder thread monkey_bolt_taunts( self ); // AI should play an animation until the bolt blows
			}
			
			self create_zombie_point_of_interest( max_attract_dist, num_attractors, 10000, true );
			valid_poi = maps\_zombiemode_utility::check_point_in_active_zone( self.origin );
		
			if( !valid_poi ) 
			{	
				valid_poi = check_point_in_playable_area( self.origin );
			}
			
			if(valid_poi)
			{
				self thread create_zombie_point_of_interest_attractor_positions( 4, attract_dist_diff );
			}
			else
			{
				player_who_fired.script_noteworthy = undefined;
			}
		}

	}
	else
	{
		self create_zombie_point_of_interest( max_attract_dist, num_attractors, 10000, true );
		valid_poi = maps\_zombiemode_utility::check_point_in_active_zone( self.origin );
		
		if( !valid_poi ) 
		{	
			valid_poi = check_point_in_playable_area( self.origin );
		}
		
		if(valid_poi)
		{
			self thread create_zombie_point_of_interest_attractor_positions( 4, attract_dist_diff );
		}
		else
		{
			player_who_fired.script_noteworthy = undefined;
		}
	}
}

// WW (8/14/10) - Enemy hit by the monkey bold should start playing taunt anims
monkey_bolt_taunts( ent_grenade )
{
	self endon( "death" );
	// should also end if the bolt explodes but doesn't kill
	
	if ( self.isdog || !self.has_legs )
	{
		return;
	}
	else if( IsDefined( self.animname ) && self.animname == "thief_zombie" ) // ww: the thief will not taunt the player if hit
	{
		return;
	}

	while( IsDefined( ent_grenade ) )
	{
		if( IsDefined( level._zombie_board_taunt[self.animname] ) )
		{
			taunt_anim = random( level._zombie_board_taunt[self.animname] );
			if( self.animname == "zombie" )
			{
				self thread maps\_zombiemode_audio::do_zombies_playvocals( "taunt", self.animname );
			}
			
			if( !IsAlive( self ) )
			{
				return;
			}
			self.allowdeath = 1;
			
			self animscripted( "zombie_taunt", self.origin, self.angles, taunt_anim, "normal", undefined, 1, 0.4 );
			
			if( !IsAlive( self ) )
			{
				return;
			}
			
			wait( getanimlength( taunt_anim ) );
			
		}
		
		wait( 0.05 );
	}	
	
	level.monkey_bolt_holder = undefined;
}

// undefine the level.monkey_bolt_holder
monkey_bolt_cleanup( ent_grenade )
{
	while( IsDefined( ent_grenade ) )
	{
		wait( 0.1 );
	}
	
	if( IsDefined( level.monkey_bolt_holder ) )
	{
		level.monkey_bolt_holder = undefined;
	}
}

// ww: checks for bolt to explode then checks a level var
monkey_bolt_on_back( monkey_bolt, player_who_fired, player_with_back_bolt )
{
	if( !IsDefined( level._bolt_on_back ) )
	{
		level._bolt_on_back = 0;
	}
	
	monkey_bolt waittill( "explode" );
	
	wait( 0.2 );
	
	if( level._bolt_on_back >= 6 )
	{
		if( is_player_valid( player_with_back_bolt ) && !player_who_fired IsNoTarget() )
		{
			if( IsDefined( player_who_fired ) )
			{
				player_who_fired giveachievement_wrapper( "SP_ZOM_SILVERBACK" );	
			}
			
			player_with_back_bolt giveachievement_wrapper( "SP_ZOM_SILVERBACK" );
		}
	}
}