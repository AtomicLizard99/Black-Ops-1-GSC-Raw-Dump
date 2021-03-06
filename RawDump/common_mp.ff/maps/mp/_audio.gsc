#include maps\mp\_utility;
#include common_scripts\utility;




init()
{
	//array_thread( GetEntArray( "audio_sound_trigger", "targetname" ), ::thread_sound_trigger );
//	array_thread( GetEntArray( "audio_bump_trigger", "targetname"), :: thread_bump_trigger); 

// removed to port to client	array_thread( GetEntArray(	"audio_step_trigger", "targetname"), ::thread_step_trigger);
//	thread bump_trigger_hack(); moved to CSC
	
	
}

/*bump_trigger_hack() //moved to CSC
{
	bump_trigs = GetEntArray( "audio_bump_trigger", "targetname");
	
	for(i=0;i<bump_trigs.size; i++)
	{
		bump_trigs[i] thread thread_bump_trigger();	
	}
	
	
}
*/
wait_until_first_player()
{
	players = get_players();
	if( !IsDefined( players[0] ) )
	{
		level waittill( "first_player_ready" );
	}
	players = get_players();
	for(i=0;i<players.size;i++)
	{
		players[i] thread monitor_player_sprint();
		
	}
}
/* //moved to CSC
thread_bump_trigger()
{

	iprintlnbold("found_a_bump_trig");
	self thread bump_trigger_listener();
	if(!IsDefined(self.script_activated)) //Sets a flag to turn the trigger on or off
	{
		self.script_activated = 1;
	}
	while(1)
	{

		self waittill("trigger", who);
				
		//Check to see if Dead Silence is being used...if it is, don't do anything.
		if ( ! (who hasPerk ("specialty_quieter") ))
		{
			if(IsDefined (self.script_sound) && self.script_activated)
			{	
				//Store sound to play in script_sound/ alias name
				self playsound (self.script_sound);
				
				// iprintlnbold(self.script_sound);
			}
			while(IsDefined (who) && (who) IsTouching (self))
			{
				wait(0.1);
			}	
		}	
	}
}
*/
stand_think(trig)
{
	killText = "kill_stand_think" + trig getentitynumber();
	
	self endon("disconnect");
	self endon("death");
	self endon(killText);
	
	//store stand on sounds on script_label
	/*
	if(!IsDefined(trig.script_wait_min) || !IsDefined(trig.script_wait_max))
	{
		
	}
	*/	
	while(1)
	{
		//wait(randomfloatrange(trig.script_wait_min, trig.script_wait_max));
		if(self.player_Is_moving)
		{			
			trig playsound(trig.script_label);			
		}
		wait(1);
	
	}
}

monitor_player_sprint()
{
	self endon("disconnect");
	
	self thread monitor_player_movement();

	self._is_sprinting = false;
	while(1)
	{
		
        self waittill("sprint_begin");
//        iprintlnbold("sprinting");
        
        self._is_sprinting = true;
        self waittill ("sprint_end");
        
//        iprintlnbold("Not sprinting");
		self._is_sprinting = false;
	}
}

monitor_player_movement()
{
	self endon("disconnect");

	while(1)
	{
		org_1 = self.origin;
		wait(1.0);
		org_2 = self.origin;
		distancemoved = distanceSquared( org_1, org_2 );
		if(distancemoved > 64*64)
		{
			self.player_Is_moving = true;	
		} 
		else
		{
			self.player_Is_moving = false;	
		}
		
		
	}	
	
}
thread_enter_exit_sound(trig)
{
	self endon("death");
	self endon("disconnect");
	
	// self is the player
	// trig is the trigger.
//	iprintlnbold("Player :" + self getentitynumber() + " enters.");
	trig.touchingPlayers[self getentitynumber()] = 1;
	//Store sound to play when entering the trigger: in script_sound/ alias name
	if(IsDefined (trig.script_sound) && trig.script_activated && self._is_sprinting)
	{	
		self playsound (trig.script_sound);
//		iprintlnbold(trig.script_sound);
	}

	self thread stand_think(trig);


	while(self IsTouching (trig))
	{
		wait(0.1);
	}
	
	self notify("kill_stand_think" + trig getentitynumber());
	
	//Store Exit sound on script_noteworthy
	self playsound(trig.script_noteworthy);
//	iprintlnbold("Player :" + self getentitynumber() + " exits.");
	
	trig.touchingPlayers[self getentitynumber()] = 0;
}

thread_step_trigger()
{
//	iprintlnbold("found_a_step_trig");
//self thread bump_trigger_listener();
//TO DO Make script_activated be a value you can set in radiant.
	if(!IsDefined(self.script_activated)) //Sets a flag to turn the trigger on or off
	{
		self.script_activated = 1;
	}
	
	if(!Isdefined(self.touchingPlayers))
	{
		self.touchingPlayers = [];
		for(i = 0; i < 4; i ++)
		{
			self.touchingPlayers[i] = 0;
		}
	}
	
	while(1)
	{
		self waittill("trigger", who);
		if ( ! (who hasPerk ("specialty_quieter") ))
		{
			if(self.touchingPlayers[who getentitynumber()] == 0)
			{
				who thread thread_enter_exit_sound(self);
			} 	
		}	
		

	}
}

disable_bump_trigger(triggername)
{
	triggers = GetEntArray( "audio_bump_trigger", "targetname");
	if(IsDefined (triggers))
	{
		for(i=0;i<triggers.size;i++)
		{
			if (IsDefined (triggers[i].script_label) && triggers[i].script_label == triggername)
			{
				triggers[i].script_activated =0;
			}
			
		}
	}

}
/* //moved to CSC
bump_trigger_listener() //This will deactivate the trigger on a level notify if its stored on the trigger
{
	//Store End-On conditions in script_label so you can turn off the bump trigger if a condition is met
	if(IsDefined (self.script_label))
	{
		level waittill(self.script_label);
		self.script_activated =0;
	}
}
*/
get_player_index_number(player)
{
	players = get_players();
	for(i=0; i<players.size; i++)
	{
		if (players[i] == player)
		{
			return i;
		}

	}

	return 1;
}

