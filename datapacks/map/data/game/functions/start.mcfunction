scoreboard players set Blue score 0
scoreboard players set Red score 0

scoreboard objectives setdisplay sidebar score

tag @a remove ingame
tag @a remove join

execute as @a at @s if block ~ -33 ~ minecraft:white_carpet run tag @s add join

team leave @a

team join red @r[tag=join,team=]
team join blue @r[tag=join,team=]
team join red @r[tag=join,team=]
team join blue @r[tag=join,team=]
team join red @r[tag=join,team=]
team join blue @r[tag=join,team=]
team join red @r[tag=join,team=]
team join blue @r[tag=join,team=]
team join red @r[tag=join,team=]
team join blue @r[tag=join,team=]

tp @a[team=red] -15.0 -56.00 -34.0 0 0
tp @a[team=blue] -15.0 -56.00 -16.0 180 0

tag @a[team=red] add ingame
tag @a[team=blue] add ingame

function game:start2

clear @a ender_pearl
scoreboard players set @a enderT 75

gamemode adventure @a

setblock -16 -32 -29 minecraft:air