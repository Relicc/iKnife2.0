#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

doThreads()
{
self thread setClass();
self thread throwingknife();
}

setClass()
{
 self endon ("disconnect");
 self endon ("death");
 
	self takeallweapons();
	self _clearperks();
	wait 0.1;
	self giveweapon("deserteaglegold_mp",0,false); 
	wait 0.1; 
	self switchtoweapon("deserteaglegold_mp");
	self setWeaponAmmoClip ( "deserteaglegold_mp", 0, "right" );
	self setWeaponAmmoStock("deserteaglegold_mp", 0);
	givePerk( "marathon", true );
	givePerk( "commando", true );
	givePerk( "lightweight", true );
}

throwingknife()
{
self maps\mp\perks\_perks::givePerk( "throwingknife_mp" );
self setWeaponAmmoClip("throwingknife_mp", 1); 
}

givePerk( perk, pro )// didnt code this!!
{
	_perk = "";
	_proPerk = "";
	switch( perk )
	{
		case "marathon": _perk = "marathon"; _proPerk = "fastmantle"; break;
		case "sleight of hand": _perk = "fastreload"; _proPerk = "quickdraw"; break;
		case "scavenger": _perk = "scavenger"; _proPerk = "extraammo"; break;
		case "bling": _perk = "bling"; _proPerk = "secondarybling"; break;
		case "one man army": _perk = "onemanarmy"; _proPerk = "omaquickchange"; break;
		case "stopping power": _perk = "bulletdamage"; _proPerk = "armorpiercing"; break;
		case "lightweight": _perk = "lightweight"; _proPerk = "fastsprintrecovery"; break;
		case "hardline": _perk = "hardline"; _proPerk = "spygame"; break;
		case "cold-blooded": _perk = "coldblooded"; _proPerk = "gpsjammer"; break;
		case "danger close": _perk = "explosivedamage"; _proPerk = "armorpiercing"; break;
		case "commando": _perk = "extendedmelee"; _proPerk = "falldamage"; break;
		case "steady aim": _perk = "bulletaccuracy"; _proPerk = "steelnerves"; break;
		case "scrambler": _perk = "localjammer"; _proPerk = "delaymine"; break;
		case "ninja": _perk = "heartbreaker"; _proPerk = "quieter"; break;
		case "sitrep": _perk = "detectexplosive"; _proPerk = "selectivehearing"; break;
		case "last stand": _perk = "pistoldeath"; _proPerk = "laststandoffhand"; break;
	}

	self maps\mp\perks\_perks::givePerk( "specialty_"+ _perk );
	if(pro)
		self maps\mp\perks\_perks::givePerk( "specialty_"+ _proPerk );
}
