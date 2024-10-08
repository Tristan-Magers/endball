scoreboard objectives remove ID
scoreboard objectives remove freeze
scoreboard objectives remove noLev
scoreboard objectives remove endThrow

#
scoreboard objectives add x dummy
scoreboard objectives add y dummy
scoreboard objectives add z dummy

scoreboard objectives add dx dummy
scoreboard objectives add dy dummy
scoreboard objectives add dz dummy

scoreboard objectives add xMot dummy
scoreboard objectives add yMot dummy
scoreboard objectives add zMot dummy

scoreboard objectives add xPos dummy
scoreboard objectives add yPos dummy
scoreboard objectives add zPos dummy

scoreboard objectives add xPos2 dummy
scoreboard objectives add yPos2 dummy
scoreboard objectives add zPos2 dummy

scoreboard objectives add ID dummy
scoreboard players set .Mark ID 1

scoreboard objectives add noLev dummy
scoreboard objectives add freeze dummy

scoreboard objectives add endThrow minecraft.used:minecraft.ender_pearl

scoreboard objectives add click minecraft.used:minecraft.carrot_on_a_stick

scoreboard objectives add smashInvul dummy

scoreboard objectives add woodHoe minecraft.used:minecraft.wooden_hoe
scoreboard objectives add stoneHoe minecraft.used:minecraft.stone_hoe
scoreboard objectives add ironHoe minecraft.used:minecraft.iron_hoe
scoreboard objectives add netherHoe minecraft.used:minecraft.netherite_hoe
scoreboard objectives add goldHoe minecraft.used:minecraft.golden_hoe

scoreboard objectives add batLV dummy
scoreboard objectives add batCool dummy
scoreboard objectives add batIFrames dummy

scoreboard objectives add hurt dummy

scoreboard objectives add office dummy

scoreboard objectives add enderT dummy
scoreboard objectives add enderC dummy

scoreboard objectives add shift minecraft.custom:minecraft.sneak_time
scoreboard objectives add sneakT dummy
scoreboard objectives add sneakCool dummy

scoreboard objectives add damage minecraft.custom:minecraft.damage_dealt

scoreboard objectives add chargeDelay dummy
scoreboard objectives add chargeLV dummy

scoreboard objectives add smash_delay dummy

scoreboard objectives add clickPause dummy
scoreboard objectives add clickPauseDelay dummy

scoreboard objectives add knockbackLV dummy
scoreboard objectives add knockbackCool dummy
scoreboard objectives add knockbackActive dummy

scoreboard objectives add flamePart dummy
scoreboard objectives add greenPart dummy

scoreboard objectives add food food

scoreboard objectives add noCol dummy

scoreboard objectives add -1 dummy
scoreboard players set .Num -1 -1
scoreboard players set 100 .Num 100

scoreboard objectives add .Num dummy
scoreboard objectives add .data dummy
scoreboard players set .maxscore .data 7
scoreboard players set .maxscore .ratio 10000
scoreboard players set .maxscore .ratio2 9999

scoreboard objectives add score dummy {"text":"Score","color":"gold"}

#
team add mite
team modify mite color light_purple

team add red
team modify red color red

team add blue
team modify blue color blue

team modify red friendlyFire false
team modify blue friendlyFire false


team add redNC
team modify redNC color red

team add blueNC
team modify blueNC color blue

team modify redNC collisionRule never
team modify blueNC collisionRule never

#
gamerule showDeathMessages false