effect give @s[y=-59,dy=-100,gamemode=adventure] levitation 1 7

effect give @s minecraft:glowing 999999 10 true

#
scoreboard players add @s knockbackActive 0
scoreboard players add @s knockbackLV 0

scoreboard players set @s[scores={knockbackCool=100..}] knockbackCool 100
scoreboard players remove @s[scores={knockbackCool=0..}] knockbackCool 1
scoreboard players set @s[scores={knockbackCool=0}] knockbackLV 0

scoreboard players remove @s[scores={knockbackActive=0..}] knockbackActive 1
scoreboard players set @s[scores={knockbackActive=0}] knockbackLV 0
scoreboard players set @s[scores={knockbackActive=0}] knockbackCool 0

execute store result score @s hurt run data get entity @s HurtTime 1
scoreboard players add @s[scores={hurt=10,knockbackLV=..3}] knockbackCool 55
scoreboard players add @s[scores={hurt=10,knockbackLV=..3}] knockbackLV 1

item replace entity @s[scores={hurt=10,knockbackLV=3}] armor.chest with minecraft:chainmail_chestplate{Unbreakable:1}
item replace entity @s[scores={hurt=10,knockbackLV=2}] armor.legs with minecraft:chainmail_leggings{Unbreakable:1}
item replace entity @s[scores={hurt=10,knockbackLV=1}] armor.feet with minecraft:chainmail_boots{Unbreakable:1}

scoreboard players set @s[scores={knockbackActive=-1,knockbackLV=4}] knockbackCool 120
scoreboard players set @s[scores={knockbackActive=-1,knockbackLV=4}] knockbackActive 70

execute as @s[scores={knockbackActive=70}] at @s run playsound minecraft:block.anvil.land master @a ~ ~ ~ 0.3 0
execute as @s[scores={knockbackActive=70}] at @s run playsound minecraft:block.anvil.land master @a ~ ~ ~ 0.5 1.4

effect give @s[scores={knockbackActive=70}] minecraft:speed 3 1 true
effect give @s[scores={knockbackActive=70}] minecraft:blindness 1

item replace entity @s[scores={knockbackActive=70}] armor.chest with minecraft:netherite_chestplate{Unbreakable:1}
item replace entity @s[scores={knockbackActive=70}] armor.legs with minecraft:netherite_leggings{Unbreakable:1}
item replace entity @s[scores={knockbackActive=70}] armor.feet with minecraft:netherite_boots{Unbreakable:1}

item replace entity @s[scores={knockbackCool=1}] armor.chest with minecraft:air
item replace entity @s[scores={knockbackCool=1}] armor.legs with minecraft:air
item replace entity @s[scores={knockbackCool=1}] armor.feet with minecraft:air

item replace entity @s[scores={knockbackActive=1}] armor.chest with minecraft:air
item replace entity @s[scores={knockbackActive=1}] armor.legs with minecraft:air
item replace entity @s[scores={knockbackActive=1}] armor.feet with minecraft:air

attribute @s[scores={knockbackActive=1..}] minecraft:generic.knockback_resistance base set 1.0
attribute @s[scores={knockbackActive=..0}] minecraft:generic.knockback_resistance base set 0.0

attribute @s[scores={knockbackLV=0}] minecraft:generic.armor base set 0
attribute @s[scores={knockbackLV=1}] minecraft:generic.armor base set 4
attribute @s[scores={knockbackLV=2}] minecraft:generic.armor base set 5
attribute @s[scores={knockbackLV=3}] minecraft:generic.armor base set 5
attribute @s[scores={knockbackLV=4}] minecraft:generic.armor base set 3

#
team join red @s[scores={noCol=0},team=redNC]
team join blue @s[scores={noCol=0},team=blueNC]
scoreboard players remove @s[scores={noCol=0..}] noCol 1

#
execute store result score @s enderC run clear @s ender_pearl 0
scoreboard players add @s[scores={enderC=..1}] enderT 1

clear @s[scores={enderT=140..}] ender_pearl

item replace entity @s[scores={enderT=140..,enderC=0}] hotbar.1 with ender_pearl
item replace entity @s[scores={enderT=140..,enderC=1}] hotbar.1 with ender_pearl 2

scoreboard players set @s[scores={enderT=140..}] enderT 0
scoreboard players set @s[scores={enderC=2..}] enderT 0

#
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run function game:smash/hit

execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:white_bed"}}] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~

tp @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:white_bed"}},team=redNC] -15.0 -56.00 -36.0 0 0
tp @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:white_bed"}},team=blueNC] -15.0 -56.00 -14.0 180 0
tp @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:white_bed"}},team=red] -15.0 -56.00 -36.0 0 0
tp @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:white_bed"}},team=blue] -15.0 -56.00 -14.0 180 0

execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:white_bed"}}] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~

clear @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:white_bed"}}] white_bed

scoreboard players set @s click 0

#
xp add @s -1 levels
scoreboard players remove @s[scores={batCool=-1..}] batCool 1

tag @s[scores={batCool=0}] add degrade

