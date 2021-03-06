#include clientscripts\mp\_utility;
#include clientscripts\mp\_rewindobjects;

init()
{	
	level._effect["scrambler_enemy_light"] = loadfx( "misc/fx_equip_light_red" );
	level._effect["scrambler_friendly_light"] = loadfx( "misc/fx_equip_light_green" );

	level.scramblerHandle = 1;
	level.scramblerVOOuterRadius = 1200 * 1200;
	level.scramblerInnerRadius =  500 *  500;
	level.scramblesound = "mpl_scrambler_static";	
	level.scramblesoundalert = "mpl_scrambler_alert";	
	level.scramblesoundping = "mpl_scrambler_ping";		
	level.scramblesoundburst = "mpl_scrambler_burst";
	level._client_flag_callbacks["missile"][level.const_flag_scrambler] = ::spawnedScrambler;

	level._client_flag_callbacks["scriptmover"][level.const_flag_counteruav] = ::spawnedGlobalScramber;

	level.scramblers = [];
	level.playerPersistent = [];
	
	WaitForClient( 0 );	
	
	level thread scramblerUpdate();
	level thread checkForPlayerSwitch();
}

spawnedScrambler(localClientNum, set)
{
	if ( !set )
		return;
	
	if ( localClientNum != 0 )
		return;
	
	self spawned(localClientNum, set, true);	
}

spawnedGlobalScramber(localClientNum, set)
{
	if ( !set )
		return;
	
	if ( localClientNum != 0 )
		return;
	
	self spawned(localClientNum, set, false);
}

spawned(localClientNum, set, isLocalized)
{	
	if ( !set )
		return;
	
	if ( localClientNum != 0 )
		return;

	scramblerHandle = level.scramblerHandle;
	level.scramblerHandle++;
		
	size = level.scramblers.size;
	level.scramblers[size] = spawnstruct();
	level.scramblers[size].scramblerHandle = scramblerHandle;
	level.scramblers[size].cent =  self;
	level.scramblers[size].team =  self.team;
	level.scramblers[size].isLocalized =  isLocalized;
	level.scramblers[size].sndEnt = Spawn( 0, self.origin, "script_origin" );
	level.scramblers[size].sndId = -1;
	level.scramblers[size].sndPingEnt = Spawn( 0, self.origin, "script_origin" );
	level.scramblers[size].sndPingId = -1;	  	
		
	players = getlocalplayers();
	owner = self GetOwner( localClientNum );

	local_players_entity_thread( self, ::spawnedPerClient, isLocalized, scramblerHandle );
	
	level thread cleanUpScramblerOnDelete( self, scramblerHandle, isLocalIzed, localClientNum );
}

spawnedPerClient(localClientNum, isLocalized, scramblerHandle)
{
	player = GetLocalPlayer( localClientNum );
	isEnemy = self isEnemyScrambler( localClientNum );
	owner = self GetOwner( localClientNum );
	scramblerIndex = undefined;
	
	for ( i = 0; i < level.scramblers.size; i++ ) 
	{		
		if ( level.scramblers[i].scramblerHandle == scramblerHandle )
		{
			scramblerIndex = i;
			break;
		}
	}
	
	if ( !IsDefined( scramblerIndex ) )
		return;
		
	if ( !isEnemy )
	{
		if ( isLocalized )
		{
			if ( owner == player && !IsSpectating( localClientNum, false ) )
			{
				player AddFriendlyScrambler( self.origin[0], self.origin[1], scramblerHandle );
			}
		
			//play ally sccramble sounds
			if ( IsDefined( level.scramblers[scramblerIndex].sndEnt ) )
			{
				level.scramblers[scramblerIndex].sndId = level.scramblers[scramblerIndex].sndEnt  playloopsound(level.scramblesoundalert);
				playsound (0, level.scramblesoundburst, level.scramblers[scramblerIndex].sndEnt.origin);
			}
			if ( IsDefined( level.scramblers[scramblerIndex].sndPingEnt ) )
				level.scramblers[scramblerIndex].sndPingId = level.scramblers[scramblerIndex].sndPingEnt  playloopsound(level.scramblesoundping); 						 			
			//iprintlnbold ("friendly Scrambler sound " + self.origin + level.scramblers[scramblerIndex].sndEnt.origin );		
		}
	}
	else
	{	
		//play enemy sccramble sounds
		if ( IsDefined( level.scramblers[scramblerIndex].sndEnt ) )
			level.scramblers[scramblerIndex].sndId = level.scramblers[scramblerIndex].sndEnt  playloopsound(level.scramblesound); 	
	  //iprintlnbold ("enemy Scrambler sound " + self.origin + level.scramblers[scramblerIndex].sndEnt.origin );
	}			
	
	self thread clientscripts\mp\_fx::blinky_light( localClientNum, "tag_light", level._effect["scrambler_friendly_light"], level._effect["scrambler_enemy_light"] );
}

