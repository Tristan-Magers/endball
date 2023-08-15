execute as @s at @s positioned ~ ~0.6 ~ run tag @e[type=endermite,distance=..2.3] add move
execute as @s at @s positioned ~ ~0.3 ~ run tag @e[type=endermite,distance=..2.3] add move
execute as @s at @s positioned ~ ~ ~ run tag @e[type=endermite,distance=..2.3] add move
execute as @s at @s positioned ~ ~-0.3 ~ run tag @e[type=endermite,distance=..2.3] add move
execute as @s at @s positioned ~ ~-0.6 ~ run tag @e[type=endermite,distance=..2.3] add move
execute as @s at @s positioned ~ ~-0.9 ~ run tag @e[type=endermite,distance=..2.3] add move

function game:phys/hit/slamhit

execute if entity @e[tag=move] run playsound minecraft:entity.ravager.attack master @a ~ ~ ~ 1 2

tag @e[tag=move] remove move
