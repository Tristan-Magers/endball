scoreboard players operation @e[type=minecraft:ender_pearl] ID -= @s ID

execute if entity @e[type=minecraft:ender_pearl,scores={ID=0}] run tag @s add ender
execute as @s[tag=ender] unless entity @e[type=minecraft:ender_pearl,scores={ID=0}] run function game:ender/hit

scoreboard players operation @e[type=minecraft:ender_pearl] ID += @s ID