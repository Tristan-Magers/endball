execute store result score @s yPos run data get entity @s Pos[1] 1000
scoreboard players set @s yMot 0

#facing
effect give @s minecraft:slow_falling 100 100 true
execute as @s at @s run tp @s ~ ~ ~ facing entity @e[type=endermite,limit=1]

#get closer (y)
execute as @s[x_rotation=85..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~
execute as @s[x_rotation=80..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~
execute as @s[x_rotation=75..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~
execute as @s[x_rotation=70..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~
execute as @s[x_rotation=65..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~
execute as @s[x_rotation=60..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~
execute as @s[x_rotation=55..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~
execute as @s[x_rotation=50..89] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~-0.03 ~

execute as @s[x_rotation=0..40] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~
execute as @s[x_rotation=0..35] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~
execute as @s[x_rotation=0..30] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~
execute as @s[x_rotation=0..25] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~
execute as @s[x_rotation=0..20] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~
execute as @s[x_rotation=0..15] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~
execute as @s[x_rotation=0..10] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~
execute as @s[x_rotation=0..5] at @s unless entity @e[type=minecraft:endermite,distance=..7] run tp @s ~ ~0.03 ~

#get closer (x/z)
execute as @s at @s positioned ~ ~ ~-1000.5 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players remove @s zMot 100
execute as @s at @s positioned ~ ~ ~1000.5 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players add @s zMot 100

execute as @s at @s positioned ~ ~ ~-1005 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players remove @s zMot 100
execute as @s at @s positioned ~ ~ ~1005 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players add @s zMot 100

execute as @s at @s positioned ~-1005 ~ ~ if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players remove @s xMot 100
execute as @s at @s positioned ~1005 ~ ~ if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players add @s xMot 100

execute as @s at @s positioned ~ ~ ~-1010 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players remove @s zMot 150
execute as @s at @s positioned ~ ~ ~1010 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players add @s zMot 150

execute as @s at @s positioned ~-1010 ~ ~ if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players remove @s xMot 150
execute as @s at @s positioned ~1010 ~ ~ if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players add @s xMot 150

execute as @s at @s positioned ~ ~ ~-1015 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players remove @s zMot 200
execute as @s at @s positioned ~ ~ ~1015 if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players add @s zMot 200

execute as @s at @s positioned ~-1015 ~ ~ if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players remove @s xMot 200
execute as @s at @s positioned ~1015 ~ ~ if entity @e[type=minecraft:endermite,distance=..1000] run scoreboard players add @s xMot 200

#set motion
execute as @s at @s unless entity @e[type=minecraft:endermite,distance=..7] run execute store result entity @s Motion[0] double .0007 run scoreboard players get @s xMot
execute as @s at @s unless entity @e[type=minecraft:endermite,distance=..7] run execute store result entity @s Motion[1] double .0007 run scoreboard players get @s yMot
execute as @s at @s unless entity @e[type=minecraft:endermite,distance=..7] run execute store result entity @s Motion[2] double .0007 run scoreboard players get @s zMot

scoreboard players set @s xMot 0
scoreboard players set @s yMot 0
scoreboard players set @s zMot 0