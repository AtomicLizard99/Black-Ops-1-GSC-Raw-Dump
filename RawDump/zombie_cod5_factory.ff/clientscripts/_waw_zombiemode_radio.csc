/// _waw_zombiemode_radio.csc
///

#include clientscripts\_utility; 


init()
{

	level._ZOMBIE_RADIO_CLIENTFLAG = 14;
	level.radio_id = -1;
	level.radio_index = 0;
	add_song( "wtf" );
	add_song( "abra_macabre" );
	add_song( "uhf" );
	add_song( "dusk" );	
	add_song( "underwater" );
	add_song( "slasher_flick" );
	add_song( "maskwalk" );
	add_song( "sand" );
	add_song( "temple" );
	add_song( "" ); //silence must be last

	register_clientflag_callback("scriptmover", level._ZOMBIE_RADIO_CLIENTFLAG, ::next_song);
	
	level thread stop_radio_listener();
	
}

next_song(localClientNum, set, val)
{
	
	assert(isdefined(level.radio_id));
	assert(isdefined(level.radio_songs));
	assert(isdefined(level.radio_index));
	assert(level.radio_songs.size > 0);
	if(!IsDefined (level.stop_radio))
	{
		level.stop_radio = false;
	}
	//iprintlnbold ("var radio = " + "" +level.stop_radio);
	if ( level.stop_radio == false)
	{
		if ( set)
		{
			println("client changing songs");
			playsound(0, "static", self.origin);
	
			if(SoundPlaying(level.radio_id))
			{
				fade(level.radio_id, 1);
			}
			else
			{
				wait(.5);
			}
	
			println("new song: " + level.radio_songs[level.radio_index]);
			level.radio_id = playsound(0, level.radio_songs[level.radio_index], self.origin);
		
			level.radio_index += 1;
			
			if(level.radio_index >= level.radio_songs.size)
			{
				level.radio_index = 0;
			}
		}
	}
	else 
	{
		//iprintlnbold ("stopping_radio");
		if(IsDefined (level.radio_id))
		{
			stopsound(level.radio_id);
		}
	}

}


add_song(song)
{
	if(!isdefined(level.radio_songs))
	{	
 		level.radio_songs = [];
	}
	level.radio_songs[level.radio_songs.size] = song;
}

fade(id, time)
{
	rate = 0;
	if(time != 0)
		rate = 1.0 / time;

	setSoundVolumeRate(id, rate);
	setSoundVolume(id, 0.0);

	wait(time);

	stopSound(id);
}
stop_radio_listener()
{
	while(1)
	{
		level waittill ("ktr");
		level.stop_radio = true;
		level thread next_song();
		//iprintlnbold ("ran next song func in csc");
		//register_clientflag_callback("scriptmover", level._ZOMBIE_RADIO_CLIENTFLAG, , true::next_song();
		level waittill ("rrd");
		level.stop_radio = false;
		wait(0.5);
	}
	
}



