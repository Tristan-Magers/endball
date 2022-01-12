function game:smash/check

execute as @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run scoreboard players set @e[tag=move] greenPart 12
execute as @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run scoreboard players set @e[tag=move] flamePart 16

execute as @s[nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] at @s run function game:phys/hit1
execute as @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run function game:phys/hit2
execute as @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run function game:phys/hit3
execute as @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run function game:phys/hit4

#execute as @s[nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] at @s run effect give @a[tag=move2] minecraft:levitation 1 2 true
#execute as @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run effect give @a[tag=move2] minecraft:levitation 1 3 true
#execute as @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run effect give @a[tag=move2] minecraft:levitation 1 5 true
#execute as @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run effect give @a[tag=move2] minecraft:levitation 1 7 true

summon minecraft:marker ~ ~ ~ {Tags:["kill","part"]}

tp @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] @p
execute as @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ 0

execute as @s[nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] at @s run execute as @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] at @s run function game:smash/particle
execute as @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run execute as @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] at @s run function game:smash/particle2
execute as @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run execute as @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] at @s run function game:smash/particle3
execute as @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run execute as @e[type=minecraft:marker,tag=part,limit=1,sort=nearest] at @s run function game:smash/particle4

execute unless entity @e[tag=move] run playsound minecraft:entity.player.attack.nodamage master @a ~ ~ ~ 1 0
execute unless entity @e[tag=move] run playsound minecraft:entity.player.attack.nodamage master @a ~ ~ ~ 1 0.5

execute if entity @e[tag=move] run playsound minecraft:entity.player.attack.sweep master @a ~ ~ ~ 1 0.5
execute if entity @e[tag=move] run playsound minecraft:entity.endermite.hurt master @a ~ ~ ~ 0.8 0.8
execute if entity @e[tag=move] run playsound minecraft:entity.endermite.hurt master @a ~ ~ ~ 0.8 1.5

execute as @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run playsound minecraft:entity.player.attack.sweep master @a ~ ~ ~ 1 0.8
execute as @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run playsound minecraft:item.shield.block master @a ~ ~ ~ 0.6 0.6

execute as @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run playsound minecraft:entity.player.attack.sweep master @a ~ ~ ~ 1 0.8
execute as @s[nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run execute if entity @e[tag=move] run playsound minecraft:entity.wither.shoot master @a ~ ~ ~ 0.3 0.5

execute as @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run execute if entity @e[tag=move] run playsound minecraft:item.firecharge.use master @a
execute as @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1.5
execute as @s[nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run playsound minecraft:item.trident.riptide_1 master @a ~ ~ ~ 0.5 0.6

scoreboard players set @s woodHoe 0
scoreboard players set @s stoneHoe 0
scoreboard players set @s ironHoe 0
scoreboard players set @s netherHoe 0

scoreboard players set @s batLV 1
clear @s wooden_hoe
clear @s stone_hoe
clear @s iron_hoe
clear @s netherite_hoe
clear @s golden_hoe
item replace entity @s hotbar.0 with wooden_hoe{display:{Name:'{"text":" ","italic":false}'},Unbreakable:1b}

tag @e remove move
tag @e remove move2

title @s actionbar [{"text":"","color":"gray"},{"text":"","color":"dark_gray"}]