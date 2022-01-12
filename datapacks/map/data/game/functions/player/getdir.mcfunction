summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,CustomName:"\"GD\"",Invulnerable:1,Invisible:1,Small:0,Marker:1}
tp @e[name=GD] @p
execute as @e[name=GD] at @s run tp @s ~ ~1 ~
execute store result score @s x run data get entity @e[name=GD,limit=1] Pos[0] -20000
execute store result score @s y run data get entity @e[name=GD,limit=1] Pos[1] -20000
execute store result score @s z run data get entity @e[name=GD,limit=1] Pos[2] -20000
execute as @e[name=GD] at @s run tp @s ^ ^ ^.001
execute store result score @s dx run data get entity @e[name=GD,limit=1] Pos[0] -20000
execute store result score @s dy run data get entity @e[name=GD,limit=1] Pos[1] -20000
execute store result score @s dz run data get entity @e[name=GD,limit=1] Pos[2] -20000
kill @e[name=GD]
scoreboard players operation @s x -= @s dx
scoreboard players operation @s y -= @s dy
scoreboard players operation @s z -= @s dz
