tag @s add me

execute at @e[type=minecraft:endermite,limit=1,sort=nearest] run summon marker ~ ~ ~ {Tags:["det","kill"]}
execute as @e[tag=det,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p[tag=me]
execute as @e[tag=det,type=marker,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ 0
execute as @e[tag=det,type=marker,limit=1,sort=nearest] at @s run function game:phys/getdir

execute as @e[tag=det,type=marker,limit=1,sort=nearest] at @s run execute store result entity @e[tag=move,limit=1,sort=nearest] Motion[0] double -.007 run scoreboard players get @s xPos
execute as @e[tag=det,type=marker,limit=1,sort=nearest] at @s run execute store result entity @e[tag=move,limit=1,sort=nearest] Motion[2] double -.007 run scoreboard players get @s zPos

kill @e[tag=det]

tag @e[tag=move,tag=smashed] add smashed2
tag @e[tag=move] add smashed

tag @s remove me

summon minecraft:marker ~ ~ ~ {Tags:["kill","part"]}

tp @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] @p
execute as @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ 0

execute as @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] at @s run function game:slam/particle

playsound minecraft:entity.generic.extinguish_fire master @a ~ ~ ~ 1 2
playsound minecraft:entity.generic.death master @a ~ ~ ~ 1 0
playsound minecraft:entity.ghast.shoot master @a ~ ~ ~ 0.5 1.5