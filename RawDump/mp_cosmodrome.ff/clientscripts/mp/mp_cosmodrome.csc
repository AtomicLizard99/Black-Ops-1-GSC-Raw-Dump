#include clientscripts\mp\_utility;

main()
{	
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_urbanspecops::level_init();

	// _load!
	clientscripts\mp\_load::main();
	

	clientscripts\mp\mp_cosmodrome_fx::main();
//	thread clientscripts\mp\_fx::fx_init(0);
	level._client_flag_callbacks["scriptmover"][level.const_flag_rocket_fx] = ::cosmodrome_rocket_fx;
	
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_cosmodrome_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : mp_cosmodrome running...");
}

cosmodrome_rocket_fx( localClientNum, set )
{
	if ( !set )
		return;

	PlayFxOnTag( localClientNum, level._effect["rocket_blast_trail"], self, "tag_engine" );
}
