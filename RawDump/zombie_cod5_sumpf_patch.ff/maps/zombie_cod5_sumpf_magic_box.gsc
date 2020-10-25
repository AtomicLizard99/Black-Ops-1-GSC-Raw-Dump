#include common_scripts\utility; 
#include maps\_utility;
#include maps\_zombiemode_utility;
#include maps\zombie_cod5_sumpf_trap_pendulum;

magic_box_init()
{
		level thread waitfor_flag_open_chest_location("nw_magic_box");
		level thread waitfor_flag_open_chest_location("ne_magic_box");
		level thread waitfor_flag_open_chest_location("se_magic_box");
		level thread waitfor_flag_open_chest_location("sw_magic_box");

		level thread zombie_zipline_clip();
		
		level.pandora_fx_func = ::swamp_pandora_fx_func;
}
//-------------------------------------------------------------------------------
// DCS: monitor box move to change box fx.
//-------------------------------------------------------------------------------
swamp_pandora_fx_func( )
{
	self.pandora_light = Spawn( "script_model", self.chest_origin.origin );
	self.pandora_light.angles = self.chest_origin.angles + (-90, 0, 0);
	self.pandora_light SetModel( "tag_origin" );
	if(self.script_noteworthy == "start_chest")
	{
		PlayFXOnTag(level._effect["lght_marker"], self.pandora_light, "tag_origin");
	}
	else
	{
		PlayFXOnTag(level._effect["lght_marker_old"], self.pandora_light, "tag_origin");
	}		
}
//-------------------------------------------------------------------------------

waitfor_flag_open_chest_location(which)
{
     wait(3);
		     
     switch(which)
     {
     case "nw_magic_box":
         flag_wait("nw_magic_box");
         
			// JV initialize the swinging concrete block
			maps\zombie_cod5_sumpf_trap_pendulum::initPendulumTrap();	
				
			//JV pendulum cannot be activated until this debris is cleared
			penBuyTrigger = getentarray("pendulum_buy_trigger","targetname");
			if ( level.mutators["mutator_noTraps"] )
			{
				maps\_zombiemode_traps::disable_traps(penBuyTrigger);
			}
			else
			{
				array_thread (penBuyTrigger, maps\zombie_cod5_sumpf_trap_pendulum::penThink);
			}
			
         break;
          
     case "ne_magic_box":
         flag_wait("ne_magic_box");
          
				// JV initialize the easy access routes
				level thread maps\zombie_cod5_sumpf_zipline::initZipline();
			
				
         break;
          
     case "se_magic_box":
	      flag_wait("se_magic_box");
         break;
          
     case "sw_magic_box":
         flag_wait("sw_magic_box");
         break;
          
     default:
          return;
     
     }
     
     // JMA - here is where we actually randomize perks and weapons when the first blockable is unlocked
	if( !level.mutators["mutator_noPerks"] && isDefined(level.randomize_perks) && level.randomize_perks == false)
	{
		maps\zombie_cod5_sumpf_perks::randomize_vending_machines();

		level.vending_model_info = [];			
		level.vending_model_info[level.vending_model_info.size] = "zombie_vending_jugg_on";     
		level.vending_model_info[level.vending_model_info.size] = "zombie_vending_doubletap_on";
		level.vending_model_info[level.vending_model_info.size] = "zombie_vending_revive_on";   
		level.vending_model_info[level.vending_model_info.size] = "zombie_vending_sleight_on";
			
		level.randomize_perks = true;
	}
     
	//adding flag waits for after vending machines are randomized
	switch(which)
	{
	case "nw_magic_box":
		flag_wait("northwest_building_unlocked");
		//maps\zombie_cod5_sumpf_zone_management::add_area_dog_spawners("nw_perk_hut_dog_spawners");
		maps\zombie_cod5_sumpf_perks::vending_randomization_effect(0);
		break;
	case "ne_magic_box":
		flag_wait("northeast_building_unlocked");
		//maps\zombie_cod5_sumpf_zone_management::add_area_dog_spawners("ne_perk_hut_dog_spawners");
		maps\zombie_cod5_sumpf_perks::vending_randomization_effect(1);
		break;
	case "se_magic_box":
		flag_wait("southeast_building_unlocked");
		//maps\zombie_cod5_sumpf_zone_management::add_area_dog_spawners("se_perk_hut_dog_spawners");
		maps\zombie_cod5_sumpf_perks::vending_randomization_effect(2);
		break;
	case "sw_magic_box":
		flag_wait("southwest_building_unlocked");
		//maps\zombie_cod5_sumpf_zone_management::add_area_dog_spawners("sw_perk_hut_dog_spawners");
		maps\zombie_cod5_sumpf_perks::vending_randomization_effect(3);	
		break;
     }
}

zombie_zipline_clip()
{
	PreCacheModel("collision_wall_128x128x10");
	PreCacheModel("collision_geo_64x64x128");

	collision = spawn("script_model", (10712, 1615, -464));
	collision setmodel("collision_wall_128x128x10");
	collision.angles = (0, 71.2, 0);
	collision Hide();
	
	collision2 = spawn("script_model", (10818, 1599, -464));
	collision2 setmodel("collision_wall_128x128x10");
	collision2.angles = (0, 75.6, 0);
	collision2 Hide();
	
	collision3 = spawn("script_model", (9984, 1444, -473));
	collision3 setmodel("collision_geo_64x64x128");
	collision3.angles = (0, 0, 0);
	collision3 Hide();
	
	collision4 = spawn("script_model", (11285, 2996, -519));
	collision4 setmodel("collision_wall_128x128x10");
	collision4.angles = (0, 345, 0);
	collision4 Hide();	
}
