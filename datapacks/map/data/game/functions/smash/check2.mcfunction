tag @s add me

tag @e remove hit1
tag @e remove hit2

summon minecraft:marker ~ ~ ~ {Tags:["kill","check"]}

tp @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] @s
execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ 0

execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ~ ~ ~ positioned ^ ^ ^998.9 run tag @e[tag=!me,distance=..999] add hit1

execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^ ^2 run particle minecraft:dripping_obsidian_tear

execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^ ^1.8 run tag @e[tag=hit1,distance=..2.0] add hit2
execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^-0.2 ^1.8 run tag @e[tag=hit1,distance=..1.9] add hit2
execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^-0.4 ^1.8 run tag @e[tag=hit1,distance=..1.9] add hit2
execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^-0.6 ^1.8 run tag @e[tag=hit1,distance=..1.9] add hit2
execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^-0.8 ^1.8 run tag @e[tag=hit1,distance=..1.9] add hit2
execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^0.2 ^1.8 run tag @e[tag=hit1,distance=..1.9] add hit2
execute as @e[type=minecraft:marker,tag=check,limit=1,sort=nearest] at @s positioned ^ ^ ^1.8 run execute at @s positioned ^ ^0.4 ^1.8 run tag @e[tag=hit1,distance=..1.9] add hit2

tag @e[tag=hit1,tag=hit2,type=endermite] add move
tag @a[tag=hit1,tag=hit2] add move2

tag @s remove me

kill @e[tag=check]