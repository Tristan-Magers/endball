summon marker ^ ^ ^ {Tags:["det","kill"]}
execute as @s[tag=teamblue] as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run tp @s ~ ~ ~ facing entity @e[tag=teamblue,limit=1,distance=0.1..]
execute as @s[tag=teamred] as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run tp @s ~ ~ ~ facing entity @e[tag=teamred,limit=1,distance=0.1..]

execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run tp @s ~ ~ ~ ~ 0
execute as @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] at @s run function game:phys/getdir

execute as @e[tag=move] store result entity @s Motion[0] double .008 run scoreboard players get @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] xPos
execute as @e[tag=move] store result entity @s Motion[2] double .008 run scoreboard players get @e[tag=det,type=marker,limit=1,sort=nearest,tag=!done] zPos

tag @e[tag=move,tag=smashed] add smashed2
tag @e[tag=move] add smashed

tag @e[tag=det] add done
kill @e[tag=det]