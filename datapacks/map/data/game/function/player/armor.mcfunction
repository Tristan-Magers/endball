scoreboard players add @s knockbackActive 0
scoreboard players add @s knockbackLV 0

scoreboard players set @s[scores={knockbackCool=100..}] knockbackCool 100
scoreboard players remove @s[scores={knockbackCool=0..}] knockbackCool 1
scoreboard players set @s[scores={knockbackCool=0}] knockbackLV 0

scoreboard players remove @s[scores={knockbackActive=0..}] knockbackActive 1
scoreboard players set @s[scores={knockbackActive=0}] knockbackLV 0
scoreboard players set @s[scores={knockbackActive=0}] knockbackCool 0

execute store result score @s hurt run data get entity @s HurtTime 1
execute as @s[scores={hurt=10,knockbackLV=..3,chargeLV=1..,stunned=..5}] at @s run scoreboard players set @s stunned 5
execute as @s[scores={hurt=10,knockbackLV=..3,chargeLV=1..}] at @s run playsound minecraft:entity.breeze.hurt master @a ~ ~ ~ 0.7 2
title @s[scores={hurt=10,knockbackLV=..3,chargeLV=1..}] actionbar [{"text":"","color":"gray"}]
scoreboard players set @s[scores={hurt=10,knockbackLV=..3}] chargeLV 0
scoreboard players set @s[scores={hurt=10,knockbackLV=..3}] chargeDelay 15
scoreboard players add @s[scores={hurt=10,knockbackLV=..3}] knockbackCool 55
scoreboard players add @s[scores={hurt=10,knockbackLV=..3}] knockbackLV 1

item replace entity @s[scores={hurt=10,knockbackLV=3}] armor.chest with minecraft:chainmail_chestplate[unbreakable={}]
item replace entity @s[scores={hurt=10,knockbackLV=2}] armor.legs with minecraft:chainmail_leggings[unbreakable={}]
item replace entity @s[scores={hurt=10,knockbackLV=1}] armor.feet with minecraft:chainmail_boots[unbreakable={}]

scoreboard players set @s[scores={knockbackActive=-1,knockbackLV=4}] knockbackCool 120
scoreboard players set @s[scores={knockbackActive=-1,knockbackLV=4}] knockbackActive 70

execute as @s[scores={knockbackActive=70},tag=!goal] at @s run playsound minecraft:block.anvil.land master @a ~ ~ ~ 0.3 0
execute as @s[scores={knockbackActive=70},tag=!goal] at @s run playsound minecraft:block.anvil.land master @a ~ ~ ~ 0.5 1.4
execute as @s[scores={knockbackActive=70},tag=!goal] at @s run execute on attacker run function game:player/get_stunned

effect give @s[scores={knockbackActive=70},tag=!goal] minecraft:speed 3 1 true
#effect give @s[scores={knockbackActive=70},tag=!goal] minecraft:blindness 1

item replace entity @s[scores={knockbackActive=70}] armor.chest with minecraft:netherite_chestplate[unbreakable={}]
item replace entity @s[scores={knockbackActive=70}] armor.legs with minecraft:netherite_leggings[unbreakable={}]
item replace entity @s[scores={knockbackActive=70}] armor.feet with minecraft:netherite_boots[unbreakable={}]

scoreboard players set @s[tag=goal] knockbackActive 45

tag @s remove goal

item replace entity @s[scores={knockbackCool=1}] armor.chest with minecraft:air
item replace entity @s[scores={knockbackCool=1}] armor.legs with minecraft:air
item replace entity @s[scores={knockbackCool=1}] armor.feet with minecraft:air

item replace entity @s[scores={knockbackActive=1}] armor.chest with minecraft:air
item replace entity @s[scores={knockbackActive=1}] armor.legs with minecraft:air
item replace entity @s[scores={knockbackActive=1}] armor.feet with minecraft:air

effect give @s[scores={knockbackActive=20..}] resistance 1 100 true

attribute @s[scores={knockbackActive=1..}] minecraft:knockback_resistance base set 1.0
attribute @s[scores={knockbackActive=..0,knockbackLV=1}] minecraft:knockback_resistance base set 0.1
attribute @s[scores={knockbackActive=..0,knockbackLV=2}] minecraft:knockback_resistance base set 0.2
attribute @s[scores={knockbackActive=..0,knockbackLV=3}] minecraft:knockback_resistance base set 0.3
attribute @s[scores={knockbackActive=..0,knockbackLV=..0}] minecraft:knockback_resistance base set 0.0

attribute @s[scores={knockbackLV=0}] minecraft:armor base set 0
attribute @s[scores={knockbackLV=1}] minecraft:armor base set 4
attribute @s[scores={knockbackLV=2}] minecraft:armor base set 5
attribute @s[scores={knockbackLV=3}] minecraft:armor base set 5
attribute @s[scores={knockbackLV=4}] minecraft:armor base set 3