scramblerUpdate()
{
	nearestEnemy = level.scramblerVOOuterRadius;
	nearestFriendly = level.scramblerVOOuterRadius;
			
	for ( ;; )
	{
		players = getlocalplayers();
		for (localClientNum = 0; localClientNum < players.size; localClientNum++)
		{
			player = players[localClientNum];
			if (!isdefined ( level.playerPersistent[localClientNum] ) )
			{
				level.playerPersistent[localClientNum] = spawnStruct();
				level.playerPersistent[localClientNum].previousTeam = player.team;
				player removeallFriendlyScramblers();
			}
			
			if ( level.playerPersistent[localClientNum].previousTeam != player.team  )
			{
				teamChanged = true;
				level.playerPersistent[localClientNum].previousTeam = player.team;
			}
			else 
				teamChanged = false;
			
			enemyScramblerAmount = 0.0;
			friendlyScramblerAmount = 0.0;
			nearestEnemy = level.scramblerVOOuterRadius;
			nearestFriendly = level.scramblerVOOuterRadius;
			isGlobalScrambler = 0;
			distToScrambler = level.scramblerVOOuterRadius;
			nearestEnemyScramblerCent = undefined;
			
			for ( i = 0; i < level.scramblers.size; i++ ) 
			{			
				if (!isdefined( level.scramblers[i].cent ) )
					continue;
					
				if ( isDefined( level.scramblers[i].cent.stunned ) && level.scramblers[i].cent.stunned )
				{
					level.scramblers[i].cent.reenable = true;
					player RemoveFriendlyScrambler( level.scramblers[i].scramblerHandle );
					continue;
				}
				else if ( isDefined( level.scramblers[i].cent.reenable ) && level.scramblers[i].cent.reenable )
				{
					teamChanged = true;
					level.scramblers[i].cent.reenable = false;
				}
				
				if ( level.scramblers[i].isLocalized )
				{
					distToScrambler = distanceSquared( player.origin, level.scramblers[i].cent.origin );	
					
				}
				
				if ( !level.scramblers[i].isLocalized && level.scramblers[i].cent isEnemyScrambler( localClientNum ) )
				{
					isGlobalScrambler = 1;
				}
				
				isEnemy = level.scramblers[i].cent isEnemyScrambler( localClientNum );

				if ( level.scramblers[i].team != level.scramblers[i].cent.team )
				{
					scramblerTeamChanged = true;
					level.scramblers[i].team = level.scramblers[i].cent.team;
				}
				else
				{
					scramblerTeamChanged = false;
				}
				
				if ( teamChanged || scramblerTeamChanged )
					level.scramblers[i] restartSound( isEnemy );
				
				if ( isEnemy )
				{
					if ( nearestEnemy > distToScrambler )
					{
						nearestEnemyScramblerCent = level.scramblers[i].cent;
						nearestEnemy = distToScrambler;
					}
						
					if ( ( level.scramblers[i].isLocalized ) && ( teamChanged || scramblerTeamChanged ) )
						player RemoveFriendlyScrambler( level.scramblers[i].scramblerHandle );
				}
				else if ( level.scramblers[i].isLocalized )
				{
					if ( nearestFriendly > distToScrambler )
						nearestFriendly = distToScrambler;

					owner = level.scramblers[i].cent GetOwner( localClientNum );
						
					if ( owner == player && !IsSpectating( localClientNum, false ) )
					{
						if ( teamChanged || scramblerTeamChanged )
						{
							player AddFriendlyScrambler( level.scramblers[i].cent.origin[0], level.scramblers[i].cent.origin[1], level.scramblers[i].scramblerHandle );
						}
					}
				}
			}
			

			if ( nearestEnemy < level.scramblerVOOuterRadius )
				enemyVOScramblerAmount = 1 - ( ( nearestEnemy - level.scramblerInnerRadius ) / ( level.scramblerVOOuterRadius - level.scramblerInnerRadius ) );
			else 
				enemyVOScramblerAmount = 0;
			
			if ( nearestFriendly < level.scramblerInnerRadius ) 
				friendlyScramblerAmount = 1.0;
			else if ( nearestFriendly < level.scramblerVOOuterRadius )
				friendlyScramblerAmount = 1 - ( ( nearestFriendly - level.scramblerInnerRadius ) / ( level.scramblerVOOuterRadius - level.scramblerInnerRadius ) );
			player SetFriendlyScramblerAmount( friendlyScramblerAmount );
			
			if ( level.scramblers.size > 0 && isdefined(nearestEnemyScramblerCent) )
			{
				player SetNearestEnemyScrambler( nearestEnemyScramblerCent );
			}
			else
			{
				player ClearNearestEnemyScrambler();
			}
			
			//player SetEnemyScramblerAmount( enemyScramblerAmount );
			
			if ( isGlobalScrambler )
				player SetEnemyGlobalScrambler( 1 );
			else
				player SetEnemyGlobalScrambler( 0 );

			if (enemyVOScramblerAmount > 1)
				enemyVOScramblerAmount = 1;
			
			if ( getdvarfloat( "snd_futz" ) != enemyVOScramblerAmount )
				setdvarfloat ("snd_futz",	enemyVOScramblerAmount);	
		}
		
		wait( 0.25 );
		waitforallclients();
	}
}


