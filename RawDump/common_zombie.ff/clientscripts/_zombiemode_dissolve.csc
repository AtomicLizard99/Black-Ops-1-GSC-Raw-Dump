#include clientscripts\_utility;

start_zombie_dissolve( localClientNum, colorIndex, durationMsec )
{
	//println( "ZOMBIE---------------------start_zombie_dissolve" );
	self thread run_dissolve_effect( localClientNum, colorIndex, durationMsec );
}

run_dissolve_effect( localClientNum, colorIndex, durationMsec )
{
	self endon( "entityshutdown" );

	durationMsec = durationMsec * 2.0;
	
	self mapshaderconstant( localClientNum, 0, "scriptVector0" );
	//self mapshaderconstant( localClientNum, 1, "scriptVector1" );

	begin_time = GetRealTime();
	while( 1 )
	{
		age = GetRealTime() - begin_time;
		t = age / durationMsec;

		if ( t > 1.0)
			t = 1.0;


		// for the new zombie shader we need to map 0 -> 1 into an appropriate value
		// 0 -> 0.5 will control the colour dissolve 0.5 -> 1 will control the alpha dissovle
		
		colorDissolve = t * 2.0;
		if (colorDissolve > 1.0)
			colorDissolve = 1.0;

		alphaDissolve = (t - 0.5) * 2.0;
		if (alphaDissolve < 0.0)
			alphaDissolve = 0.0;
		if (alphaDissolve > 1.0)
			alphaDissolve = 1.0;

		// now map the required 0 -> 1 into the correct shader inputs
		// for the alpha and dissolve effect 0 -> 1 = -1 to 1
		// for the alpha dissovle the mask can also be compressed, this should be an input value but for now use 4.0

		alphaDissolveMaskCompression  = 4.0;
		alphaDissolveAmount = (alphaDissolve - 0.5) * 2.0 * alphaDissolveMaskCompression;		// remap into -1 -> 1 * compression

		colorDissolveAmount = (colorDissolve - 0.5) * 2.0;						// remap into -1 -> 1


		// input shader constant .xyzw = alphadissolve mul,add, color dissolve index, amount
		//println( "SHADER VALUES - colorDissolveAmount=" + colorDissolveAmount );
	
	
		// red = 0
		// green = 1
		// blue = 2
		// black = 3
		colIndex = clamp( colorIndex, 0, 3 );
		colIndex = 3; // the colors don't look right at the moment
		
		if(!IsDefined(self))
		{
			return;
		}
		
		self setshaderconstant( localClientNum, 0, alphaDissolveMaskCompression, alphaDissolveAmount, colIndex * (1.0/127.0), colorDissolveAmount );

		if (t== 1.0)
			break;

		realwait(0.05);
	}
}

							