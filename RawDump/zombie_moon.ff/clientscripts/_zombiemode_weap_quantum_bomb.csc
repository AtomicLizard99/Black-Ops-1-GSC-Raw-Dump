// Quantum Bomb client side scripts
#include clientscripts\_utility;
#include clientscripts\_music;
#include clientscripts\_zombiemode_weapons;
#include clientscripts\_zombiemode;

init()
{
	level.zombie_quantum_bomb_spawned_func = ::quantum_bomb_spawned;
	
	if ( GetDvar( #"createfx" ) == "on" )
	{
		return;
	}
	
	if ( !clientscripts\_zombiemode_weapons::is_weapon_included( "zombie_quantum_bomb" ) )
	{
		return;
	}
	
	OnPlayerConnect_Callback( ::quantum_bomb_on_player_connect );
	
	// on player spawn run this function
	OnPlayerSpawned_Callback( ::quantum_bomb_on_player_spawned );

	level._effect["quantum_bomb_viewmodel_twist"]	= LoadFX( "weapon/quantum_bomb/fx_twist" );
	level._effect["quantum_bomb_viewmodel_press"]	= LoadFX( "weapon/quantum_bomb/fx_press" );

	level thread quantum_bomb_notetrack_think();
}


// called on a player when they connect to the level
quantum_bomb_on_player_connect( int_local_client_num )
{
	self endon( "disconnect" );
	
	// Wait until we've got the whole picture
	while ( !ClientHasSnapshot( int_local_client_num ) )
	{
		wait 0.05;
	}
	
	if( int_local_client_num != 0 )
	{
		return;
	}

}


// called on a player when they spawn to the level
quantum_bomb_on_player_spawned( int_local_client_num )
{
	self endon( "disconnect" );
	
	// Wait until we've got the whole picture
	while ( !self hasdobj( int_local_client_num ) )
	{
		wait( 0.05 );
	}
	
	if( int_local_client_num != 0 )
	{
		return;
	}

}


quantum_bomb_notetrack_think()
{
	for ( ;; )
	{
		level waittill( "notetrack", localclientnum, note );
		
		//println( "@@@ Got notetrack: " + note + " for client: " + localclientnum );

		switch( note )
		{
		case "quantum_bomb_twist":
			PlayViewmodelFx( localclientnum, level._effect["quantum_bomb_viewmodel_twist"], "tag_weapon" );
		break;

		case "quantum_bomb_press":
			PlayViewmodelFx( localclientnum, level._effect["quantum_bomb_viewmodel_press"], "tag_weapon" );
		break;

		}
	}
}


quantum_bomb_spawned( localClientNum, play_sound ) // self == the grenade
{
	temp_ent = spawn( 0, self.origin, "script_origin" );
	temp_ent playsound( 0, "wpn_quantum_rise" );
	
	while( isdefined( self ) )
	{
		temp_ent.origin = self.origin;
		wait(.05);
	}
	
	temp_ent delete();
}