execute as @s[tag=degrade,scores={batLV=2..}] at @s run playsound minecraft:block.note_block.basedrum master @a ~ ~ ~ 0.7 0.3

item replace entity @s[tag=degrade,scores={batLV=2}] hotbar.0 with wooden_hoe{display:{Name:'{"text":" ","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
scoreboard players set @s[tag=degrade,scores={batLV=2}] batLV 1

item replace entity @s[tag=degrade,scores={batLV=3}] hotbar.0 with stone_hoe{display:{Name:'{"text":"Level 1 (right-click to Smash)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
scoreboard players set @s[tag=degrade,scores={batLV=3}] batCool 40
scoreboard players set @s[tag=degrade,scores={batLV=3}] batLV 2

item replace entity @s[tag=degrade,scores={batLV=4}] hotbar.0 with iron_hoe{display:{Name:'{"text":"Level 2 (right-click to Smash)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
scoreboard players set @s[tag=degrade,scores={batLV=4}] batCool 35
scoreboard players set @s[tag=degrade,scores={batLV=4}] batLV 3

item replace entity @s[tag=degrade,scores={batLV=5}] hotbar.0 with netherite_hoe{display:{Name:'{"text":"Level 3 (right-click to Smash)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
scoreboard players set @s[tag=degrade,scores={batLV=5}] batCool 30
scoreboard players set @s[tag=degrade,scores={batLV=5}] batLV 4

#
scoreboard players set @s[scores={batIFrames=1..}] woodHoe 0
scoreboard players set @s[scores={batIFrames=1..}] stoneHoe 0
scoreboard players set @s[scores={batIFrames=1..}] ironHoe 0
scoreboard players set @s[scores={batIFrames=1..}] netherHoe 0
scoreboard players remove @s[scores={batIFrames=1..}] batIFrames 1

#
clear @s[scores={woodHoe=1..}] wooden_hoe
item replace entity @s[scores={woodHoe=1..}] hotbar.0 with stone_hoe{display:{Name:'{"text":"Level 1 (right-click to Smash)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
execute as @s[scores={woodHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 0.6
scoreboard players set @s[scores={woodHoe=1..}] batCool 40
scoreboard players set @s[scores={woodHoe=1..}] batIFrames 7
scoreboard players set @s[scores={woodHoe=1..}] batLV 2
scoreboard players set @s woodHoe 0

clear @s[scores={stoneHoe=1..}] stone_hoe
item replace entity @s[scores={stoneHoe=1..}] hotbar.0 with iron_hoe{display:{Name:'{"text":"Level 2 (right-click to Smash)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
execute as @s[scores={stoneHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 0.8
scoreboard players set @s[scores={stoneHoe=1..}] batCool 36
scoreboard players set @s[scores={stoneHoe=1..}] batIFrames 7
scoreboard players set @s[scores={stoneHoe=1..}] batLV 3
scoreboard players set @s stoneHoe 0

clear @s[scores={ironHoe=1..}] stone_hoe
item replace entity @s[scores={ironHoe=1..}] hotbar.0 with netherite_hoe{display:{Name:'{"text":"Level 3 (right-click to Smash)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
execute as @s[scores={ironHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 1.1
scoreboard players set @s[scores={ironHoe=1..}] batCool 32
scoreboard players set @s[scores={ironHoe=1..}] batIFrames 7
scoreboard players set @s[scores={ironHoe=1..}] batLV 4
scoreboard players set @s ironHoe 0

clear @s[scores={netherHoe=1..}] netherite_hoe
item replace entity @s[scores={netherHoe=1..}] hotbar.0 with golden_hoe{display:{Name:'{"text":"Level 4 (right-click to Smash)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
execute as @s[scores={netherHoe=1..}] at @s run playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1 1.5
scoreboard players set @s[scores={netherHoe=1..}] batCool 30
scoreboard players set @s[scores={netherHoe=1..}] batIFrames 7
scoreboard players set @s[scores={netherHoe=1..}] batLV 5
scoreboard players set @s netherHoe 0

tag @s remove degrade

#
title @s[scores={batLV=2,batCool=40}] actionbar [{"text":"","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=38}] actionbar [{"text":"⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=36}] actionbar [{"text":"⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=34}] actionbar [{"text":"⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=32}] actionbar [{"text":"⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=30}] actionbar [{"text":"⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=28}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=26}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=24}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=22}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=20}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=18}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=16}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=14}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=12}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=10}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=08}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=06}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=04}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=02}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛","color":"dark_gray"}]
title @s[scores={batLV=2,batCool=01}] actionbar [{"text":"","color":"gray"},{"text":"","color":"dark_gray"}]

title @s[scores={batLV=3,batCool=40}] actionbar [{"text":"","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=38}] actionbar [{"text":"⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=36}] actionbar [{"text":"⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=34}] actionbar [{"text":"⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=32}] actionbar [{"text":"⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=30}] actionbar [{"text":"⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=28}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=26}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=24}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=22}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=20}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=18}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=16}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=14}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=12}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=10}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=08}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=06}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=04}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛","color":"dark_aqua"}]
title @s[scores={batLV=3,batCool=02}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛","color":"dark_aqua"}]

title @s[scores={batLV=4,batCool=40}] actionbar [{"text":"","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=38}] actionbar [{"text":"⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=36}] actionbar [{"text":"⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=34}] actionbar [{"text":"⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=32}] actionbar [{"text":"⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=30}] actionbar [{"text":"⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=28}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=26}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=24}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=22}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=20}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=18}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=16}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=14}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=12}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=10}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=08}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=06}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=04}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛","color":"dark_green"}]
title @s[scores={batLV=4,batCool=02}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛","color":"dark_green"}]

title @s[scores={batLV=5,batCool=40}] actionbar [{"text":"","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=38}] actionbar [{"text":"⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=36}] actionbar [{"text":"⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=34}] actionbar [{"text":"⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=32}] actionbar [{"text":"⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=30}] actionbar [{"text":"⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=28}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=26}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=24}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=22}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=20}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=18}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=16}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=14}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=12}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=10}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=08}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=06}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=04}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛⬛","color":"gold"}]
title @s[scores={batLV=5,batCool=02}] actionbar [{"text":"⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜","color":"gray"},{"text":"⬛","color":"gold"}]

