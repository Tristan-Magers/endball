#
item replace entity @a armor.chest with minecraft:air
item replace entity @a armor.legs with minecraft:air
item replace entity @a armor.feet with minecraft:air

#
scoreboard players set Blue score 0
scoreboard players set Red score 0

scoreboard objectives setdisplay sidebar score

tag @a remove teamred
tag @a remove teamblue

tag @a remove ingame

#
team leave @a

scoreboard players set .players.red .data 0
scoreboard players set .players.blue .data 0

#join set players
team join red @a[tag=joinred,team=]
team join blue @a[tag=joinblue,team=]

execute as @a[team=red] run scoreboard players add .players.red .data 1
execute as @a[team=blue] run scoreboard players add .players.blue .data 1

#join random players
function game:game/addonerandom
function game:game/addonerandom
function game:game/addonerandom
function game:game/addonerandom
function game:game/addonerandom
function game:game/addonerandom
function game:game/addonerandom
function game:game/addonerandom

#teleport players
tp @a[team=red] -15.0 -56.00 -34.0 0 0
tp @a[team=blue] -15.0 -56.00 -16.0 180 0

tag @a[team=red] add ingame
tag @a[team=blue] add ingame

function game:game/start2

item replace entity @a[team=red] hotbar.7 with minecraft:red_dye[item_name='{"text":"Red Team","italic":false,"color":"red"}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]
item replace entity @a[team=blue] hotbar.7 with minecraft:blue_dye[item_name='{"text":"Blue Team","italic":false,"color":"aqua"}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]
item replace entity @a hotbar.8 with minecraft:potion[item_name='{"text":"Leave Game","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]

# adjust for differences in first ball
clear @a black_bed
scoreboard players set @a bedcharge 1000

scoreboard players set @e[type=minecraft:endermite] freeze 36

# first setup
clear @a ender_pearl
scoreboard players set @a enderT 75

gamemode adventure @a

setblock -16 -38 -29 minecraft:air

kill @e[tag=specmark]
execute as @e[type=endermite] at @s run summon minecraft:armor_stand ~10 -52 ~ {Silent:1,Tags:["specmark"],Invulnerable:1,Small:1b,Invisible:1}

gamemode spectator @a[team=,tag=!ingame,gamemode=adventure]

effect clear @a[tag=ingame] minecraft:weakness