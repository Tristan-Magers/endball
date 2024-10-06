tag @s remove charge_buffer

tag @s[scores={chargeDelay=1..}] add charge_buffer
execute as @s[scores={chargeDelay=..0}] at @s run particle minecraft:cloud ~ ~0.5 ~ 0.2 0.1 0.2 0.1 5
scoreboard players add @s[scores={chargeDelay=..0}] chargeLV 1
scoreboard players set @s[scores={chargeDelay=..0}] chargeDelay 4

scoreboard players set @s[scores={chargeLV=17..}] clickPause 20
scoreboard players set @s[scores={chargeLV=17..}] chargeDelay 0