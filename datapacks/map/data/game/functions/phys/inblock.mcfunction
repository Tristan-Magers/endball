tag @s remove in

execute if block ~ ~ ~ air run tag @s add in

execute as @s[tag=!in] run function game:phys/detailin

execute as @s[tag=soulsend] at @s run execute if block ~ ~ ~ barrier run tag @s add bar

execute as @s[tag=pshot,scores={shotT=2..}] at @s run execute as @e[tag=!isthrow,tag=hittest,distance=..2] at @s positioned ~-.5 ~ ~-.5 run tag @e[dx=0,dz=0,dy=1,tag=pshot,distance=..5] remove in
execute as @s[tag=lshot,scores={shotT=5..}] at @s run execute as @e[tag=!isthrow,tag=hittest,distance=..2] at @s positioned ~-.5 ~ ~-.5 run tag @e[dx=0,dz=0,dy=1,tag=lshot,distance=..5] remove in

execute as @s[tag=lshot] at @s run execute as @e[tag=!isthrow,tag=hittest2,distance=..1.5] at @s run tag @e[tag=lshot,distance=..1.5] remove in
execute as @s[tag=pshot] at @s run execute as @e[tag=!isthrow,tag=hittest2,distance=..1.5] at @s run tag @e[tag=pshot,distance=..1.5] remove in

execute as @s[tag=pshot,scores={shotT=2..}] at @s run execute as @e[tag=!isthrow,type=player,gamemode=adventure,distance=..2] at @s positioned ~-.5 ~ ~-.5 run tag @e[dx=0,dz=0,dy=1,tag=pshot,distance=..5] remove in
execute as @s[tag=lshot,scores={shotT=5..}] at @s run execute as @e[tag=!isthrow,type=player,gamemode=adventure,distance=..2] at @s positioned ~-.5 ~ ~-.5 run tag @e[dx=0,dz=0,dy=1,tag=lshot,distance=..5] remove in

execute as @s[tag=hurpro] at @s positioned ~ ~ ~ run execute as @e[tag=hittest,tag=!isthrow,distance=..5] at @s positioned ~-.7 ~-1.7 ~-.7 run tag @e[dx=0.4,dz=0.4,dy=1.9,tag=hurpro,distance=..5] remove in
execute as @s[tag=hurpro] at @s positioned ~ ~ ~ run execute as @e[tag=hittest,distance=..5] at @s positioned ~-.7 ~-1.7 ~-.7 if entity @e[dx=0.4,dz=0.4,dy=1.9,tag=hurpro,distance=..5] run tag @s add gethit
execute as @s[tag=hurpro] at @s positioned ~ ~ ~ run execute as @e[tag=hittest2,tag=!isthrow,distance=..1.5] at @s positioned ~ ~ ~ run tag @e[tag=hurpro,distance=..1.5] remove in
execute as @s[tag=hurpro] at @s positioned ~ ~ ~ run execute as @e[tag=hittest2,distance=..1.5] at @s positioned ~ ~ ~ if entity @e[tag=hurpro,distance=..1.5] run tag @s add gethit