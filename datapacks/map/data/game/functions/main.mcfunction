effect give @a minecraft:resistance 999999 3 true
effect give @a minecraft:jump_boost 999999 0 true
effect give @a[gamemode=adventure] saturation 999999 5 true
effect give @a[gamemode=adventure,tag=!ingame] weakness 3 5 true
item replace entity @a weapon.offhand with minecraft:carrot_on_a_stick

#gamemode adventure @a[gamemode=survival]

tp @e[type=slime] ~ -1000 ~
kill @e[type=fireball]

#
execute as @a[tag=ingame] at @s run function game:player/main

#
execute as @e[type=minecraft:endermite] at @s run function game:mite/main

#
scoreboard players add @a ID 0
execute as @a[scores={ID=0}] run function game:upid

#
execute as @a[scores={endThrow=1..}] at @s run function game:ender/throw
execute as @a at @s run function game:ender/check

#
execute as @e[scores={freeze=1..}] at @s run tp @s @s
scoreboard players remove @e[scores={freeze=1..}] freeze 1

#
scoreboard players remove @a[scores={noLev=0..}] noLev 1
execute as @a[scores={noLev=0}] at @s run effect clear @s minecraft:levitation

#
execute as @e[type=item] run data merge entity @s {PickupDelay:0}