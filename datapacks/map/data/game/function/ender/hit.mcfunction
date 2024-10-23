execute as @s[tag=ender] unless entity @e[type=minecraft:ender_pearl,scores={ID=0}] positioned ^ ^ ^ run summon minecraft:fireball ~ ~ ~ {Motion:[0.0,-1.0,0.0]}
execute as @s[tag=ender] unless entity @e[type=minecraft:ender_pearl,scores={ID=0}] positioned ^ ^ ^ run summon minecraft:slime ~ ~-0.9 ~ {NoAI:1,Size:0,Invulnerable:1}
#execute as @s[tag=ender] unless entity @e[type=minecraft:ender_pearl,scores={ID=0}] positioned ^ ^ ^ run execute as @e[type=endermite,distance=..2,tag=!grounded] at @s run data merge entity @s {Motion:[0.0,0.1,0.0]}
#summon creeper ~ ~ ~ {Fuse:0,ingited:1,ExplosionRadius:1}
effect give @p minecraft:levitation 1 13 true
scoreboard players set @s noLev 6
scoreboard players set @s noCol 5
execute as @s[tag=ender] at @s unless entity @e[type=minecraft:ender_pearl,scores={ID=0}] if entity @e[type=endermite,distance=..2,tag=!grounded,scores={freeze=..1}] run effect clear @p minecraft:levitation
execute as @s[tag=ender] at @s unless entity @e[type=minecraft:ender_pearl,scores={ID=0}] if entity @e[type=endermite,distance=..2,tag=!grounded,scores={freeze=..1}] run effect give @p minecraft:levitation 1 0 true
execute as @s[tag=ender] at @s unless entity @e[type=minecraft:ender_pearl,scores={ID=0}] if entity @e[type=endermite,distance=..2,tag=!grounded,scores={freeze=..1}] run scoreboard players set @s noLev 3
function game:player/getdir
function game:player/wallmove
tag @s remove ender

team join redNC @s[team=red]
team join blueNC @s[team=blue]