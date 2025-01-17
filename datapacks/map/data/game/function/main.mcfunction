effect give @a minecraft:resistance 999999 3 true
effect give @a minecraft:instant_health 999999 3 true
effect give @a minecraft:jump_boost 999999 0 true
effect give @a[gamemode=adventure] saturation 999999 5 true
effect give @a[gamemode=adventure,tag=!ingame] weakness 3 5 true
item replace entity @a weapon.offhand with minecraft:carrot_on_a_stick

gamemode adventure @a[gamemode=survival]

#spectator
tag @a[gamemode=spectator] remove ingame
execute as @a[gamemode=spectator,scores={shift=1..}] run kill @s
execute as @a[gamemode=spectator,scores={shift=1..}] run gamemode adventure
execute as @e[tag=specmark] at @s run function game:spec/specmark
execute as @a[gamemode=spectator] run spectate @e[tag=specmark,limit=1] @s

#
scoreboard players set @a[scores={smash_delay=1..}] click 0
scoreboard players remove @a[scores={smash_delay=1..}] smash_delay 1

# pearl explosion
tp @e[type=slime] ~ -1000 ~
kill @e[type=fireball]

# new endermite
function game:mite/new_mite_manager

# players
execute as @a[tag=ingame] at @s run function game:player/main

# endermite
execute as @e[type=minecraft:endermite] at @s run function game:mite/main

# playerID
scoreboard players add @a ID 0
execute as @a[scores={ID=0}] run function game:upid

# enderpearls
execute as @a[scores={endThrow=1..}] at @s run function game:ender/throw
execute as @a at @s run function game:ender/check

# freeze entity
execute as @e[scores={freeze=1..}] at @s run tp @s @s
scoreboard players remove @e[scores={freeze=0..}] freeze 1

# remove levitation
scoreboard players remove @a[scores={noLev=0..}] noLev 1
execute as @a[scores={noLev=0}] at @s run effect clear @s minecraft:levitation

# item management
execute as @e[type=item] run data merge entity @s {PickupDelay:0}

# join and spawn players
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ light_gray_stained_glass run tag @s remove join
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ light_gray_stained_glass run tag @s remove joinred
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ light_gray_stained_glass run tag @s remove joinblue

execute as @a[gamemode=adventure] at @s if block ~ -40 ~ white_stained_glass run tag @s remove join
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ white_stained_glass run tag @s remove joinred
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ white_stained_glass run tag @s remove joinblue

execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:blue_stained_glass run tag @s add joinblue
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:cyan_stained_glass run tag @s add joinblue
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:red_stained_glass run tag @s add joinred
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:pink_stained_glass run tag @s add joinred
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:purple_stained_glass run tag @s add join
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:magenta_stained_glass run tag @s add join
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:purple_stained_glass run tag @s remove joinblue
execute as @a[gamemode=adventure] at @s if block ~ -40 ~ minecraft:magenta_stained_glass run tag @s remove joinred
#
execute as @a[tag=!ingame] at @s if block ~ -40 ~ light_gray_stained_glass run title @s actionbar [{"text":"UNJOINED"}]
execute as @a[tag=!ingame] at @s if block ~ -40 ~ white_stained_glass run title @s actionbar [{"text":"UNJOINED"}]
execute as @a[tag=!ingame] at @s if block ~ -40 ~ red_stained_glass run title @s actionbar [{"text":"Selected "},{"text":"Team Red","color":"#FF3021"}]
execute as @a[tag=!ingame] at @s if block ~ -40 ~ pink_stained_glass run title @s actionbar [{"text":"Selected "},{"text":"Team Red","color":"#FF3021"}]
execute as @a[tag=!ingame] at @s if block ~ -40 ~ blue_stained_glass run title @s actionbar [{"text":"Selected "},{"text":"Team Blue","color":"aqua"}]
execute as @a[tag=!ingame] at @s if block ~ -40 ~ cyan_stained_glass run title @s actionbar [{"text":"Selected "},{"text":"Team Blue","color":"aqua"}]
execute as @a[tag=!ingame] at @s if block ~ -40 ~ purple_stained_glass run title @s actionbar [{"text":"Selected "},{"text":"Random Team","color":"light_purple"}]
execute as @a[tag=!ingame] at @s if block ~ -40 ~ magenta_stained_glass run title @s actionbar [{"text":"Selected "},{"text":"Random Team","color":"light_purple"}]

tag @a[tag=joinred] remove join
tag @a[tag=joinblue] remove join

#
scoreboard players set @a shift 0

#
kill @e[type=item]