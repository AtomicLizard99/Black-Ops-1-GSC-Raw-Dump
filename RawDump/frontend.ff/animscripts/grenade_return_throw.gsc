#include animscripts\anims;

#using_animtree ("generic_human");

// Grenade_return_throw
// Picks up a grenade from 32 units in front of the character, and throws it.

main()
{
	/#
	if ( GetDvar( #"scr_forcegrenadecower" ) == "on" && IsDefined( self.grenade ) )
	{
		self OrientMode( "face angle", RandomFloat(360) );
		self AnimMode( "gravity" );
		wait .2;
		animscripts\grenade_cower::main();
		return;
	}
	#/

	if( self.a.pose == "prone" )
	{
		animscripts\stop::main();
		return;
	}
	
	self OrientMode("face default");
 	self trackScriptState( "Cover Return Throw Main", "code" );
	self endon("killanimscript");
	
	animscripts\utility::initialize( "grenade_return_throw" );
	
	self AnimMode( "zonly_physics" ); // Unlatch the feet

	throwAnim = undefined;
	
	throwDist = 700;
	if ( IsDefined( self.enemy ) )
		throwDist = distance( self.origin, self.enemy.origin );
	
	// unused: grenade_return_running_kick_forward_1
	// unused: grenade_return_running_kick_forward_2
	
	animArray = [];
	if ( throwDist < 300 )
	{
		// really short range
		animArray[0] = animArray("throw_short");
		animArray[1] = animArray("throw_medium");
	}
	else if ( throwDist < 1024 )
	{
		// long range
		animArray[0] = animArray("throw_medium");
		animArray[1] = animArray("throw_far");
		animArray[2] = animArray("throw_very_far");
	}
	else
	{
		// really long range
		animArray[0] = animArray("throw_very_far");
	}
	assert( animArray.size );
	throwAnim = animArray[RandomInt( animArray.size )];
	
	/#
	if ( GetDvar( #"scr_grenadereturnanim") != "" )
	{
		val = GetDvar( #"scr_grenadereturnanim");
		if ( val == "kick1")
		{
			throwAnim = %grenade_return_running_kick_forward_1;
		}
		else if ( val == "kick2")
		{
			throwAnim = %grenade_return_running_kick_forward_2;
		}
		else if ( val == "throw1")
		{
			throwAnim = %grenade_return_running_throw_forward;
		}
		else if ( val == "throw2")
		{
			throwAnim = %grenade_return_standing_throw_forward_1;
		}
		else if ( val == "throw3")
		{
			throwAnim = %grenade_return_standing_throw_forward_2;
		}
		else if ( val == "throw4")
		{
			throwAnim = %grenade_return_standing_throw_overhand_forward;
		}
	}
	#/

	assert( IsDefined( throwAnim ) );
	self SetFlaggedAnimKnobAllRestart( "throwanim", throwAnim, %body, 1, .3 );

	hasPickup = (animHasNotetrack( throwAnim, "grenade_left" ) || animHasNotetrack( throwAnim, "grenade_right" ));
	if ( hasPickup )
	{
		self animscripts\shared::placeWeaponOn( self.weapon, "left" );
		self thread putWeaponBackInRightHand();

		self thread notifyGrenadePickup( "throwanim", "grenade_left" );
		self thread notifyGrenadePickup( "throwanim", "grenade_right" );
		self waittill( "grenade_pickup" );
		self pickUpGrenade();

		self animscripts\battleChatter_ai::evaluateAttackEvent( "grenade" );
		self maps\_dds::dds_notify_grenade( self.grenadeweapon, ( self.team == "allies" ), true );
	
		self waittillmatch( "throwanim", "grenade_throw" );
		self throwGrenade();
	}
	else
	{
		// kick animations don't have pickup.
		self waittillmatch( "throwanim", "grenade_throw" );
		self pickUpGrenade();

		self animscripts\battleChatter_ai::evaluateAttackEvent("grenade");
		self maps\_dds::dds_notify_grenade( self.grenadeweapon, ( self.team == "allies" ), true );

		self throwGrenade();
	}

	// TODO: replace with a notetrack?
	wait 1;

	if ( hasPickup )
	{
		self notify("put_weapon_back_in_right_hand");
		self animscripts\shared::placeWeaponOn( self.weapon, "right" );
	}
}

putWeaponBackInRightHand()
{
	self endon("death");
	self endon("put_weapon_back_in_right_hand");
	
	self waittill("killanimscript");
	
	self animscripts\shared::placeWeaponOn( self.weapon, "right" );
}

notifyGrenadePickup( animFlag, notetrack )
{
	self endon("killanimscript");
	self endon("grenade_pickup");
	
	self waittillmatch( animFlag, notetrack );
	self notify("grenade_pickup");
}
