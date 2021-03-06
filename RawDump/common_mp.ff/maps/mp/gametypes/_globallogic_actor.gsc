#include maps\mp\_utility;

Callback_ActorDamage( eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime )
{
	// create a class specialty checks; CAC:bulletdamage, CAC:armorvest
	iDamage = maps\mp\gametypes\_class::cac_modified_damage( self, eAttacker, iDamage, sMeansOfDeath, sWeapon, eInflictor );
	self.iDFlags = iDFlags;
	self.iDFlagsTime = getTime();
	
	if ( game["state"] == "postgame" )
		return;
	
	if ( self.aiteam == "spectator" )
		return;
	
	if ( isDefined( eAttacker ) && isPlayer( eAttacker ) && isDefined( eAttacker.canDoCombat ) && !eAttacker.canDoCombat )
		return;
	
//	prof_begin( "Callback_ActorDamage flags/tweaks" );

	eAttacker = maps\mp\gametypes\_globallogic_player::figureOutAttacker( eAttacker );
	
	// Don't do knockback if the damage direction was not specified
	if( !isDefined( vDir ) )
		iDFlags |= level.iDFLAGS_NO_KNOCKBACK;
	
	friendly = false;

	if ( ((self.health == self.maxhealth)) || !isDefined( self.attackers ) )
	{
		self.attackers = [];
		self.attackerData = [];
		self.attackerDamage = [];
	}

	if ( maps\mp\gametypes\_globallogic_utils::isHeadShot( sWeapon, sHitLoc, sMeansOfDeath ) )
		sMeansOfDeath = "MOD_HEAD_SHOT";
	
	if ( maps\mp\gametypes\_tweakables::getTweakableValue( "game", "onlyheadshots" ) )
	{
		if ( sMeansOfDeath == "MOD_PISTOL_BULLET" || sMeansOfDeath == "MOD_RIFLE_BULLET" )
			return;
		else if ( sMeansOfDeath == "MOD_HEAD_SHOT" )
			iDamage = 150;
	}
	
	//// When actor gets hit with incendiary do some fire effects
	//// AE 10-20-09: added grenade splash to the check
	//if( ( sMeansOfDeath == "MOD_GRENADE" || sMeansOfDeath == "MOD_GRENADE_SPLASH" ) && sWeapon == "incendiary_grenade_mp")
	//{
	//	self thread maps\mp\_burnplayer::hitWithIncendiary( eAttacker, eInflictor, "MOD_BURNED" );		
	//}
	
	if( sMeansOfDeath == "MOD_BURNED")
	{
		if (sWeapon == "none")
		{
			self maps\mp\_burnplayer::walkedThroughFlames();		
		}
		if (sWeapon == "m2_flamethrower_mp")
		{
			self maps\mp\_burnplayer::burnedWithFlameThrower();		
		}
	}	

	// explosive barrel/car detection
	if ( sWeapon == "none" && isDefined( eInflictor ) )
	{
		if ( isDefined( eInflictor.targetname ) && eInflictor.targetname == "explodable_barrel" )
			sWeapon = "explodable_barrel_mp";
		else if ( isDefined( eInflictor.destructible_type ) && isSubStr( eInflictor.destructible_type, "vehicle_" ) )
			sWeapon = "destructible_car_mp";
	}

//	prof_end( "Callback_ActorDamage flags/tweaks" );

/#
		if ( maps\mp\_dogs::dog_get_dvar_int( "debug_dog_attack","0" ) == 2  )
		{
				iDamage = 1;
		}	
#/
	// check for completely getting out of the damage
	if( !(iDFlags & level.iDFLAGS_NO_PROTECTION) )
	{
		if ( isPlayer( eAttacker ) )
			eAttacker.pers["participation"]++;
		
		prevHealthRatio = self.health / self.maxhealth;
		
		if ( level.teamBased && isPlayer( eAttacker ) && (self != eAttacker) && (self.aiteam == eAttacker.pers["team"]) )
		{
//			prof_begin( "Callback_ActorDamage actor" ); // profs automatically end when the function returns
			if ( level.friendlyfire == 0 ) // no one takes damage
			{
				return;
			}
			else if ( level.friendlyfire == 1 ) // the friendly takes damage
			{
				// Make sure at least one point of damage is done
				if ( iDamage < 1 )
					iDamage = 1;
				
				self.lastDamageWasFromEnemy = false;
				
				self finishActorDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
			}
			else if ( level.friendlyfire == 2 ) // no one takes damage
			{
				return;
			}
			else if ( level.friendlyfire == 3 ) // both friendly and attacker take damage
			{
				iDamage = int(iDamage * .5);

				// Make sure at least one point of damage is done
				if ( iDamage < 1 )
					iDamage = 1;
				
				self.lastDamageWasFromEnemy = false;
				
				self finishActorDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
			}
			
			friendly = true;
		}
		else
		{
			// no damage from the dogs owner unless in hardcore
			if ( isDefined( eAttacker ) && isDefined( self.script_owner ) && eAttacker == self.script_owner && !level.hardcoreMode )
			{
				return;
			}
			
			// dogs with the same owner can not damage each other
			if ( isDefined( eAttacker ) && isDefined( self.script_owner ) && isdefined( eAttacker.script_owner ) && eAttacker.script_owner == self.script_owner )
			{
				return;
			}
			
//			prof_begin( "Callback_ActorDamage world" );
			// Make sure at least one point of damage is done
			if(iDamage < 1)
				iDamage = 1;
		
			if ( isdefined( eAttacker ) && isPlayer( eAttacker ) && isDefined( sWeapon ) && !issubstr( sMeansOfDeath, "MOD_MELEE" ) )
				eAttacker thread maps\mp\gametypes\_weapons::checkHit( sWeapon );

			if ( issubstr( sMeansOfDeath, "MOD_GRENADE" ) && isDefined( eInflictor.isCooked ) )
				self.wasCooked = getTime();
			else
				self.wasCooked = undefined;
			
			self.lastDamageWasFromEnemy = (isDefined( eAttacker ) && (eAttacker != self));
			
			self finishActorDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);

//			prof_end( "Callback_ActorDamage world" );
		}

		if ( isdefined(eAttacker) && eAttacker != self )
		{
			hasBodyArmor = false;

			if (sWeapon != "artillery_mp" && (!isdefined(eInflictor) || !isai(eInflictor)) )
			{
				if ( iDamage > 0 )
					eAttacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback( hasBodyArmor, sMeansOfDeath );
			}
		}
	}

