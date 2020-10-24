#include clientscripts\_utility; 
#include clientscripts\_fx;

init()
{
	if ( GetDvar( #"createfx" ) == "on" )
	{
		return;
	}
	
	if ( !clientscripts\_zombiemode_equipment::is_equipment_included( "equip_hacker_zm" ) )
	{
		return;
	}

	level thread player_init();
}


player_init()
{
	waitforclient( 0 );

	players = GetLocalPlayers();
	for( i = 0; i < players.size; i++ )
	{
		player = players[i];
	}
}

