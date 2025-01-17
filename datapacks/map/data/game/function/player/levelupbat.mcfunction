clear @s[scores={woodHoe=1..}] wooden_hoe
item replace entity @s[scores={woodHoe=1..}] hotbar.0 with stone_hoe[item_name='{"text":"Level 1 (right-click to Smash)","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
execute as @s[scores={woodHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 0.6
scoreboard players set @s[scores={woodHoe=1..}] batCool 40
scoreboard players set @s[scores={woodHoe=1..}] batIFrames 7
scoreboard players set @s[scores={woodHoe=1..}] batLV 2
scoreboard players set @s woodHoe 0

clear @s[scores={stoneHoe=1..}] stone_hoe
item replace entity @s[scores={stoneHoe=1..}] hotbar.0 with iron_hoe[item_name='{"text":"Level 2 (right-click to Smash)","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
execute as @s[scores={stoneHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 0.8
scoreboard players set @s[scores={stoneHoe=1..}] batCool 36
scoreboard players set @s[scores={stoneHoe=1..},tag=charged_bat] batCool 36
scoreboard players set @s[scores={stoneHoe=1..}] batIFrames 7
scoreboard players set @s[scores={stoneHoe=1..}] batLV 3
scoreboard players set @s stoneHoe 0

clear @s[scores={ironHoe=1..}] stone_hoe
item replace entity @s[scores={ironHoe=1..}] hotbar.0 with netherite_hoe[item_name='{"text":"Level 3 (right-click to Smash)","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
execute as @s[scores={ironHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 1.1
scoreboard players set @s[scores={ironHoe=1..}] batCool 32
scoreboard players set @s[scores={ironHoe=1..},tag=charged_bat] batCool 34
scoreboard players set @s[scores={ironHoe=1..}] batIFrames 7
scoreboard players set @s[scores={ironHoe=1..}] batLV 4
scoreboard players set @s ironHoe 0

clear @s[scores={netherHoe=1..}] netherite_hoe
item replace entity @s[scores={netherHoe=1..}] hotbar.0 with golden_hoe[item_name='{"text":"Level 4 (right-click to Smash)","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
execute as @s[scores={netherHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 1.5
scoreboard players set @s[scores={netherHoe=1..}] batCool 30
scoreboard players set @s[scores={netherHoe=1..},tag=charged_bat] batCool 32
scoreboard players set @s[scores={netherHoe=1..}] batIFrames 7
scoreboard players set @s[scores={netherHoe=1..}] batLV 5
scoreboard players set @s netherHoe 0

scoreboard players set @s chargeDelay -10
scoreboard players set @s chargeLV 0
tag @s remove charge_buffer
tag @s remove started_charge

tag @s remove charged_bat
