// "Stop" makes the character not walk, run or fight.  He can be standing or crouching; 
//  he can be alert or idle. 

#include animscripts\combat_utility;
#include animscripts\zombie_utility;
#include animscripts\zombie_SetPoseMovement; 

#using_animtree ("generic_human");

main()
{
	self notify("stopScript");
	self endon("killanimscript");

	/#
	if (GetDebugDvar("anim_preview") != "")
	{
		return;
	}
	#/

	[[ self.exception[ "stop_immediate" ] ]]();
	// We do the exception_stop script a little late so that the AI has some animation they're playing
	// otherwise they'd go into basepose.
	thread delayedException();

	self trackScriptState( "Stop Main", "code" );
	animscripts\zombie_utility::initialize("zombie_stop");

	self randomizeIdleSet();
	
	self thread setLastStoppedTime();
	
	transitionedToIdle = GetTime() < 3000;
	
	for(;;)
	{
		desiredPose = getDesiredIdlePose();
		
		assertex( desiredPose == "crouch" || desiredPose == "stand", desiredPose );
		
		if ( self.a.pose != desiredPose )
		{
			self ClearAnim( %root, 0.3 );
			transitionedToIdle = false;
		}
		
		self SetPoseMovement( desiredPose, "stop" );
		
		if (isDefined(self.idle_override) )
		{
			self [[self.idle_override]]();
		}
		else
		{
			self playIdle( desiredPose, self.a.idleSet );
		}
	}
}

setLastStoppedTime()
{
	self endon("death");
	self waittill("killanimscript");
	self.lastStoppedTime = GetTime();
}

getDesiredIdlePose()
{
	myNode = animscripts\zombie_utility::GetClaimedNode();
	if ( IsDefined( myNode ) )
	{
		myNodeAngle = myNode.angles[1];
		myNodeType = myNode.type;
	}
	else
	{
		myNodeAngle = self.desiredAngle;
		myNodeType = "node was undefined";
	}
	
	self animscripts\face::SetIdleFace(anim.alertface);

	// Find out if we should be standing or crouched
	desiredPose = animscripts\zombie_utility::choosePose();

	if ( myNodeType == "Cover Stand" || myNodeType == "Conceal Stand" )
	{
		// At cover_stand nodes, we don't want to crouch since it'll most likely make our gun go through the wall.
		desiredPose = animscripts\zombie_utility::choosePose("stand");
	}
	else if ( myNodeType == "Cover Crouch" || myNodeType == "Conceal Crouch")
	{
		// We should crouch at concealment crouch nodes.
		desiredPose = animscripts\zombie_utility::choosePose("crouch");
	}
		
	return desiredPose;
}

transitionToIdle( pose, idleSet )
{
	if( self isCQBWalking() && self.a.pose == "stand" && self IsInCombat() )
	{
		pose = "stand_cqb";
	}
	else if( self is_banzai() && self.a.pose == "stand" && self IsInCombat() )
	{
		pose = "stand_banzai";
	}
	else if(self is_heavy_machine_gun() && self.a.pose == "stand" )
	{
		pose = "stand_hmg";
	}
	else if(self is_heavy_machine_gun() && self.a.pose == "crouch" )
	{
		pose = "crouch_hmg";
	}
	
	if ( IsDefined( anim.idleAnimTransition[pose] ) )
	{
		assert( IsDefined( anim.idleAnimTransition[pose]["in"] ) );

		idleAnim = anim.idleAnimTransition[pose]["in"];		
		self SetFlaggedAnimKnobAllRestart( "idle_transition", idleAnim, %body, 1, 0.2, self.animplaybackrate );
		self animscripts\zombie_shared::DoNoteTracks ("idle_transition");
	}
}
		
playIdle( pose, idleSet )
{
	if (!is_skeleton("base"))
	{
		pose = pose + "_" + get_skeleton();
	}

	if( isDefined( self.a.idleAnimOverrideArray ) && isDefined( self.a.idleAnimOverrideArray[pose] ) )
	{
		idleSet = idleSet % self.a.idleAnimOverrideArray[pose].size;
		idleArray = self.a.idleAnimOverrideArray[pose];
		weightArray = self.a.idleAnimOverrideWeights[pose];
	}
	else
	{
		idleSet = idleSet % anim.idleAnimArray[pose].size;
		idleArray = anim.idleAnimArray[pose];
		weightArray = anim.idleAnimWeights[pose];
	}

	idleAnim = anim_array( idleArray[idleSet], weightArray[idleSet] );

	transTime = 0.2;
	
	self SetFlaggedAnimKnobAllRestart( "idle", idleAnim, %body, 1, transTime, self.animplaybackrate );
	self animscripts\zombie_shared::DoNoteTracks ("idle");
}

delayedException()
{
	self endon("killanimscript");
	wait (0.05);
	[[ self.exception[ "stop" ] ]]();
}
