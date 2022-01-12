attribute @s minecraft:generic.knockback_resistance base set 0.1
#attribute @s minecraft:generic.knockback_resistance base set 0.48

tag @s[nbt={OnGround:1b}] add grounded

# statuses
data merge entity @s {Lifetime:1}
effect give @s minecraft:resistance 999999 10 true
effect give @s minecraft:instant_health 999999 10 true
effect give @s minecraft:slow_falling 999999 10 true

team join mite @s

effect give @s minecraft:glowing 999999 10 true

# particles
execute as @s[scores={flamePart=1..}] at @s run particle minecraft:flame ~ ~0.1 ~ 0.1 0.1 0.1 0.1 1 force
execute as @s[scores={flamePart=1..}] at @s run particle minecraft:flame ~ ~0.1 ~ 0 0 0 0 1 force

execute as @s[scores={greenPart=1..}] at @s run particle minecraft:scrape ~ ~0.1 ~ 0 0 0 0 1 force

scoreboard players remove @s[scores={flamePart=1..}] flamePart 1
scoreboard players remove @s[scores={greenPart=1..}] greenPart 1

# get Motion
execute store result score @s[tag=revmot2] xMot run data get entity @s Motion[0] 1000
execute store result score @s[tag=revmot2] yMot run data get entity @s Motion[1] 1000
execute store result score @s[tag=revmot2] zMot run data get entity @s Motion[2] 1000

# adjust upwards Vol
tag @s[scores={yMot=..-10}] add downfall
execute store result entity @s[scores={yMot=10..},tag=downfall] Motion[1] double .00095 run scoreboard players get @s yMot
tag @s[scores={yMot=10..},tag=downfall] remove downfall

# double smashed

scoreboard players set @s[tag=smashed2] xMot 0
scoreboard players set @s[tag=smashed2] yMot 1000
scoreboard players set @s[tag=smashed2] zMot 0

execute store result entity @s[tag=smashed2] Motion[0] double .001 run scoreboard players get @s xMot
execute store result entity @s[tag=smashed2] Motion[1] double .001 run scoreboard players get @s yMot
execute store result entity @s[tag=smashed2] Motion[2] double .001 run scoreboard players get @s zMot

tag @s[tag=smashed2] remove downfall
tag @s remove smashed
tag @s remove smashed2

# hit wall
execute at @s[tag=revmot2] if block ~ -57 ~ minecraft:air run tag @s add revmot
execute at @s unless block ~ -57 ~ minecraft:air run tag @s add revmot2

execute at @s[scores={xMot=..-1}] unless block ~1 -57 ~ minecraft:air run tag @s add xWall
execute at @s[scores={xMot=1..}] unless block ~-1 -57 ~ minecraft:air run tag @s add xWall

execute at @s[scores={zMot=..-1}] unless block ~ -57 ~1 minecraft:air run tag @s add zWall
execute at @s[scores={zMot=1..}] unless block ~ -57 ~-1 minecraft:air run tag @s add zWall

scoreboard players operation @s[tag=revmot] xMot *= .Num -1
scoreboard players operation @s[tag=revmot] yMot *= .Num -1
scoreboard players operation @s[tag=revmot] zMot *= .Num -1

tp @s[y=-58,dy=-100] ~ -55 ~

tag @s[tag=revmot] remove revmot2
tag @s remove revmot

execute store result entity @s[tag=!revmot2,tag=xWall] Motion[0] double .0015 run scoreboard players get @s xMot
execute store result entity @s[tag=!revmot2,tag=zWall] Motion[2] double .0015 run scoreboard players get @s zMot

execute store result entity @s[tag=!revmot2,tag=!xWall,tag=!zWall] Motion[0] double .0015 run scoreboard players get @s xMot
execute store result entity @s[tag=!revmot2,tag=!xWall,tag=!zWall] Motion[2] double .0015 run scoreboard players get @s zMot

execute store result entity @s[tag=!revmot2,scores={office=4..}] Motion[0] double .0015 run scoreboard players get @s xMot
execute store result entity @s[tag=!revmot2,scores={office=4..}] Motion[2] double .0015 run scoreboard players get @s zMot

tag @s[tag=revmot2] remove xWall
tag @s[tag=revmot2] remove zWall

scoreboard players add @s[tag=!revmot2] office 1
scoreboard players set @s[tag=revmot2] office 0

#tp @s ~ ~ ~ facing entity @p
#execute as @s at @s run tp @s ~ ~ ~ ~-90 0

# scoring
tag @s[x=-16.0,y=-57,z=-40.5,dz=0.65,dx=1,dy=1.2] add win
tag @s[x=-16.0,y=-57,z=-10.5,dz=-0.65,dx=1,dy=1.2] add win

execute as @s[x=-16.0,y=-57,z=-40.5,dz=0.65,dx=1,dy=1.2] run scoreboard players add Blue score 1
execute as @s[x=-16.0,y=-57,z=-10.5,dz=-0.65,dx=1,dy=1.2] run scoreboard players add Red score 1

execute as @s[tag=win] if score Red score < .maxscore .data if score Blue score < .maxscore .data run execute as @s[tag=win] positioned -15.0 -55 -25.0 run function game:start2

execute as @s unless entity @a[tag=ingame] run function game:end

execute as @s[tag=win] if score Red score >= .maxscore .data run function game:end
execute as @s[tag=win] if score Blue score >= .maxscore .data run function game:end

execute as @s[tag=win] at @s run clear @a white_bed
execute as @s[tag=win] at @s run item replace entity @a[tag=ingame] hotbar.2 with minecraft:white_bed{display:{Name:'{"text":"Spawn (right-click to teleport)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}

execute as @s[tag=win] at @s run playsound minecraft:entity.zombie_villager.cure master @a ~ ~ ~ 1 2
execute as @s[tag=win] at @s run playsound minecraft:item.trident.thunder master @a ~ ~ ~ 0.2 2

kill @s[tag=win]