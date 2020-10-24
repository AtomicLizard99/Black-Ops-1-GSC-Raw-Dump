#include clientscripts\_utility;
#include clientscripts\_music;

main()
{
	// Keep this here for CreateFx
	clientscripts\zombietron_fx::main();

	// _load!
	clientscripts\_zombietron::main();
	thread clientscripts\zombietron_amb::main();

	level._client_flagasval_callbacks["player"] = ::menu_handler;

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);
	
	register_zombie_types();
	
}

register_zombie_types()
{
//	character\clientscripts\c_zom_quad::register_gibs();	
//	character\clientscripts\c_usa_pent_zombie_militarypolice::register_gibs();	
	character\clientscripts\c_ger_honorguard_zombietron::register_gibs();	
}	

menu_handler( localClientNum, val ) 
{
	if ( val < 8 )
	{
		//ForceGameModeMappings( localClientNum, "zombietron" ); // This gets call during gameplay and causes random loss of input because of CL_ClearKeys
		self mapshaderconstant( localClientNum, 0, "scriptVector0", 1.0, -1.0, 0.0, 0.0 );
	}
}