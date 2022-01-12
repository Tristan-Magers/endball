summon marker ~ ~ ~ {Tags:["det","kill"]}
tp @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] @p
execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run tp @s ~ ~ ~ ~ 0
execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run function game:phys/getdir

execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run execute store result entity @e[tag=move,limit=1,sort=nearest] Motion[0] double .015 run scoreboard players get @s xPos
execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run execute store result entity @e[tag=move,limit=1,sort=nearest] Motion[2] double .015 run scoreboard players get @s zPos

tag @e[tag=move,tag=smashed] add smashed2
tag @e[tag=move] add smashed

tag @e[tag=det] add done
kill @e[tag=det]