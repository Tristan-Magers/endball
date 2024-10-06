execute store result score @s xPos run data get entity @s Pos[0] 1000
execute store result score @s yPos run data get entity @s Pos[1] 1000
execute store result score @s zPos run data get entity @s Pos[2] 1000
tp @s ^ ^ ^-.1
execute store result score @s xPos2 run data get entity @s Pos[0] 1000
execute store result score @s yPos2 run data get entity @s Pos[1] 1000
execute store result score @s zPos2 run data get entity @s Pos[2] 1000
tp @s ^ ^ ^.1
scoreboard players operation @s xPos -= @s xPos2
scoreboard players operation @s yPos -= @s yPos2
scoreboard players operation @s zPos -= @s zPos2