kill @e[type=minecraft:endermite]
execute positioned -15.0 -47 -25.0 run function game:summonmite
scoreboard players set @e[type=minecraft:endermite] freeze 26

item replace entity @a hotbar.0 with wooden_hoe{display:{Name:'{"text":" ","italic":false}'},Unbreakable:1b}

scoreboard players set @a[scores={enderC=1..}] enderT 0
clear @a[scores={enderC=2}] ender_pearl 1

scoreboard players set @a batLV 1
