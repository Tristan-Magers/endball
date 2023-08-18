tag @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:lime_bed"}}] add bedclick
tag @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:cyan_bed"}}] add bedclick
tag @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:gray_bed"}}] add bedclick
tag @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:black_bed"}}] add bedclick
tag @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:yellow_bed"}}] add bedclick

execute as @s[scores={click=1..},tag=bedclick] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~

tp @s[scores={click=1..},tag=bedclick,tag=teamred] -15.0 -56.00 -39.5 0 0
tp @s[scores={click=1..},tag=bedclick,tag=teamblue] -15.0 -56.00 -12.5 180 0

scoreboard players set @s[scores={click=1..,batLV=..5},nbt={SelectedItem:{id:"minecraft:yellow_bed"}}] netherHoe 1
scoreboard players set @s[scores={click=1..,batLV=..4},nbt={SelectedItem:{id:"minecraft:lime_bed"}}] ironHoe 1
scoreboard players set @s[scores={click=1..,batLV=..3},nbt={SelectedItem:{id:"minecraft:cyan_bed"}}] stoneHoe 1
scoreboard players set @s[scores={click=1..,batLV=..2},nbt={SelectedItem:{id:"minecraft:gray_bed"}}] woodHoe 1

scoreboard players set @s[scores={click=1..,batLV=..5},nbt={SelectedItem:{id:"minecraft:yellow_bed"}}] damage 1
scoreboard players set @s[scores={click=1..,batLV=..4},nbt={SelectedItem:{id:"minecraft:lime_bed"}}] damage 1
scoreboard players set @s[scores={click=1..,batLV=..3},nbt={SelectedItem:{id:"minecraft:cyan_bed"}}] damage 1
scoreboard players set @s[scores={click=1..,batLV=..2},nbt={SelectedItem:{id:"minecraft:gray_bed"}}] damage 1

execute as @s[scores={click=1..},tag=bedclick] at @s run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~

clear @s[scores={click=1..},tag=bedclick] lime_bed
clear @s[scores={click=1..},tag=bedclick] cyan_bed
clear @s[scores={click=1..},tag=bedclick] gray_bed
clear @s[scores={click=1..},tag=bedclick] black_bed
clear @s[scores={click=1..},tag=bedclick] yellow_bed

scoreboard players set @s[scores={click=1..},tag=bedclick] bedcharge 1000

scoreboard players set @s click 0

tag @s remove bedclick