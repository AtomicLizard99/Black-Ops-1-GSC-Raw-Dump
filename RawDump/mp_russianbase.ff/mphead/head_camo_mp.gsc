// THIS FILE IS AUTOGENERATED, DO NOT MODIFY
// Asset: head_camo_mp
// Convert Time: 10/03/2010 12:20:56

main()
{
	level.cac_attributes[ "mobility" ][ "head_camo_mp" ] = 0;
	level.cac_attributes[ "armor_bullet" ][ "head_camo_mp" ] = 0;
	level.cac_attributes[ "armor_explosive" ][ "head_camo_mp" ] = 0;

	level.cac_assets[ "usa_sog" ][ "head_camo_mp" ] = "c_usa_sog_mp_head_2";
	level.cac_assets[ "vtn_nva" ][ "head_camo_mp" ] = "c_vtn_nva_mp_head_2";
	level.cac_assets[ "usa_cia" ][ "head_camo_mp" ] = "c_usa_cia_mp_head_2";
	level.cac_assets[ "usa_ciawin" ][ "head_camo_mp" ] = "c_usa_ciawin_mp_head_2";
	level.cac_assets[ "rus_spet" ][ "head_camo_mp" ] = "c_rus_spet_mp_head_2";
	level.cac_assets[ "rus_spetwin" ][ "head_camo_mp" ] = "c_rus_spetwin_mp_head_2";
	level.cac_assets[ "cub_rebels" ][ "head_camo_mp" ] = "c_cub_rebels_mp_head_2";
	level.cac_assets[ "cub_tropas" ][ "head_camo_mp" ] = "c_cub_tropas_mp_head_2";


	level.cac_functions[ "precache" ][ "head_camo_mp" ] = ::precache;
	level.cac_functions[ "set_head_model" ][ "head_camo_mp" ] = ::set_head_model;
	level.cac_functions[ "set_specialties" ][ "head_camo_mp" ] = ::set_specialties;
}

precache( faction )
{
	model = level.cac_assets[ faction ][ "head_camo_mp" ];
	PrecacheModel( model );

}

set_head_model( faction )
{
	model = level.cac_assets[ faction ][ "head_camo_mp" ];
	self Attach( model, "", true );
}

set_specialties()
{
}