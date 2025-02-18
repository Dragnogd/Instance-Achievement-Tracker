--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...
local L = core.L

------------------------------------------------------
---- Liberation of Undermine
------------------------------------------------------
core._2769 = {}
core._2769.Events = CreateFrame("Frame")

function core._2769:VexieAndTheGeargrinders()
    --Defeat Vexie and the Geargrinders after crashing a bike into the following objects in the Liberation of Undermine on Normal difficulty or higher.

    --TODO: Achievement tracking?
end

function core._2769:CauldronOfCarnage()
    --Defeat the Cauldron of Carnage while suffering from Hubris after drinking "Fireproof" Punch and "Shockproof" Soda in Liberation of Undermine on Normal difficulty or higher.

    --https://www.wowhead.com/ptr-2/spell=1219684/hubris (BUFF)
    --TODO: Check all plaeyrs at start of fight who need achievement if they have Hubris?
    --TODO: Are the potions drunk before the start of the fight?
end

function core._2769:SprocketmongerLockenstock()
    --Defeat Sprocketmonger Lockenstock without being struck by Blazing Beam, Rocket Barrage, Mega Magnetize, Jumbo Void Beam, or Void Barrage on Normal difficulty or higher.

    --Personal achievement

    --Blazing Beam (Line of fire, stand in to get periodic damage)
    --SPELL_PERIODIC_DAMAGE,Creature-0-5770-2769-2977-230358-000013F63B,"Beam Turret",0xa48,0x0,Player-5764-003F6606,"Quin-Fyrakk-TR",0x512,0x0,1216415,"Blazing Beam",0x4,Player-5764-003F6606,0000000000000000,3231481,9952588,7117,84492,31576,0,0,0,0,2500000,2500000,0,-411.82,876.79,2428,1.6994,644,3440482,4192540,-1,4,0,0,382275,nil,nil,nil,ST
    --https://www.wowhead.com/ptr-2/spell=1216414/blazing-beam
    --https://www.wowhead.com/ptr-2/spell=1216415/blazing-beam

    --Rocket Barrage (Do not get hit by rocket)
    --SPELL_DAMAGE,Creature-0-5770-2769-3273-230360-00000AAEFD,"Rocket Launcher",0xa48,0x0,Player-5764-003EB485,"?????????-Fyrakk-TR",0x514,0x0,1216661,"Rocket Barrage",0x4,Player-5764-003EB485,0000000000000000,3306269,6712882,24830,69265,66315,1686,300,0,0,2341418,2500000,0,-422.39,890.33,2428,4.1454,631,2548914,3147250,-1,4,0,0,0,nil,nil,nil,ST
    --https://www.wowhead.com/ptr-2/spell=1216661/rocket-barrage

    --Mega Magnetize (Don't get stunned?)
    --SPELL_AURA_APPLIED,Creature-0-5770-2769-3273-236256-00000AB03E,"Mega Magnet",0xa48,0x0,Player-5764-003F3896,"??????-Fyrakk-TR",0x514,0x0,1216503,"Mega Magnetize",0x1,DEBUFF
    --https://www.wowhead.com/ptr-2/spell=1216503/mega-magnetize

    --Jumbo Void Beam (Don't got into effect on floor)
    --Spell Damage (not in combat log?)
    --https://www.wowhead.com/ptr-2/spell=1216679/jumbo-void-beam

    --Void Barrage
    --SPELL_DAMAGE,Creature-0-5770-2769-3273-231903-00000AB01C,"Void Cannon",0xa48,0x0,Player-5764-00092BFC,"???????????????-Fyrakk-TR",0x10514,0x0,1216706,"Void Barrage",0x20,Player-5764-00092BFC,0000000000000000,4677352,7465840,84620,12360,59078,787,200,0,1,633,1300,0,-444.51,901.70,2428,3.8573,631,2089934,2517800,-1,32,0,0,0,nil,nil,nil,ST
    --https://www.wowhead.com/ptr-2/spell=1216706/void-barrage
end

function core._2769:MugZeeHeadsOfSecurity()
    --Defeat Mug'Zee, Heads of Security while all players have slept with the fishes in Liberation of Undermine on Normal difficulty or higher.

    --TODO: Track all players have following debuff
    --https://www.wowhead.com/ptr-2/spell=1216669/slept-with-the-fishes
end

function core._2769:OneArmedBandit()
    --Defeat the One-Armed Bandit after activating one Chip Defense Machine in Liberation of Undermine on Normal difficulty or higher.
end

function core._2769:RikReverb()
    --Defeat Rik Reverb after activating both D.I.S.C.O.s during Hype Hustle in the Liberation of Undermine on Normal difficulty or higher.

    --https://www.wowhead.com/ptr-2/spell=1218446/d-i-s-c-o
    --https://www.wowhead.com/ptr-2/spell=1218440/d-i-s-c-o
end

function core._2769:StixBunkjunker()
    --Defeat Stix Bunkjunker after absorbing or incinerating every Garbage Pile created by Electromagnetic Sorting before the next cast of Electromagnetic Sorting in Liberation of Undermine on Normal difficulty or higher.

    --Blizzard tracking?
    --Can we track how many garabage piles there are. Is it fixed amount or random each time?
end

function core._2769:ChromeKingGallywix()
    --Defeat Chrome King Gallywix after Giga Bomb Detonation-ing 3 Giga Controls during a single Giga Coils in Liberation of Undermine on Normal difficulty or higher.


end
