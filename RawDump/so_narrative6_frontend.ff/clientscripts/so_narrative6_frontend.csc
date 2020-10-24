// Test clientside script for so_narrative6_frontend

#include clientscripts\_utility;

main()
{

	clientscripts\frontend::main();
	
	// do not use this anywhere other than so_narrative6_frontend.csc
	// this slows down extra cam rendering
	SetSavedDvar( "r_extracam_shadowmap_enable", 1 );
}