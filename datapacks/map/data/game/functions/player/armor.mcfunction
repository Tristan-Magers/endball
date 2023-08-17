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
attribute @s[scores={knockbackActive=..0,knockbackLV=1}] minecraft:generic.knockback_resistance base set 0.07
attribute @s[scores={knockbackActive=..0,knockbackLV=2}] minecraft:generic.knockback_resistance base set 0.14
attribute @s[scores={knockbackActive=..0,knockbackLV=3}] minecraft:generic.knockback_resistance base set 0.21
attribute @s[scores={knockbackActive=..0,knockbackLV=..0}] minecraft:generic.knockback_resistance base set 0.0

attribute @s[scores={knockbackLV=0}] minecraft:generic.armor base set 0
attribute @s[scores={knockbackLV=1}] minecraft:generic.armor base set 4
attribute @s[scores={knockbackLV=2}] minecraft:generic.armor base set 5
attribute @s[scores={knockbackLV=3}] minecraft:generic.armor base set 5
attribute @s[scores={knockbackLV=4}] minecraft:generic.armor base set 3