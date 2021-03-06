/*

// Edge relative placement values for rect->h_align and rect->v_align
#define HORIZONTAL_ALIGN_SUBLEFT		0	// left edge of a 4:3 screen (safe area not included)
#define HORIZONTAL_ALIGN_LEFT			1	// left viewable (safe area) edge
#define HORIZONTAL_ALIGN_CENTER			2	// center of the screen (reticle)
#define HORIZONTAL_ALIGN_RIGHT			3	// right viewable (safe area) edge
#define HORIZONTAL_ALIGN_FULLSCREEN		4	// disregards safe area
#define HORIZONTAL_ALIGN_NOSCALE		5	// uses exact parameters - neither adjusts for safe area nor scales for screen size
#define HORIZONTAL_ALIGN_TO640			6	// scales a real-screen resolution x down into the 0 - 640 range
#define HORIZONTAL_ALIGN_CENTER_SAFEAREA 7	// center of the safearea
#define HORIZONTAL_ALIGN_MAX			HORIZONTAL_ALIGN_CENTER_SAFEAREA
#define HORIZONTAL_ALIGN_DEFAULT		HORIZONTAL_ALIGN_SUBLEFT

#define VERTICAL_ALIGN_SUBTOP			0	// top edge of the 4:3 screen (safe area not included)
#define VERTICAL_ALIGN_TOP				1	// top viewable (safe area) edge
#define VERTICAL_ALIGN_CENTER			2	// center of the screen (reticle)
#define VERTICAL_ALIGN_BOTTOM			3	// bottom viewable (safe area) edge
#define VERTICAL_ALIGN_FULLSCREEN		4	// disregards safe area
#define VERTICAL_ALIGN_NOSCALE			5	// uses exact parameters - neither adjusts for safe area nor scales for screen size
#define VERTICAL_ALIGN_TO480			6	// scales a real-screen resolution y down into the 0 - 480 range
#define VERTICAL_ALIGN_CENTER_SAFEAREA	7	// center of the save area
#define VERTICAL_ALIGN_MAX				VERTICAL_ALIGN_CENTER_SAFEAREA
#define VERTICAL_ALIGN_DEFAULT			VERTICAL_ALIGN_SUBTOP

static const char *g_he_font[] =
{
	"default",		// HE_FONT_DEFAULT
	"bigfixed",		// HE_FONT_BIGFIXED
	"smallfixed",	// HE_FONT_SMALLFIXED
	"objective",	// HE_FONT_OBJECTIVE
};


// These values correspond to the defines in q_shared.h
static const char *g_he_alignx[] =
{
	"left",   // HE_ALIGN_LEFT
	"center", // HE_ALIGN_CENTER
	"right",  // HE_ALIGN_RIGHT
};


static const char *g_he_aligny[] =
{
	"top",    // HE_ALIGN_TOP
	"middle", // HE_ALIGN_MIDDLE
	"bottom", // HE_ALIGN_BOTTOM
};


// These values correspond to the defines in menudefinition.h
static const char *g_he_horzalign[] =
{
	"subleft",			// HORIZONTAL_ALIGN_SUBLEFT
	"left",				// HORIZONTAL_ALIGN_LEFT
	"center",			// HORIZONTAL_ALIGN_CENTER
	"right",			// HORIZONTAL_ALIGN_RIGHT
	"fullscreen",		// HORIZONTAL_ALIGN_FULLSCREEN
	"noscale",			// HORIZONTAL_ALIGN_NOSCALE
	"alignto640",		// HORIZONTAL_ALIGN_TO640
	"center_safearea",	// HORIZONTAL_ALIGN_CENTER_SAFEAREA
};
cassert( ARRAY_COUNT( g_he_horzalign ) == HORIZONTAL_ALIGN_MAX + 1 );


static const char *g_he_vertalign[] =
{
	"subtop",			// VERTICAL_ALIGN_SUBTOP
	"top",				// VERTICAL_ALIGN_TOP
	"middle",			// VERTICAL_ALIGN_CENTER
	"bottom",			// VERTICAL_ALIGN_BOTTOM
	"fullscreen",		// VERTICAL_ALIGN_FULLSCREEN
	"noscale",			// VERTICAL_ALIGN_NOSCALE
	"alignto480",		// VERTICAL_ALIGN_TO480
	"center_safearea",	// VERTICAL_ALIGN_CENTER_SAFEAREA
};
cassert( ARRAY_COUNT( g_he_vertalign ) == VERTICAL_ALIGN_MAX + 1 );
*/

