#include clientscripts\mp\_utility;

main()
{
}

playerspawned( localClientNum )
{
	self thread watchForRespawn();
	self thread watchForExplosion();
}

watchForRespawn()
{
	self endon( "entityshutdown" );
	
	menuName = "fullscreen_dirt";
	if ( IsDefined( level.isWinter ) && level.isWinter )
		menuName = "fullscreen_snow";
	
	while ( true )
	{
		localPlayers = GetLocalPlayers();
		for ( i = 0 ; i < localPlayers.size ; i++ )
		{
			if ( !IsSplitscreen() && ( localPlayers[i] == self ) )
			{
				AnimateUI( i, menuName, "dirt", "Default", 0 );
				AnimateUI( i, menuName, "blurred_dirt", "Default", 0 );
				AnimateUI( i, menuName, "dirt_left", "Default", 0 );
				AnimateUI( i, menuName, "dirt_left_splash", "Default", 0 );
				AnimateUI( i, menuName, "dirt_right", "Default", 0 );
				AnimateUI( i, menuName, "dirt_right_splash", "Default", 0 );
			}
		}
		self waittill( "respawn" );
	}
}

watchForExplosion()
{
	self endon( "entityshutdown" );
	
	if ( IsSplitscreen() )
		return;
	
	menuName = "fullscreen_dirt";
	if ( IsDefined( level.isWinter ) && level.isWinter )
		menuName = "fullscreen_snow";
	
	while ( true )
	{
		self waittill( "explode", localClientNum, position, mod );
		localPlayer = GetLocalPlayer( localClientNum );
		if ( ( localPlayer == self ) && ( !localPlayer IsDriving( localClientNum ) ) )
		{
			if ( ( ( mod == "MOD_GRENADE_SPLASH" ) || ( mod == "MOD_PROJECTILE_SPLASH" ) ) && ( Distance( localPlayer.origin, position ) < 600 ) )
			{
				trace = bulletTrace( GetLocalClientEyePos( localClientNum ), position, false, self );
				if ( trace["fraction"] >= 1 )
				{
					forwardVec = VectorNormalize( AnglesToForward( localPlayer.angles ) );
					rightVec = VectorNormalize( AnglesToRight( localPlayer.angles ) );
					explosionVec = VectorNormalize( position - localPlayer.origin );
					
					fDot = VectorDot( explosionVec, forwardVec );
					rDot = VectorDot( explosionVec, rightVec );
					
					if ( fDot > 0.5 )
						AnimateUI( localClientNum, menuName, "dirt", "in", 0 );
						
					if ( abs( fDot ) < 0.866 )
					{
						if ( rDot > 0 )
							AnimateUI( localClientNum, menuName, "dirt_right", "in", 0 );
						else
							AnimateUI( localClientNum, menuName, "dirt_left", "in", 0 );
					}
				}
			}
		}
	}
}