cleanUpScramblerOnDelete( scramblerEnt, scramblerHandle, isLocalized, localClientNum )
{
	scramblerEnt waittill( "entityshutdown" );
	players = GetLocalPlayers( localClientNum );

	for ( j = 0; j < level.scramblers.size; j++ ) 
	{
		size = level.scramblers.size;
		if ( scramblerHandle == level.scramblers[j].scramblerHandle )
		{
			playsound (0, level.scramblesoundburst, level.scramblers[j].sndEnt.origin);
			level.scramblers[j].sndEnt delete();
			level.scramblers[j].sndEnt = self.scramblers[size - 1].sndEnt;
			level.scramblers[j].sndPingEnt delete();
			level.scramblers[j].sndPingEnt = self.scramblers[size - 1].sndPingEnt;						
			level.scramblers[j].cent = level.scramblers[size - 1].cent;
			level.scramblers[j].scramblerHandle = level.scramblers[size - 1].scramblerHandle;
			level.scramblers[j].team = level.scramblers[size - 1].team;
			level.scramblers[j].isLocalized = level.scramblers[size - 1].isLocalized;
			level.scramblers[size - 1] = undefined;
			break;
		}
	}	
	
	if ( isLocalized )
	{
		for ( i = 0; i < players.size; i++ )
		{
			players[i] RemoveFriendlyScrambler( scramblerHandle );
		}
	}
}



isEnemyScrambler( localClientNum )
{
	/#
	if ( getDvarIntDefault( #"scr_forceEnemyScrambler", 0 ) ) 
		return true;
	#/
	enemy = !friendNotFoe(localClientNum);
	return enemy;
}

checkForPlayerSwitch()
{
	while ( true )
	{
		level waittill( "demo_player_switch" );
		waittillframeend;
		
		players = getlocalplayers();
		for (localClientNum = 0; localClientNum < players.size; localClientNum++)
		{
			for ( j = 0; j < level.scramblers.size; j++ )
			{
				ent = level.scramblers[j].cent;
				
				ent thread clientscripts\mp\_fx::stop_blinky_light( localClientNum );
	
				ent thread clientscripts\mp\_fx::blinky_light( localClientNum, "tag_light", level._effect["scrambler_friendly_light"], level._effect["scrambler_enemy_light"] );

				isEnemy = ent isEnemyScrambler( localClientNum );
				
				level.scramblers[j] restartSound( isEnemy );
			}

		}
	}
}

restartSound( isEnemy )
{
	if ( self.sndId != -1 )
	{
		self.sndEnt stopLoopSound( 0.1 );
		self.sndId = -1;
	}
				
	if ( !isEnemy )
	{
		if ( self.isLocalized )
		{
			self.sndId = self.sndEnt playloopsound( level.scramblesoundalert );
		}
	}
	else
	{
		self.sndId = self.sndEnt playloopsound( level.scramblesound );
	}
}