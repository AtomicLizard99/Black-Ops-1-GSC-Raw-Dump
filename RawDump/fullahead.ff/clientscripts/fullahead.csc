// Test clientside script for fullahead

#include clientscripts\_utility;
#include clientscripts\_filter;

main()
{

	// _load!
	clientscripts\_load::main();
	

	init_flags();

	//petrenko bubbling from rebirth
	register_clientflag_callback("scriptmover", 0, ::scriptmover_gassed_handler);
	register_clientflag_callback("actor", level.ACTOR_CHARRING, ::actor_flag_charring_handler);
	clientscripts\fullahead_fx::main();

//	thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\fullahead_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);
	level thread superflare_handler();
	println("*** Client : fullahead running...");
}

superflare_handler()
{
	sf_0_max_sprites = 120;
	sf_0_pos_x = 0;
	sf_0_pos_y = 0;
	sf_0_pos_z = 0;
	sf_0_intensity = 0.65;
	sf_0_size = -0.1;

	init_filter_superflare( getlocalplayers()[0], "generic_filter_superflare" );

	level waittill("start_superflare");

	PrintLn("*** SUPERFLARE ON");

	enable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1, 0, sf_0_max_sprites, sf_0_pos_x, sf_0_pos_y, sf_0_pos_z, sf_0_intensity, sf_0_size );

	level waittill("end_superflare");

	PrintLn("*** SUPERFLARE OFF");

	disable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1,0);
}



scriptmover_gassed_handler(localClientNum, set, newEnt)	
{		   
	if(!is_mature())
	{
		return;
	}	
	
	if (set)
	{
		self thread character_gets_gassed(localClientNum);
	}	
}

init_flags()
{
	// Client Flags -- Match these in level
	level.ACTOR_CHARRING				= 2;
}

actor_flag_charring_handler(localClientNum, set, newEnt)
{
	if(!is_mature())
	{
		return;
	}
		
	self mapshaderconstant( localClientNum, 0, "ScriptVector0" ); 

	println("*** Client : flag callback good");
	self enable_charring(localClientNum, set);
}

enable_charring(localClientNum, set)
{
	self endon("death");
	println("*** Client : charring actor in progress");

	if(set)
	{
		vec0_val0_specular = 0;
		vec0_val1_dummy = 0;
		vec0_val2_char = 0;
		vec0_val3_dummy = 0;

		while(vec0_val2_char < 0.85)
		{
			println("*** Client : character is burning");
			//vec0_val0_specular += 0.01;
			//vec0_val1_dummy += 0.01;
			vec0_val2_char += 0.28;
			//vec0_val3_dummy += 0.01;

			self setshaderconstant( localClientNum, 0, vec0_val0_specular, vec0_val1_dummy, vec0_val2_char, vec0_val3_dummy );

			wait(0.1);
		}
	}
}

//------------------------------------
// Gas FX
character_gets_gassed(localClientNum)
{
	self mapshaderconstant( localClientNum, 0, "scriptVector0", 0.0, 0.0, 0.0, 0.0 );

	bubbling_amount = 0.0;
	gas_amount = 0.0;
	not_used = 0;

	//over the course of 20secs
	gas_vel = 0.0025;
	bubble_vel = 0.5;

	//test max burn
	//gas_amount = 1.0;
	//self setshaderconstant( localClientNum, 0, not_used, bubbling_amount, gas_amount, not_used );
	
	
	while ( IsDefined( self ) && gas_amount < 8.0 )
	{
		gas_amount += gas_vel;
		if (gas_amount > 2.0)
		{
			gas_amount = 5.0;
		}
		//PrintLn( gas_amount );
		self setshaderconstant( localClientNum, 0, not_used, bubbling_amount, gas_amount, not_used );

		wait(0.05);
	}

//	self waittill("death");

	//wait(1.0);

	//while (bubbling_amount < 1.0)
	//{
	//	bubbling_amount += bubble_vel * 0.05;
	//	if (bubbling_amount > 1.0)
	//	{
	//		bubbling_amount = 1.0;
	//	}

	//	self setshaderconstant( localClientNum, 0, not_used, bubbling_amount, gas_amount, not_used );

	//	wait(0.05);
	//}
}