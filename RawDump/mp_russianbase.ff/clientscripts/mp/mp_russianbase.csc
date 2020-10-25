// Test clientside script for mp_russianbase

#include clientscripts\mp\_utility;
#include clientscripts\mp\_rewindobjects;

main()
{
	// If the team nationalites change in this level's gsc file,
	// you must update the team nationality here!
	clientscripts\mp\_teamset_winterspecops::level_init();
	
	// _load!
	clientscripts\mp\_load::main();

	clientscripts\mp\mp_russianbase_fx::main();

	//thread clientscripts\mp\_fx::fx_init(0);
	thread clientscripts\mp\_audio::audio_init(0);

	thread clientscripts\mp\mp_russianbase_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : mp_russianbase running...");
	localClientNum = 0;
	level thread swingCrate( localClientNum );
	level runTrains( localClientNum );
}
	
runTrains( localClientNum )
{
	// if you change moveTime of numOfCarts you need to change it in server script also
	moveTime = 20;
	numOfCarts = 40;
	for ( ;; )
	{
		level waittill( "play_train" );
		level thread runTrain( localClientNum, moveTime, numOfCarts );
	}
}

runTrain( localClientNum, moveTime, numOfCarts )
{
	level endon ("game_ended");
	
	originalRatio = ( moveTime / 80 );
	
	trainStart = GetEnt( localClientNum , "trainpoint01", "targetname" );
	trainEnd = GetEnt( localClientNum , "trainpoint02", "targetname" );

	level thread spawnTrainEngine( localClientNum, trainStart.origin, trainEnd.origin, moveTime );
	realwait( 1.3 * originalRatio );
	
	for( i=0; i<numOfCarts; i++ )
	{
		realwait( 3.6 * originalRatio );
		carType = randomint( 4 );
		if ( carType == 0 && i < numOfCarts - 1)
		{
			level thread spawnTrainCar( localClientNum, "t5_veh_train_fuelcar", trainStart.origin, trainEnd.origin, moveTime );
		}
		else
		{
			level thread spawnTrainCar( localClientNum, "t5_veh_train_boxcar", trainStart.origin, trainEnd.origin, moveTime );
		}
	}
}

spawnTrainEngine(  localClientNum, startLoc, endLoc, time )
{	
	engineType = "t5_veh_train_engine";
	trainEngine = Spawn( localClientNum, startLoc, "script_model" );

	trainEngine SetModel( engineType );
	
	trainEngine playSmokeEffects( localClientNum );
	
	trainEngine MoveTo( endLoc, time, 0, 0 );
	
	trainEngine thread play_trainCar_audio( engineType );
	
	// vibrate works, but it unneeded as the train is moving so slow.  
	// may get feedback that they need to vibrate/ go faster
	//trainEngine thread vibrate();

	trainEngine waittill( "movedone" );
	trainEngine Delete();
}

playSmokeEffects( localClientNum )
{
	self endon( "entityshutdown" );
	self waittill_dobj(localClientNum);
	playfxontag( localClientNum, level._effect["fx_smoke_train"], self, "tag_origin" );
}
	
spawnTrainCar( localClientNum, carType, startLoc, endLoc, time )
{	
	trainCar = Spawn( localClientNum, startLoc, "script_model" );

	trainCar SetModel( carType );
	
	trainCar MoveTo( endLoc, time, 0, 0 );
	
	trainCar thread play_trainCar_audio( carType );
	
	// vibrate works, but it unneeded as the train is moving so slow.  
	// may get feedback that they need to vibrate/ go faster
	//trainCar thread vibrate();

	trainCar waittill( "movedone" );
	trainCar Delete();
}

vibrate()
{
	self endon( "death" );
	self endon( "entityshutdown" );
	
	randomVibrateAmplitude = RandomFloatRange( 0.2, 0.4 );
	randomVibrateTime = RandomFloatRange( 1, 1.5 );
	
	angles0 = ( self.angles[0], self.angles[1], self.angles[2] - randomVibrateAmplitude );
	angles1 = ( self.angles[0], self.angles[1], self.angles[2] + randomVibrateAmplitude );
	
	for(;;)
	{
		self RotateTo(angles0, randomVibrateTime, randomVibrateTime/2, randomVibrateTime/2 );
		self waittill( "rotatedone" );
		self RotateTo(angles1, randomVibrateTime, randomVibrateTime/2, randomVibrateTime/2 );
		self waittill( "rotatedone" );
	}
}
	

swingCrate( localClientNum )
{
	level endon ("game_ended");
	
	crate = GetEnt( localClientNum, "hangingcrate01", "targetname" );
	crate endon( "entityshutdown" );
	
	while( 1 )
	{
		randomSwingAngle = RandomFloatRange( 1, 3 );
		randomSwingTime = RandomFloatRange( 2, 3 );
		
		crate serverTimedRotateTo( localClientNum, (0,randomSwingAngle*0.5,randomSwingAngle), level.serverTime, randomSwingTime );
		crate waittill( "rotatedone" );
		crate serverTimedRotateTo( localClientNum, (0,randomSwingAngle*-1*0.5,randomSwingAngle*-1), level.serverTime, randomSwingTime );
		crate waittill( "rotatedone" );
	}
}

play_trainCar_audio( carType )
{
    self PlayLoopSound( "veh_train_move_fast" );
    
    if( carType == "t5_veh_train_engine" )
        self thread play_trainCar_horn();   
}

play_trainCar_horn()
{
    self endon( "movedone" );
    
    horn_audio      = [];
    horn_audio[0]   = "veh_train_horn_short";
    horn_audio[1]   = "veh_train_horn_med";

    wait(RandomFloatRange( 2, 10 ) );
    self PlaySound( 0, horn_audio[RandomInt(horn_audio.size)] );
}
