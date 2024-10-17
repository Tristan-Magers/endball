kill @e[type=minecraft:endermite]
execute positioned -15.0 -52.2 -25.0 run function game:game/summonmite
scoreboard players set @e[type=minecraft:endermite] freeze 60

item replace entity @a hotbar.0 with wooden_hoe[item_name='{"text":" ","italic":false}',unbreakable={}]

clear @a lime_bed
clear @a cyan_bed
clear @a gray_bed
clear @a black_bed
item replace entity @a[tag=ingame] hotbar.2 with minecraft:black_bed[item_name='{"italic":true,"text":"Spawn (right-click to teleport)"}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]

scoreboard players set @a[tag=ingame] bedcharge 0

scoreboard players set @a[scores={enderC=1..}] enderT 0
clear @a[scores={enderC=2}] ender_pearl 1

scoreboard players set @a batLV 1

scoreboard players set .newender .data 0

title @a actionbar [{"text":"","color":"gray"},{"text":"","color":"dark_gray"}]

item replace entity @s hotbar.8 with minecraft:potion[item_name='{"text":"Leave Game","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]
