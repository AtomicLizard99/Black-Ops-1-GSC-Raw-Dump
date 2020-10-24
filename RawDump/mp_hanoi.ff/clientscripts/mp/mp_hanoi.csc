// Test clientside script for mp_hanoi

#include clientscripts\mp\_utility;

main()
{
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_junglemarines::level_init();
	
	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_hanoi_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_hanoi_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : mp_hanoi running...");
}
