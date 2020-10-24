#include clientscripts\_utility; 
#include clientscripts\_fx;
#include clientscripts\_music;

init()
{
	level thread death_card_think();

}

death_card_think()
{
	if(!isdefined(level.dcsound))
	{
		level.dcsound = spawn( 0, (0,0,0), "script_origin" );
	}
	
	while (1)
	{
		
		level waittill( "dc0" );	
		//iprintlnbold( "DEATHCARD SOUND" );
		level.dcsound playsound( 0, "evt_death_card"  );
	}	
		
}