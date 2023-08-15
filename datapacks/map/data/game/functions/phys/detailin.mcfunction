execute if block ~ ~ ~ #minecraft:trapdoors

#y tho?
execute if block ~ ~ ~ pink_stained_glass_pane run tag @s add in
execute if block ~ ~ ~ light_gray_stained_glass_pane run tag @s add in
execute if block ~ ~ ~ minecraft:yellow_stained_glass_pane run tag @s add in
execute if block ~ ~ ~ minecraft:red_stained_glass_pane run tag @s add in
execute if block ~ ~ ~ minecraft:orange_stained_glass_pane run tag @s add in
execute if block ~ ~ ~ minecraft:cyan_stained_glass_pane run tag @s add in
execute if block ~ ~ ~ minecraft:blue_stained_glass_pane run tag @s add in
execute if block ~ ~ ~ minecraft:light_blue_stained_glass_pane run tag @s add in

execute if block ~ ~ ~ grass run tag @s add in
execute if block ~ ~ ~ tall_grass run tag @s add in
execute if block ~ ~ ~ #minecraft:small_flowers run tag @s add in
execute if block ~ ~ ~ fern run tag @s add in
execute if block ~ ~ ~ large_fern run tag @s add in

execute if block ~ ~ ~ #minecraft:climbable
execute if block ~ ~ ~ air run tag @s add in

#y x2
execute if block ~ ~ ~ minecraft:dead_fire_coral run tag @s add in
execute if block ~ ~ ~ minecraft:dead_fire_coral_fan run tag @s add in
execute if block ~ ~ ~ minecraft:dead_brain_coral run tag @s add in
execute if block ~ ~ ~ minecraft:dead_horn_coral_fan run tag @s add in

execute if block ~ ~ ~ minecraft:hanging_roots run tag @s add in
execute if block ~ ~ ~ minecraft:small_dripleaf run tag @s add in
execute if block ~ ~ ~ minecraft:big_dripleaf run tag @s add in
execute if block ~ ~ ~ minecraft:big_dripleaf_stem run tag @s add in

execute if block ~ ~ ~ #minecraft:climbable run tag @s add in
execute if block ~ ~ ~ #minecraft:coral_plants run tag @s add in
execute if block ~ ~ ~ #minecraft:pressure_plates run tag @s add in
execute if block ~ ~ ~ redstone_torch run tag @s add in
execute if block ~ ~ ~ #minecraft:trapdoors run tag @s add in
execute if block ~ ~ ~ #minecraft:fire run tag @s add in
execute if block ~ ~ ~ #minecraft:signs run tag @s add in
execute if block ~ ~ ~ #minecraft:wall_signs run tag @s add in
#execute if block ~ ~ ~ cobweb run tag @s add in
execute if block ~ ~ ~ water run tag @s add in
execute if block ~ ~ ~ minecraft:sea_pickle run tag @s add in

execute if block ~ ~ ~ structure_void run tag @s add in

execute if block ~ ~.5 ~ #minecraft:slabs[type=top] run tag @s add in
execute if block ~ ~-.5 ~ #minecraft:slabs[type=bottom] run tag @s add in

execute if block ~ ~.5 ~ #minecraft:stairs[half=top] run tag @s add in
execute if block ~ ~-.5 ~ #minecraft:stairs[half=bottom] run tag @s add in

execute if block ~ ~ ~ #minecraft:fences run tag @s add in
execute if block ~ ~ ~ end_rod run tag @s add in
execute if block ~ ~ ~ bamboo run tag @s add in
execute as @s[type=!player] if block ~ ~ ~ iron_bars run tag @s add in

execute if block ~.25 ~ ~.25 #minecraft:fences if block ~-.25 ~ ~-.25 #minecraft:fences run tag @s remove in
execute if block ~.35 ~ ~.35 end_rod if block ~-.35 ~ ~-.35 end_rod run tag @s remove in
execute if block ~.35 ~ ~.35 bamboo if block ~-.35 ~ ~-.35 bamboo run tag @s remove in

execute if block ~ ~ ~ cobblestone_wall run tag @s add in
execute if block ~.25 ~ ~.25 cobblestone_wall if block ~-.25 ~ ~-.25 cobblestone_wall run tag @s remove in

execute if block ~ ~ ~ soul_sand if block ~ ~.125 ~ air run tag @s add in

execute if block ~ ~ ~ barrier run tag @s add in
execute as @s[type=player] if block ~ ~ ~ barrier run tag @s remove in

execute if block ~ ~ ~ #minecraft:leaves run tag @s add in
execute as @s[type=player] if block ~ ~ ~ cobweb run tag @s add in
execute as @s[type=cave_spider] if block ~ ~ ~ cobweb run tag @s add in
execute as @s[type=player] if block ~ ~ ~ #minecraft:leaves run tag @s remove in
execute as @s[tag=soulsend] if block ~ ~ ~ #minecraft:leaves run tag @s remove in

execute if block ~ ~ ~ tinted_glass run tag @s remove in