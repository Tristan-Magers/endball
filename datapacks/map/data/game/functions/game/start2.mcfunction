kill @e[type=minecraft:endermite]
execute positioned -15.0 -51.0 -25.0 run function game:game/summonmite
scoreboard players set @e[type=minecraft:endermite] freeze 60

item replace entity @a hotbar.0 with wooden_hoe{display:{Name:'{"text":" ","italic":false}'},Unbreakable:1b}

clear @a lime_bed
clear @a cyan_bed
clear @a gray_bed
clear @a black_bed
item replace entity @a[tag=ingame] hotbar.2 with minecraft:black_bed{display:{Name:'{"text":"Spawn (right-click to teleport)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}

scoreboard players set @a[tag=ingame] bedcharge 0

scoreboard players set @a[scores={enderC=1..}] enderT 0
clear @a[scores={enderC=2}] ender_pearl 1

scoreboard players set @a batLV 1

scoreboard players set .newender .data 0

title @a actionbar [{"text":"","color":"gray"},{"text":"","color":"dark_gray"}]

item replace entity @s hotbar.8 with minecraft:potion{display:{Name:'{"text":"Leave Game","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
