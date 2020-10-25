//Client side animation for players on the geyser

#include clientscripts\_utility;
#include clientscripts\_music;
#include clientscripts\_zombiemode_weapons;

main()
{
	init_player_geyser_anims();
	register_clientflag_callback("player",level._CF_PLAYER_GEYSER_FAKE_PLAYER_SETUP_PRONE, ::geyser_player_setup_prone);
	register_clientflag_callback("player",level._CF_PLAYER_GEYSER_FAKE_PLAYER_SETUP_STAND, ::geyser_player_setup_stand);
}

#using_animtree("zombie_coast");
init_player_geyser_anims()
{
	level.geyser_anims = [];
	level.geyser_anims["player_geyser_stand_crouch"] = %pb_rifle_stand_flinger_flail;
	level.geyser_anims["player_geyser_prone"] = %pb_rifle_prone_flinger_flail;
	level.geyser_animtree = #animtree;    

}

#using_animtree("zombie_coast");
geyser_player_setup_prone(localClientNum, set,newEnt)
{
	if(self isspectating())
	{
		return;
	}
	
	player = getlocalplayers()[localClientNum];		

	if(player GetEntityNumber() == self GetEntityNumber())
	{
		if( set ) // Rumble on the player who is using the geyser
		{
			self PlayRumbleOnEntity( localClientNum, "slide_rumble" );
		}
		else
		{
			self StopRumble( localClientNum, "slide_rumble" );
		}
		
		// Dont be doing this for the player on the geyser, but track him in case he disconnects
		return;	
	}
		
	if(set)
	{

		if(localClientNum == 0)
		{
				self thread player_disconnect_tracker();
		}
		
		fake_player = Spawn( localClientNum, self.origin + ( 0, 0, -800 ), "script_model" ); // spawn fake below ground to hide t-pose
		fake_player.angles = self.angles;
		fake_player SetModel( self.model );
		
		// richtofen's body doesn't have the head attached
		if( self.model == "c_ger_richtofen_body" )
		{			
			fake_player Attach( "c_ger_richtofen_head", "J_Spine4" );
			fake_player Attach( "c_ger_richtofen_offcap", "J_Head" );
		}
		
		fake_player.fake_weapon = spawn(localClientNum, self.origin, "script_model");
		if( self.weapon != "none" && self.weapon != "syrette_sp" )
		{
			fake_player.fake_weapon SetModel( getweaponmodel(self.weapon) );
			fake_player.fake_weapon useweaponhidetags( self.weapon );
		}
		else
		{
			self thread geyser_weapon_monitor(fake_player.fake_weapon);
		}
		fake_player.fake_weapon LinkTo( fake_player, "tag_weapon_right");
		
		realWait(0.016);
		
		fake_player linkto(self,"tag_origin"); // link after wait to avoid t pose
		fake_player UseAnimTree( level.geyser_animtree);
		fake_player SetAnim( level.geyser_anims["player_geyser_prone"], 1.0, 0.0, 1.0 );
		
		if(!isDefined(self.fake_player))
		{
			self.fake_player = [];
		}
		self.fake_player[localClientNum] = fake_player;

		//if the ziplining player disconnects, we need to make sure we clean up the fake player model
		self thread wait_for_geyser_player_to_disconnect(localClientNum);
	}
	else
	{
		if(!isDefined(self.fake_player) && !isDefined(self.fake_player[localClientNum]))
		{
			return;
		}
		str_notify = "player_geyser" + localClientNum;
		self notify(str_notify);	

		self notify("end_geyser");

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
geyser_player_setup_stand(localClientNum, set,newEnt)
{
	if(self isspectating())
	{
		return;
	}
	
	player = getlocalplayers()[localClientNum];		

	if(player GetEntityNumber() == self GetEntityNumber())
	{
		if( set ) // Rumble on the player who is using the geyser
		{
			self PlayRumbleOnEntity( localClientNum, "slide_rumble" );
		}
		else
		{
			self StopRumble( localClientNum, "slide_rumble" );
		}
		
		// Dont be doing this for the player on the geyser, but track him in case he disconnects
		return;	
	}
		
	if(set)
	{

		if(localClientNum == 0)
		{
			self thread player_disconnect_tracker();
		}
		
		fake_player = Spawn( localClientNum, self.origin + ( 0, 0, -800 ), "script_model" ); // spawn below ground to avoid t-pose
		fake_player.angles = self.angles;
		fake_player SetModel( self.model );
		
		// richtofen's body doesn't have the head attached
		if( self.model == "c_ger_richtofen_body" )
		{			
			fake_player Attach( "c_ger_richtofen_head", "J_Spine4" );
			fake_player Attach( "c_ger_richtofen_offcap", "J_Head" );
		}
		

		fake_player.fake_weapon = spawn(localClientNum, self.origin, "script_model");
		if( self.weapon != "none" && self.weapon != "syrette_sp" )
		{
			fake_player.fake_weapon SetModel( getweaponmodel(self.weapon) );
			fake_player.fake_weapon useweaponhidetags( self.weapon );
		}
		else
		{
			self thread geyser_weapon_monitor(fake_player.fake_weapon);
		}
		fake_player.fake_weapon LinkTo( fake_player, "tag_weapon_right");

		realWait(0.016);
		
		fake_player linkto( self,"tag_origin" ); // link after wait to avoid t-pose
		fake_player UseAnimTree( level.geyser_animtree);
		fake_player SetAnim( level.geyser_anims["player_geyser_stand_crouch"], 1.0, 0.0, 1.0 );
		
		if(!isDefined(self.fake_player))
		{
			self.fake_player = [];
		}
		self.fake_player[localClientNum] = fake_player;	

		self thread wait_for_geyser_player_to_disconnect(localClientNum);
	}
	else
	{
		if(!isDefined(self.fake_player) && !isDefined(self.fake_player[localClientNum]))
		{
			return;
		}
		str_notify = "player_geyser" + localClientNum;
		self notify(str_notify);	

		self notify("end_geyser");

		if(IsDefined(self.fake_player[localClientNum].fake_weapon))
		{
			self.fake_player[localClientNum].fake_weapon Delete();
			self.fake_player[localClientNum].fake_weapon = undefined;
		}

		self.fake_player[localClientNum] delete();
		self.fake_player[localClientNum] = undefined;

	}
}

geyser_weapon_monitor(fake_weapon)
{
	self endon("end_geyser");
	self endon("disconnect");
	
	while(self.weapon == "none" )
	{
		wait(.05);
	}	
	
	if( self.weapon != "syrette_sp" )
	{
		fake_weapon SetModel( getweaponmodel(self.weapon) );
		fake_weapon useweaponhidetags( self.weapon );		
	}

}

/*------------------------------------
track the player on geyser
self = the player on geyser
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
wait to see if the person on the geyser disconnects during the ride
then do some cleanup

self = players who are NOT on the geyser
------------------------------------*/

geyser_model_remover(str_endon, player)
{
	player endon(str_endon);

	level waittill("player_disconnected", client);
	
	if(IsDefined(self.fake_weapon))
	{
		self.fake_weapon Delete();
	}
	
	self Delete();
}

wait_for_geyser_player_to_disconnect(localClientNum)
{
	str_endon = "player_geyser"+localClientNum;	
	
	self.fake_player[localClientNum] thread geyser_model_remover(str_endon, self);
}
