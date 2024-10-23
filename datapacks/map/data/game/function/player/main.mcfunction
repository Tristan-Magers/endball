#
attribute @s minecraft:movement_speed base set 0.1
attribute @s[scores={chargeLV=1..}] minecraft:movement_speed base set 0.09
attribute @s[scores={stunned=1..}] minecraft:movement_speed base set 0.075
attribute @s minecraft:entity_interaction_range base set 3.2
attribute @s minecraft:attack_knockback base set 0.06
attribute @s minecraft:sneaking_speed base set 0.64

scoreboard players remove @s[scores={stunned=0..}] stunned 1

#
scoreboard players remove @s[scores={bat_off=0..}] bat_off 1
item replace entity @s[scores={bat_off=0}] hotbar.0 with wooden_hoe[item_name='{"text":" ","italic":false}',unbreakable={}]

#
execute at @s if block ~0.3 ~ ~ minecraft:light_blue_terracotta run tp @s ~-0.5 ~ ~
execute at @s if block ~-0.3 ~ ~ minecraft:light_blue_terracotta run tp @s ~0.5 ~ ~
execute at @s if block ~ ~ ~0.3 minecraft:light_blue_terracotta run tp @s ~ ~ ~-0.5
execute at @s if block ~ ~ ~-0.3 minecraft:light_blue_terracotta run tp @s ~ ~ ~0.5
execute at @s if block ~ ~1.6 ~ minecraft:barrier run tp @s ~ ~-1.6 ~

#
scoreboard players set @s[scores={clickPause=..0}] clickPauseDelay 5
scoreboard players remove @s[scores={clickPause=1..,click=..0}] clickPauseDelay 1
scoreboard players set @s[scores={clickPause=1..,clickPauseDelay=..0,click=..0}] clickPause 0
scoreboard players set @s[scores={clickPause=1..,click=1..}] clickPauseDelay 5
scoreboard players set @s[scores={clickPause=1..}] click 0
scoreboard players remove @s clickPause 1

#
attribute @s minecraft:attack_speed base set 1000
attribute @s minecraft:attack_damage base set 10

# lev while offstage
effect give @s[y=-59,dy=-100,gamemode=adventure] levitation 1 7

# you glow lol
effect give @s minecraft:glowing 999999 10 true

# shifttick tag (are you shifting this tick?) (best solution to issues with the scoreboard objectives)
execute anchored eyes positioned ^ ^ ^ unless entity @s[distance=..1.62] run tag @s remove shifttick
execute anchored eyes positioned ^ ^ ^ run tag @s[distance=..1.62] add shifttick
tag @s[tag=!shifttick] remove noscharge

# knockback res armor
function game:player/armor

# no Collision teams (after enderpearls to prevent issues)
team join red @s[scores={noCol=0},team=redNC]
team join blue @s[scores={noCol=0},team=blueNC]
scoreboard players remove @s[scores={noCol=0..}] noCol 1

# team tags (tags allow for temp team switching)
tag @s remove teamblue
tag @s remove teamred

tag @s[team=redNC] add teamred
tag @s[team=red] add teamred
tag @s[team=blueNC] add teamblue
tag @s[team=blue] add teamblue

tag @s add loner
execute as @s[tag=teamred] at @s if entity @a[tag=teamred,distance=0.1..] run tag @s remove loner
execute as @s[tag=teamblue] at @s if entity @a[tag=teamblue,distance=0.1..] run tag @s remove loner

# ender pearl reloading
execute store result score @s enderC run clear @s ender_pearl 0
scoreboard players add @s[scores={enderC=..1}] enderT 1

clear @s[scores={enderT=140..}] ender_pearl

item replace entity @s[scores={enderT=140..,enderC=0}] hotbar.1 with ender_pearl
item replace entity @s[scores={enderT=140..,enderC=1}] hotbar.1 with ender_pearl 2

scoreboard players set @s[scores={enderT=140..}] enderT 0
scoreboard players set @s[scores={enderC=2..}] enderT 0

