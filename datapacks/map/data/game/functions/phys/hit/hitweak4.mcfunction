summon marker ~ ~ ~ {Tags:["det","kill"]}
tp @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] @p
execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run tp @s ~ ~ ~ ~ 0
execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run function game:phys/getdir

execute as @e[tag=move] store result entity @s Motion[0] double .012 run scoreboard players get @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] xPos
execute as @e[tag=move] store result entity @s Motion[2] double .012 run scoreboard players get @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] zPos

tag @e[tag=move,tag=smashed] add smashed2
tag @e[tag=move] add smashed

tag @e[tag=det] add done
kill @e[tag=det]