scoreboard players set .2 .data 2
scoreboard players set .newendermax .data 800

scoreboard players set .playercount .data 0
execute as @a[tag=ingame] at @s run scoreboard players add .playercount .data 1

scoreboard players set .endercount .data 0
execute as @e[type=minecraft:endermite] at @s run scoreboard players add .endercount .data 1

scoreboard players operation .maxender .data = .playercount .data
scoreboard players operation .maxender .data /= .2 .data
scoreboard players add .maxender .data 0

execute if score .maxender .data > .endercount .data run scoreboard players add .newender .data 1

execute if score .newender .data > .newendermax .data run execute positioned -15.0 -48.5 -25.0 run function game:game/summonmite
execute if score .newender .data > .newendermax .data run scoreboard players set @e[type=minecraft:endermite,tag=!grounded] freeze 40
execute if score .newender .data > .newendermax .data run title @a title {"text":"New Ball!"}
execute if score .newender .data > .newendermax .data run scoreboard players set .newender .data 0