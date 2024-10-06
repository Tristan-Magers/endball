execute as @s positioned ~ ~1.5 ~ run scoreboard players operation @e[type=minecraft:ender_pearl,limit=1,sort=nearest] ID = @s ID
scoreboard players set @s endThrow 0