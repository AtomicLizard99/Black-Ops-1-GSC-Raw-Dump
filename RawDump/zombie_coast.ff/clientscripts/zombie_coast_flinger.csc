#include clientscripts\_utility;

/*------------------------------------
flinger trap/transport clientscript
------------------------------------*/

/*------------------------------------
setup the player flinger anims
------------------------------------*/
#using_animtree("zombie_coast");
init_player_flinger_anims()
{
	
	//temp test with CUBA zipline anim to get it working
	level.flinger_anims = [];
	level.flinger_anims["player_fling_stand_crouch"] = %pb_rifle_stand_flinger_flail;
	level.flinger_anims["player_fling_prone"] = %pb_rifle_prone_flinger_flail;
	level.flinger_animtree = #animtree;    

}





#using_animtree("zombie_coast");
flinger_player_setup_prone(localClientNum, set,newEnt)
{
	player = getlocalplayers()[localClientNum];		

	if(player GetEntityNumber() == self GetEntityNumber())
	{
		// Dont be doing this for the player being flung, but track him in case he disconnects
		return;	
	}
		
	if(set)
	{

		if(localClientNum == 0)
		{
				self thread player_disconnect_tracker();
		}
		
		fake_player = Spawn( localClientNum, self.origin, "script_model" );
		fake_player.angles = self.angles;
		fake_player SetModel( self.model );
		fake_player linkto(self,"tag_origin");
		
		fake_player.fake_weapon = spawn(localClientNum, self.origin, "script_model");
		if( self.weapon != "none")
		{
			fake_player.fake_weapon SetModel( getweaponmodel(self.weapon) );
			fake_player.fake_weapon useweaponhidetags( self.weapon );
		}
		else
		{
			self thread flinger_weapon_monitor(fake_player.fake_weapon);
		}
		fake_player.fake_weapon LinkTo( fake_player, "tag_weapon_right");
		
		realWait(0.016);
		
		fake_player UseAnimTree( level.flinger_animtree);
		fake_player SetAnim( level.flinger_anims["player_fling_prone"], 1.0, 0.0, 1.0 );
		
		if(!isDefined(self.fake_player))
		{
			self.fake_player = [];
		}
		self.fake_player[localClientNum] = fake_player;	

		//if the ziplining player disconnects, we need to make sure we clean up the fake player model
		self thread wait_for_flung_player_to_disconnect(localClientNum);
	}
	else
	{
		if(!isDefined(self.fake_player) && !isDefined(self.fake_player[localClientNum]))
		{
			return;
		}
		str_notify = "player_flung" + localClientNum;
		self notify(str_notify);	

		self notify("end_flinger");

		if(IsDefined(self.fake_player[localClientNum].fake_weapon))
		{
			self.fake_player[localClientNum].fake_weapon Delete();
			self.fake_player[localClientNum].fake_weapon = undefined;
		}

		self.fake_player[localClientNum] delete();
		self.fake_player[localClientNum] = undefined;

	}
}


#using_animtree("zombie_coast");
flinger_player_setup_stand(localClientNum, set,newEnt)
{
	player = getlocalplayers()[localClientNum];		

	if(player GetEntityNumber() == self GetEntityNumber())
	{
		// Dont be doing this for the player being flung, but track him in case he disconnects
		return;	
	}
		
	if(set)
	{

		if(localClientNum == 0)
		{
				self thread player_disconnect_tracker();
		}
		
			
		fake_player = Spawn( localClientNum, self.origin, "script_model" );
		fake_player.angles = self.angles;
		fake_player SetModel( self.model );
		fake_player linkto(self,"tag_origin");
		
		fake_player.fake_weapon = spawn(localClientNum, self.origin, "script_model");
		if( self.weapon != "none")
		{
			fake_player.fake_weapon SetModel( getweaponmodel(self.weapon) );
			fake_player.fake_weapon useweaponhidetags( self.weapon );
		}
		else
		{
			self thread flinger_weapon_monitor(fake_player.fake_weapon);
		}
		fake_player.fake_weapon LinkTo( fake_player, "tag_weapon_right");
		
		realWait(0.016);
		
		fake_player UseAnimTree( level.flinger_animtree);
		fake_player SetAnim( level.flinger_anims["player_fling_stand_crouch"], 1.0, 0.0, 1.0 );
		
		if(!isDefined(self.fake_player))
		{
			self.fake_player = [];
		}
		self.fake_player[localClientNum] = fake_player;	
		
		self thread wait_for_flung_player_to_disconnect(localClientNum);
	}
	else
	{
		if(!isDefined(self.fake_player) && !isDefined(self.fake_player[localClientNum]))
		{
			return;
		}
		str_notify = "player_flung" + localClientNum;
		self notify(str_notify);	

		self notify("end_flinger");

		if(IsDefined(self.fake_player[localClientNum].fake_weapon))
		{
			self.fake_player[localClientNum].fake_weapon Delete();
			self.fake_player[localClientNum].fake_weapon = undefined;
		}

		self.fake_player[localClientNum] delete();
		self.fake_player[localClientNum] = undefined;

	}
}


flinger_weapon_monitor(fake_weapon)
{
	self endon("end_flinger");
	self endon("disconnect");
	
	while(self.weapon == "none")
	{
		wait(.05);
	}	
	fake_weapon SetModel( getweaponmodel(self.weapon) );
	fake_weapon useweaponhidetags( self.weapon );
	
}


/*------------------------------------
track the player being flung
self = the flung player
------------------------------------*/
player_disconnect_tracker()
{
	self notify("stop_tracking");
	self endon("stop_tracking");
	
	ent_num = self GetEntityNumber();
	
	while(IsDefined(self))
	{
		wait(0.05);
	}
	
	level notify("player_disconnected",ent_num);
}


/*------------------------------------
wait to see if the person being flung disconnects during the ride
then do some cleanup

self = players who are NOT being flung
------------------------------------*/

flinger_model_remover(str_endon, player)
{
	player endon(str_endon);

	level waittill("player_disconnected", client);
	
	if(IsDefined(self.fake_weapon))
	{
		self.fake_weapon Delete();
	}
	
	self Delete();
}



wait_for_flung_player_to_disconnect(localClientNum)
{
	str_endon = "player_flung"+localClientNum;	
	
	self.fake_player[localClientNum] thread flinger_model_remover(str_endon, self);
}


launch_zombie(localClientNum, set,newEnt)
{
	if ( localClientNum != 0 )
	{
		return;
	}
	
	fling_dir = getstruct("fling_angles","script_noteworthy").angles;
	force = RandomIntRange( 285,390 );	
	launch_dir = vector_scale( AnglesToForward( fling_dir + (RandomIntRange(-10,18),0,0) ), force );
	self launchragdoll ( launch_dir );
	
}