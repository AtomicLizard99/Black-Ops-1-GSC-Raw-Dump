#include clientscripts\_utility;

main()
{
	
	waitforallclients();
	
	level thread init_lighthouse_light();
	level thread lighthouse_search_toggle();

	level thread lighthouse_packapunch_think("pp0");	// ship
	level thread lighthouse_packapunch_think("pp1");	// front/beach
	level thread lighthouse_packapunch_think("pp2");	// out back
}


/*------------------------------------
setup the lighthouse thread on each local player
------------------------------------*/
init_lighthouse_light()
{
	local_players = getlocalplayers();
	
	for(index=0;index<local_players.size;index++)
	{
		local_players[index] thread lighthouse_light(index);
	}
	
}

/*------------------------------------
waits for the power to turn on and then starts the light spinning until it focuses on the pap machine
self = local player
------------------------------------*/
lighthouse_light(index)
{
	
	level waittill("LHL");
	
	self.light_start_point = getstruct("pack_light","targetname");
	
	self.lighthouse_fx_model = spawn(index,self.light_start_point.origin,"script_model");
	self.lighthouse_fx_model setmodel("tag_origin");	
	playfxontag(index,level._effect["fx_zmb_coast_spotlight_main"], self.lighthouse_fx_model,"tag_origin");
	

	if(index == 0)
	{
		level.packapunch_active = false;	//the light searches while the packapunch is not active
	}
	
	self thread lighthouse_search_logic();
	self thread lighthouse_freak_out(index);
	
	//spin the lighthouse light
	while(1)
	{
		if(level.packapunch_active) //if packapunch is active then the light is focused on the packapunch location and we need to wait for it to be ready to move
		{
			self wait_for_packapunch_to_finish();
		}
	
		self.lighthouse_fx_model rotateto ((self.lighthouse_fx_model.angles[0],self.lighthouse_fx_model.angles[1]+5,self.lighthouse_fx_model.angles[2]),.2);
		wait( .1 );	
	}	
	
}

/*------------------------------------
waits for the packapunch to finish being available
self = a local player
------------------------------------*/
wait_for_packapunch_to_finish()	
{	
	
	while(level.packapunch_active)
	{
		wait .05;
	}
	
	//reset the light angles ( except the yaw )
	self.lighthouse_fx_model rotateto ((0,self.lighthouse_fx_model.angles[1],0),1);
	self.lighthouse_fx_model waittill("rotatedone");

}

/*------------------------------------
this waits for the notify to de-activate the
packapunch machine
------------------------------------*/
lighthouse_search_toggle()
{
	while(1)
	{
		level waittill ("PPH");
/*		local_players = getlocalplayers();
	
		for(index=0;index<local_players.size;index++)
		{
			local_players[index].packapunch_active = false;
		} */
		
		level.packapunch_active = false;
	}
}

/*------------------------------------
this waits for the notification for the lighthouse
to focus on the chosen packapunch location

self = local player
------------------------------------*/
lighthouse_search_logic()
{
	while(1)
	{
		
		level waittill("pap_time",pap_struct);
		
		pap_location = get_packapunch_location(pap_struct);
		
		org = pap_location.origin;
		
		//this rotates the light towards the packapunch machine location
		dir = org - self.lighthouse_fx_model.origin;		
		angles = vectortoangles(dir);
		self.pre_pap_angles = self.lighthouse_fx_model.angles;
		level.packapunch_active = true;
		
		wait(.2); // this is here to ensure the thread that is controlling the searching has time to stop
		
		//point the light to the pap machine
		self.lighthouse_fx_model rotateto(angles,1);	
		
	}
}

lighthouse_freak_out(index)
{
	while(1)
	{
		level waittill("lhfo");
		
		// WW (03-25-11): Issue 78824: 360 - DLC3 - Zombies - Coast - SCRIPT - Implement vision set before the lighthouse light begins to "Freak Out" 
		f_activate_time = 0.1;
		f_remove_time = 1.5;
		
		level thread freakout_sun_reaction();
		
		self clientscripts\_zombiemode::zombie_vision_set_apply( level._coast_lighthouse_freak_out_set, level._coast_lighthouse_freak_out_set_priority, f_activate_time, index );
		wait( f_remove_time );
		self clientscripts\_zombiemode::zombie_vision_set_remove( level._coast_lighthouse_freak_out_set, f_remove_time, index );
		
		level.lighthouse_freakout = 1;
		level thread freakout_timer();
		level.packapunch_active = true;
		while(level.lighthouse_freakout)
		{
			time = randomfloatrange(.5,1);
			self.lighthouse_fx_model rotateto((randomintrange(-90,90),randomintrange(-180,180),randomintrange(-90,90)),time);	
			wait(time);			
		}
	}
}

freakout_timer()
{
	level waittill("lhfd");
	level.lighthouse_freakout = 0;
}

freakout_sun_reaction()
{
	full_wait_time = 1.5;
	incremental_wait_time = 0.05;
	current_time = 0;
	
	sun_amount_array = [];
	sun_amount_array[0] = 1.5;
	sun_amount_array[1] = 0.8;
	sun_amount_array[2] = 0.2;
	sun_amount_array[3] = 2.2;
	sun_amount_array[4] = 1.1;
	sun_amount_array[5] = 0.5;
	
	
	while( current_time < full_wait_time )
	{
		flt_amount = sun_amount_array[ RandomInt( sun_amount_array.size ) ]; // they all need to be the same intensity to keep the color white
		SetSunLight( flt_amount, flt_amount, flt_amount ); 
		wait( incremental_wait_time );		
		
		current_time = current_time + incremental_wait_time;
	}

	// reset sun light
	ResetSunlight();
}
/*------------------------------------
gets the script_struct where the pack a punch
machine will be moved to
------------------------------------*/
get_packapunch_location(pap_script_string)
{
	pap_locations = getstructarray("pap_location","targetname");
	pap_location = undefined;
	for(i=0;i<pap_locations.size;i++)
	{
		if(pap_locations[i].script_string == pap_script_string)
		{
			pap_location = pap_locations[i];
		}
	}
	return pap_location;
}


/*------------------------------------
these are the individual packapunch location monitors 
which trigger the lighthouse to focus on the chosen packapunch location
------------------------------------*/
lighthouse_packapunch_think(str_notify)
{
	while(1)
	{
		level waittill(str_notify);
		level notify("pap_time",str_notify);
	}
}