init()
{
	precacheShader( "progress_bar_bg" );
	precacheShader( "progress_bar_fg" );
	precacheShader( "progress_bar_fill" );
	precacheShader( "score_bar_bg" );
	precacheShader( "score_bar_allies" );
	precacheShader( "score_bar_opfor" );
	
	level.uiParent = spawnstruct();
	level.uiParent.horzAlign = "left";
	level.uiParent.vertAlign = "top";
	level.uiParent.alignX = "left";
	level.uiParent.alignY = "top";
	level.uiParent.x = 0;
	level.uiParent.y = 0;
	level.uiParent.width = 0;
	level.uiParent.height = 0;
	level.uiParent.children = [];
	
	level.fontHeight = 12;
	
	level.hud["allies"] = spawnstruct();
	level.hud["axis"] = spawnstruct();
	
	// we can, of course, separate out the following constants for splitscreen.	
	// primary progress bars are for things like capturing flags or planting bombs - big, important things that happen as you play a gametype
	level.primaryProgressBarY = -61; // from center
	level.primaryProgressBarX = 0;
	level.primaryProgressBarHeight = 9; //28; // this is the height and width of the whole progress bar, including the outline. the part that actually moves is 2 pixels smaller.
	level.primaryProgressBarWidth = 120;
	level.primaryProgressBarTextY = -75;
	level.primaryProgressBarTextX = 0;
	level.primaryProgressBarFontSize = 1.4;
	
	if ( level.splitscreen )
	{
		// (x offset avoids overlapping radar on top left screen)
		level.primaryProgressBarX = 20;
		level.primaryProgressBarTextX = 20;
		
		level.primaryProgressBarY = 15;
		level.primaryProgressBarTextY = 0;
		level.primaryProgressBarHeight = 2;
	}

	// supplydrop
	level.secondaryProgressBarY = -85; // from center
	level.secondaryProgressBarX = 0;
	level.secondaryProgressBarHeight = 9; //28; // this is the height and width of the whole progress bar, including the outline. the part that actually moves is 2 pixels smaller.
	level.secondaryProgressBarWidth = 120;
	level.secondaryProgressBarTextY = -100;
	level.secondaryProgressBarTextX = 0;
	level.secondaryProgressBarFontSize = 1.4;
	
	if ( level.splitscreen )
	{
		// (x offset avoids overlapping radar on top left screen)
		level.secondaryProgressBarX = 20;
		level.secondaryProgressBarTextX = 20;
		
		level.secondaryProgressBarY = 15;
		level.secondaryProgressBarTextY = 0;
		level.secondaryProgressBarHeight = 2;
	}

	level.teamProgressBarY = 32; // 205;
	level.teamProgressBarHeight = 14;
	level.teamProgressBarWidth = 192;
	level.teamProgressBarTextY = 8; // 155;
	level.teamProgressBarFontSize = 1.65;

	if ( GetDvar( #"ui_score_bar" ) == "" )
		setDvar( "ui_score_bar", 0 );

	setDvar( "ui_generic_status_bar", 0 );

	if ( level.splitscreen )
	{
		level.lowerTextYAlign = "BOTTOM";
		level.lowerTextY = -42;
		level.lowerTextFontSize = 1.4;
	}
	else
	{
		level.lowerTextYAlign = "CENTER";
		level.lowerTextY = 70;
		level.lowerTextFontSize = 2;
	}
}


showClientScoreBar( time )
{
	self notify ( "showClientScoreBar" );
	self endon ( "showClientScoreBar" );
	self endon ( "death" );
	self endon ( "disconnect" );
	
	self setClientDvar( "ui_score_bar", 1 );
	wait ( time );
	self setClientDvar( "ui_score_bar", 0 );
}


showClientGenericMessageBar( time, message )
{
	self notify ( "showClientGenericMessageBar" );
	self endon ( "showClientGenericMessageBar" );
	self endon ( "disconnect" );
	
	if ( isDefined( time ) && isDefined( message ) )
	{
		self setClientDvar( "ui_generic_status_bar", 1 );
		self setClientDvar( "generic_status_bar_message", message );
		wait ( time );
		self setClientDvar( "ui_generic_status_bar", 0 );
	}
	else
	{
		self setClientDvar( "ui_generic_status_bar", 0 );
	}
}


fontPulseInit()
{
	self.baseFontScale = self.fontScale;
	self.maxFontScale = self.fontScale * 2;
	self.inFrames = 3;
	self.outFrames = 5;
}


fontPulse(player)
{
	self notify ( "fontPulse" );
	self endon ( "fontPulse" );
	self endon( "death" );
	
	player endon("disconnect");
	player endon("joined_team");
	player endon("joined_spectators");
	
	scaleRange = self.maxFontScale - self.baseFontScale;
	
	while ( self.fontScale < self.maxFontScale )
	{
		self.fontScale = min( self.maxFontScale, self.fontScale + (scaleRange / self.inFrames) );
		wait 0.05;
	}
		
	while ( self.fontScale > self.baseFontScale )
	{
		self.fontScale = max( self.baseFontScale, self.fontScale - (scaleRange / self.outFrames) );
		wait 0.05;
	}
}

fadeToBlackForXSec( startwait, blackscreenwait, fadeintime, fadeouttime )
{
	//Init wait
	wait( startwait );
	
	//Displays black screen
	if( !isdefined(self.blackscreen) )
		self.blackscreen = newclienthudelem( self );
	
	self.blackscreen.x = 0;
	self.blackscreen.y = 0; 
	self.blackscreen.horzAlign = "fullscreen";
	self.blackscreen.vertAlign = "fullscreen";
	self.blackscreen.foreground = false;
	self.blackscreen.hidewhendead = false;
	self.blackscreen.hidewheninmenu = true;

	self.blackscreen.sort = 50; 
	self.blackscreen SetShader( "black", 640, 480 ); 
	self.blackscreen.alpha = 0; 
	
	//Fade in
	if( fadeintime>0 )
		self.blackscreen FadeOverTime( fadeintime ); 
	self.blackscreen.alpha = 1; 
	wait( fadeintime );
	if( !isdefined(self.blackscreen) )
		return;		//hudelem was deleted during this wait 
	
	//Wait at black screen for a set time
	wait( blackscreenwait );
	if( !isdefined(self.blackscreen) )
		return;		//hudelem was deleted during this wait 
	
	//Fade out
	if( fadeouttime>0 )
		self.blackscreen FadeOverTime( fadeouttime ); 
	self.blackscreen.alpha = 0; 
	wait( fadeouttime );

	//Cleanup hud element
	if( isdefined(self.blackscreen) )			
	{
		self.blackscreen destroy();
		self.blackscreen = undefined;
	}
}
