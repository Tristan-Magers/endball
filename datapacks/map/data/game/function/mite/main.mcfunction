attribute @s minecraft:knockback_resistance base set 0.1
attribute @s minecraft:scale base set 1.1
attribute @s minecraft:explosion_knockback_resistance base set 0.09
#attribute @s minecraft:knockback_resistance base set 0.48

tag @s[nbt={OnGround:1b},tag=!grounded] add grounded

#fall
execute as @s[scores={freeze=0}] at @s run data merge entity @s {Motion:[0.0,-0.065,0.0]}
execute as @s[scores={freeze=0}] at @s run particle minecraft:cloud ~ ~.2 ~ .1 .1 .1 .2 60 force
execute as @s[scores={freeze=1..}] at @s run particle minecraft:crit ~ ~.2 ~ .1 .2 .1 .1 1 force
#execute as @s[scores={freeze=1..}] at @s run tag @s remove grounded

effect give @s[scores={freeze=1..}] minecraft:invisibility 1 10 true
effect clear @s[scores={freeze=..0}] minecraft:invisibility

execute as @s[scores={freeze=..0}] at @s run data merge entity @s {Invulnerable:0}
execute as @s[scores={freeze=1..}] at @s run data merge entity @s {Invulnerable:1}

# statuses
data merge entity @s {Lifetime:1}
effect give @s minecraft:resistance 999999 3 true
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

#spectator
scoreboard players operation @e[tag=specmark,limit=1] xMot += @s xMot
scoreboard players operation @e[tag=specmark,limit=1] yMot += @s yMot
scoreboard players operation @e[tag=specmark,limit=1] zMot += @s zMot

# adjust upwards Vol
tag @s[scores={yMot=..-10}] add downfall
execute store result entity @s[scores={yMot=10..},tag=downfall] Motion[1] double .00095 run scoreboard players get @s yMot
tag @s[scores={yMot=10..},tag=downfall] remove downfall

# double smashed
execute as @s[tag=smashed2] at @s run playsound minecraft:item.shield.block master @a ~ ~ ~ 1 0.5
execute as @s[tag=smashed2] at @s run particle minecraft:campfire_cosy_smoke ~ ~0.3 ~ 0.3 0.3 0.3 0.1 10 force
tag @s[tag=smashed2] remove grounded

scoreboard players set @s[tag=smashed2] xMot 0
scoreboard players set @s[tag=smashed2] yMot 750
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

execute as @s[tag=grounded,tag=revmot2,scores={freeze=..0}] at @s run data merge entity @s {Invulnerable:0}
execute as @s[tag=grounded,tag=!revmot2,scores={freeze=..0}] at @s run data merge entity @s {Invulnerable:1}

execute store result entity @s[tag=!revmot2,tag=xWall] Motion[0] double .0018 run scoreboard players get @s xMot
execute store result entity @s[tag=!revmot2,tag=zWall] Motion[2] double .0018 run scoreboard players get @s zMot

execute store result entity @s[tag=!revmot2,tag=!xWall,tag=!zWall] Motion[0] double .0018 run scoreboard players get @s xMot
execute store result entity @s[tag=!revmot2,tag=!xWall,tag=!zWall] Motion[2] double .0018 run scoreboard players get @s zMot

execute store result entity @s[tag=!revmot2,scores={office=4..}] Motion[0] double .0018 run scoreboard players get @s xMot
execute store result entity @s[tag=!revmot2,scores={office=4..}] Motion[2] double .0018 run scoreboard players get @s zMot

tag @s[tag=revmot2] remove xWall
tag @s[tag=revmot2] remove zWall

scoreboard players add @s[tag=!revmot2] office 1
scoreboard players set @s[tag=revmot2] office 0

#tp @s ~ ~ ~ facing entity @p
#execute as @s at @s run tp @s ~ ~ ~ ~-90 0

# scoring
tag @s[x=-16.2,y=-57,z=-40.0,dz=0.3,dx=1.4,dy=1.1] add win
tag @s[x=-16.2,y=-57,z=-11.3,dz=0.3,dx=1.4,dy=1.1] add win

execute as @s[x=-16.2,y=-57,z=-40.0,dz=0.3,dx=1.4,dy=1.1] run scoreboard players add Blue score 1
execute as @s[x=-16.2,y=-57,z=-11.3,dz=0.3,dx=1.4,dy=1.1] run scoreboard players add Red score 1

execute as @s[x=-16.2,y=-57,z=-40.0,dz=0.3,dx=1.4,dy=1.1] as @a[team=blue] at @s run playsound minecraft:entity.experience_orb.pickup master @s
execute as @s[x=-16.2,y=-57,z=-11.3,dz=0.3,dx=1.4,dy=1.1] as @a[team=red] at @s run playsound minecraft:entity.experience_orb.pickup master @s

execute as @s[tag=win] if score Red score < .maxscore .data if score Blue score < .maxscore .data run execute as @s[tag=win] positioned -15.0 -55 -25.0 run function game:game/start2

execute as @s unless entity @a[tag=ingame] run function game:end

execute as @s[tag=win] if score Red score >= .maxscore .data run function game:end
execute as @s[tag=win] if score Blue score >= .maxscore .data run function game:end

execute as @s[tag=win] at @s run tag @a[tag=ingame] add goal
execute as @s[tag=win] at @s run scoreboard players set @a[tag=ingame] knockbackLV 4

execute as @s[tag=win] at @s run scoreboard players set @a[tag=ingame] chargeDelay 35
execute as @s[tag=win] at @s run scoreboard players set @a[tag=ingame] chargeLV 0

execute as @s[tag=win] at @s run scoreboard players set @a[tag=ingame] bat_off 45
execute as @s[tag=win] at @s run clear @a[tag=ingame] wooden_hoe
execute as @s[tag=win] at @s run item replace entity @a[tag=ingame] hotbar.0 with minecraft:breeze_rod[item_name='{"text":" ","italic":false}',unbreakable={}]

#execute as @s[tag=win] at @s run item replace entity @a[tag=ingame] armor.chest with minecraft:netherite_chestplate[unbreakable={}]
#execute as @s[tag=win] at @s run item replace entity @a[tag=ingame] armor.legs with minecraft:netherite_leggings[unbreakable={}]
#execute as @s[tag=win] at @s run item replace entity @a[tag=ingame] armor.feet with minecraft:netherite_boots[unbreakable={}]

execute as @s[tag=win] at @s run effect give @a[tag=ingame] speed 2 3 true

execute as @s[tag=win] at @s run playsound minecraft:entity.zombie_villager.cure master @a ~ ~ ~ 1 2
execute as @s[tag=win] at @s run playsound minecraft:item.trident.thunder master @a ~ ~ ~ 0.2 2

scoreboard players remove @s[scores={smashInvul=0..}] smashInvul 1

tag @s remove smashed_hard

kill @s[tag=win]