# bed upgrade
scoreboard players add @s bedcharge 1
item replace entity @s[scores={bedcharge=60}] hotbar.2 with minecraft:gray_bed[item_name='{"italic":true,"text":"Spawn (right-click to teleport)"}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
item replace entity @s[scores={bedcharge=120}] hotbar.2 with minecraft:cyan_bed[item_name='{"italic":true,"text":"Spawn (right-click to teleport)"}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
item replace entity @s[scores={bedcharge=180}] hotbar.2 with minecraft:lime_bed[item_name='{"italic":true,"text":"Spawn (right-click to teleport)"}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
item replace entity @s[scores={bedcharge=320}] hotbar.2 with minecraft:yellow_bed[item_name='{"italic":true,"text":"Spawn (right-click to teleport)"}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"attack_speed",amount:100,operation:"add_value"}]]
#clear @s[scores={bedcharge=1000..}] black_bed

# shift hit
function game:player/shift

# bat use
#execute as @s[scores={click=0},nbt={SelectedItem:{id:"minecraft:breeze_rod"}},tag=started_charge] at @s run function game:player/charge
#execute as @s[scores={click=1..,chargeLV=4..},nbt={SelectedItem:{id:"minecraft:breeze_rod"}},tag=started_charge] at @s run scoreboard players set @s chargeDelay -1
#execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:breeze_rod"}},tag=!started_charge] at @s run function game:player/charge
execute as @s[scores={click=0},nbt={SelectedItem:{id:"minecraft:wooden_hoe"}},tag=started_charge] at @s run function game:player/charge
execute as @s[scores={click=1..,chargeLV=4..},nbt={SelectedItem:{id:"minecraft:wooden_hoe"}},tag=started_charge] at @s run scoreboard players set @s chargeDelay -1
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:wooden_hoe"}},tag=!started_charge] at @s run function game:player/charge
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run function game:smash/hit

scoreboard players remove @s chargeDelay 1
scoreboard players set @s[scores={chargeDelay=..-1,chargeLV=5..}] damage 1
tag @s[scores={chargeDelay=..-1,chargeLV=5..}] add charged_bat
scoreboard players set @s[scores={chargeDelay=..-1,chargeLV=5..}] clickPause 5
scoreboard players set @s[scores={chargeDelay=..-1,chargeLV=5..9}] woodHoe 1
scoreboard players set @s[scores={chargeDelay=..-1,chargeLV=10..14}] stoneHoe 1
scoreboard players set @s[scores={chargeDelay=..-1,chargeLV=15..19}] ironHoe 1
scoreboard players set @s[scores={chargeDelay=..-1,chargeLV=20..}] netherHoe 1
#title @s[scores={chargeDelay=..-1,chargeLV=4..}] actionbar [{"text":"!! CHARGED !!","color":"white"},{"text":"","color":"dark_gray"}]
scoreboard players set @s[scores={chargeDelay=..-1}] chargeLV 0
#title @s[scores={chargeDelay=-1,batLV=..1}] actionbar [{"text":"","color":"gray"},{"text":"","color":"dark_gray"}]
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:breeze_rod"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] run tag @s remove charge_buffer
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:breeze_rod"}}] unless entity @s[nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] run tag @s remove started_charge

# bed use
function game:player/usebed

# degrade bat
function game:player/degradebat

# bat I frames (disable leveling bat)
scoreboard players set @s[scores={batIFrames=1..}] woodHoe 0
scoreboard players set @s[scores={batIFrames=1..}] stoneHoe 0
scoreboard players set @s[scores={batIFrames=1..}] ironHoe 0
scoreboard players set @s[scores={batIFrames=1..}] netherHoe 0
scoreboard players remove @s[scores={batIFrames=1..}] batIFrames 1

# bat level up
scoreboard players set @s[scores={damage=..0}] woodHoe 0
scoreboard players set @s[scores={damage=..0}] stoneHoe 0
scoreboard players set @s[scores={damage=..0}] ironHoe 0
scoreboard players set @s[scores={damage=..0}] netherHoe 0
execute if entity @s[scores={damage=1..}] run function game:player/levelupbat

tag @s remove degrade

# bat timer actionbar
scoreboard players add @s smash_delay 0

execute as @s[scores={chargeLV=1..}] at @s run function game:player/charge_timer
execute as @s[scores={batLV=2..,smash_delay=..0}] at @s run function game:player/battimer

# leave game
tag @s[scores={potion=1..}] remove ingame
team leave @s[scores={potion=1..}]
tp @s[scores={potion=1..}] -15.5 -39.0 -36.5 0 0
scoreboard players set @s potion 0

#
scoreboard players set @s damage 0