//	prof_begin( "Callback_ActorDamage log" );

	// Do debug print if it's enabled
	if(GetDvarInt( #"g_debugDamage"))
		println("actor:" + self getEntityNumber() + " health:" + self.health + " attacker:" + eAttacker.clientid + " inflictor is player:" + isPlayer(eInflictor) + " damage:" + iDamage + " hitLoc:" + sHitLoc);

	if(1) // self.sessionstate != "dead")
	{
		lpselfnum = self getEntityNumber();
		lpselfteam = self.aiteam;
		lpattackerteam = "";

		if(isPlayer(eAttacker))
		{
			lpattacknum = eAttacker getEntityNumber();
			lpattackGuid = eAttacker getGuid();
			lpattackname = eAttacker.name;
			lpattackerteam = eAttacker.pers["team"];
		}
		else
		{
			lpattacknum = -1;
			lpattackGuid = "";
			lpattackname = "";
			lpattackerteam = "world";
		}

		logPrint("AD;" + lpselfnum + ";" + lpselfteam + ";" + lpattackGuid + ";" + lpattacknum + ";" + lpattackerteam + ";" + lpattackname + ";" + sWeapon + ";" + iDamage + ";" + sMeansOfDeath + ";" + sHitLoc + "\n");
	}
	
//	prof_end( "Callback_ActorDamage log" );
}


Callback_ActorKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime)
{
	if ( game["state"] == "postgame" )
		return;	
	
	if( isai(attacker) && isDefined( attacker.script_owner ) )
	{
		// if the person who called the dogs in switched teams make sure they don't
		// get penalized for the kill
		if ( attacker.script_owner.team != self.aiteam )
			attacker = attacker.script_owner;
	}
		
	if( attacker.classname == "script_vehicle" && isDefined( attacker.owner ) )
		attacker = attacker.owner;

	if ( isdefined( attacker ) && isplayer( attacker ) )
	{
		if ( !level.teamBased || (self.aiteam != attacker.pers["team"]) )
		{
			value = maps\mp\gametypes\_rank::getScoreInfoValue( "dogkill" );
			attacker thread maps\mp\gametypes\_rank::giveRankXP( "dogkill", value );
			level.globalKillstreaksDestroyed++;
			attacker maps\mp\gametypes\_globallogic_score::incItemStatByReference( "killstreak_dogs" , 1, "destroyed" );

			// Dogs no longer give team or player score
			//maps\mp\gametypes\_globallogic_score::givePlayerScore( "dogkill", attacker, self );
	
			// dog score for team
			//if( level.teamBased  )
			//	maps\mp\gametypes\_globallogic_score::giveTeamScore( "dogkill", attacker.pers["team"],  attacker, self );
		}		
	}

}