#
scoreboard players add @s sneakT 0
#scoreboard players add @s[scores={sneakT=5..}] sneakT 1
scoreboard players add @s[scores={shift=1..,sneakCool=0}] sneakT 1
scoreboard players set @s[scores={shift=..0}] sneakT 0
#attribute @s[scores={sneakT=5..}] minecraft:generic.knockback_resistance base set 1.0
scoreboard players set @s shift 0

scoreboard players add @s sneakCool 0
scoreboard players remove @s[scores={sneakCool=1..}] sneakCool 1

execute as @s[scores={sneakT=7..}] at @s run function game:slam/hit
xp add @s[scores={sneakT=7..}] 80 levels
scoreboard players set @s[scores={sneakT=7..}] sneakCool 90
xp set @s[scores={sneakT=7..}] 557 points
scoreboard players set @s[scores={sneakT=7..}] sneakT 0

xp set @s[scores={sneakT=1..8}] 80 levels
xp set @s[scores={sneakCool=1..}] 80 levels
xp set @s[scores={sneakT=1}] 70 points
xp set @s[scores={sneakT=2}] 140 points
xp set @s[scores={sneakT=3}] 210 points
xp set @s[scores={sneakT=4}] 280 points
xp set @s[scores={sneakT=5}] 350 points
xp set @s[scores={sneakT=6}] 420 points
#xp set @s[scores={sneakT=7}] 490 points

xp set @s[scores={sneakCool=1..9}] 55 points
xp set @s[scores={sneakCool=10..18}] 110 points
xp set @s[scores={sneakCool=19..27}] 165 points
xp set @s[scores={sneakCool=28..36}] 220 points
xp set @s[scores={sneakCool=37..45}] 275 points
xp set @s[scores={sneakCool=46..54}] 330 points
xp set @s[scores={sneakCool=55..63}] 385 points
xp set @s[scores={sneakCool=64..72}] 440 points
xp set @s[scores={sneakCool=73..81}] 495 points
xp set @s[scores={sneakCool=82..}] 557 points

xp set @s 0 levels

execute as @s[scores={sneakT=4}] at @s run playsound minecraft:block.note_block.snare master @a ~ ~ ~ 1 0
execute as @s[scores={sneakT=4}] at @s run playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 1 2

#effect clear @s[scores={sneakCool=80}] absorption
#effect give @s[scores={sneakCool=80}] minecraft:absorption 1 4
#effect clear @s[scores={sneakCool=75}] absorption
#effect give @s[scores={sneakCool=75}] minecraft:absorption 1 3
#effect give @s[scores={sneakCool=70}] minecraft:absorption 1 4

#effect clear @s[scores={sneakCool=64}] absorption
#effect give @s[scores={sneakCool=64}] minecraft:absorption 1 3
#effect clear @s[scores={sneakCool=59}] absorption
#effect give @s[scores={sneakCool=59}] minecraft:absorption 1 2
#effect give @s[scores={sneakCool=54}] minecraft:absorption 1 3

#effect clear @s[scores={sneakCool=48}] absorption
#effect give @s[scores={sneakCool=48}] minecraft:absorption 1 2
#effect clear @s[scores={sneakCool=43}] absorption
#effect give @s[scores={sneakCool=43}] minecraft:absorption 1 1
#effect give @s[scores={sneakCool=38}] minecraft:absorption 1 2

#effect clear @s[scores={sneakCool=32}] absorption
#effect give @s[scores={sneakCool=32}] minecraft:absorption 1 1
#effect clear @s[scores={sneakCool=27}] absorption
#effect give @s[scores={sneakCool=27}] minecraft:absorption 1 1
#effect give @s[scores={sneakCool=22}] minecraft:absorption 1 1

#effect clear @s[scores={sneakCool=16}] absorption
#effect give @s[scores={sneakCool=16}] minecraft:absorption 1 0

#effect clear @s[scores={sneakCool=..0}] absorption
