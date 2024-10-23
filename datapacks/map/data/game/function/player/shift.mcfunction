xp add @s -1 levels

scoreboard players add @s sneakT 0
#scoreboard players add @s[scores={sneakT=5..}] sneakT 1
scoreboard players add @s[scores={shift=1..,sneakCool=0}] sneakT 1
scoreboard players set @s[scores={shift=..0}] sneakT 0
#attribute @s[scores={sneakT=5..}] minecraft:knockback_resistance base set 1.0
scoreboard players set @s shift 0

scoreboard players add @s sneakCool 0
scoreboard players remove @s[scores={sneakCool=1..}] sneakCool 1

scoreboard players set @s[tag=noscharge] sneakT 0

execute as @s[scores={sneakT=7..}] at @s run function game:slam/hit
xp add @s[scores={sneakT=7..}] 80 levels
scoreboard players set @s[scores={sneakT=7..}] sneakCool 100
xp set @s[scores={sneakT=7..}] 557 points
scoreboard players set @s[scores={sneakT=7..}] sneakT 0

xp set @s[scores={sneakT=1..8}] 80 levels
xp set @s[scores={sneakCool=1..}] 80 levels
xp set @s[scores={sneakT=1}] 80 points
xp set @s[scores={sneakT=2}] 160 points
xp set @s[scores={sneakT=3}] 240 points
xp set @s[scores={sneakT=4}] 320 points
xp set @s[scores={sneakT=5}] 400 points
xp set @s[scores={sneakT=6}] 480 points
xp set @s[scores={sneakT=7}] 557 points

scoreboard players set .temp .data 557
scoreboard players operation .temp .data *= @s sneakCool
scoreboard players operation .temp .data /= 100 .Num

execute as @s[scores={sneakCool=1..}] store result storage minecraft:macro input.xp int 1 run scoreboard players get .temp .data
execute as @s[scores={sneakCool=1..}] run function game:player/macro_xp with storage minecraft:macro input

#xp set @s[scores={sneakCool=1..9}] 55 points
#xp set @s[scores={sneakCool=10..18}] 110 points
#xp set @s[scores={sneakCool=19..27}] 165 points
#xp set @s[scores={sneakCool=28..36}] 220 points
#xp set @s[scores={sneakCool=37..45}] 275 points
#xp set @s[scores={sneakCool=46..54}] 330 points
#xp set @s[scores={sneakCool=55..63}] 385 points
#xp set @s[scores={sneakCool=64..72}] 440 points
#xp set @s[scores={sneakCool=73..81}] 495 points
#xp set @s[scores={sneakCool=82..}] 557 points

xp set @s 0 levels

execute as @s[scores={sneakT=4}] at @s run playsound minecraft:block.note_block.snare master @a ~ ~ ~ 1 0
execute as @s[scores={sneakT=4}] at @s run playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 1 2