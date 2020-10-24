//
// file: mp_firingrange_amb.csc
// description: clientside ambient script for mp_firingrange: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\mp\_utility; 
#include clientscripts\mp\_ambientpackage;

main()
{
	declareAmbientRoom("outside" );
		setAmbientRoomReverb( "outside", "firingrange_outside", 1, 1 );
		setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );

	declareAmbientRoom("trailer" );
		setAmbientRoomReverb( "trailer", "firingrange_trailer", 1, 1 );
		setAmbientRoomContext( "trailer", "ringoff_plr", "outdoor" );
		
	declareAmbientRoom("med_room" );
		setAmbientRoomReverb( "med_room", "firingrange_med_room", 1, 1 );
		setAmbientRoomContext( "med_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("cave" );
		setAmbientRoomReverb( "cave", "firingrange_cave", 1, 1 );
		setAmbientRoomContext( "cave", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("partial_room" );
		setAmbientRoomReverb( "partial_room", "firingrange_partial_room", 1, 1 );
		setAmbientRoomContext( "partial_room", "ringoff_plr", "outdoor" );

	declareAmbientRoom("small_room" );
		setAmbientRoomReverb( "small_room", "firingrange_small_room", 1, 1 );
		setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("stone_room" );
		setAmbientRoomReverb( "stone_room", "firingrange_stone_room", 1, 1 );
		setAmbientRoomContext( "stone_room", "ringoff_plr", "indoor" );

	activateAmbientRoom( 0, "outside", 0 );		
}

