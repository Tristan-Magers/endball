execute at @s if block ~0.3 ~ ~ minecraft:light_blue_terracotta run tp @s ~-0.5 ~ ~
execute at @s if block ~-0.3 ~ ~ minecraft:light_blue_terracotta run tp @s ~0.5 ~ ~
execute at @s if block ~ ~ ~0.3 minecraft:light_blue_terracotta run tp @s ~ ~ ~-0.5
execute at @s if block ~ ~ ~-0.3 minecraft:light_blue_terracotta run tp @s ~ ~ ~0.5
execute at @s if block ~ ~1.6 ~ minecraft:barrier run tp @s ~ ~-1.6 ~

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
item replace entity @s[scores={bedcharge=60}] hotbar.2 with minecraft:gray_bed{display:{Name:'{"text":"Spawn (right-click to teleport)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
item replace entity @s[scores={bedcharge=120}] hotbar.2 with minecraft:cyan_bed{display:{Name:'{"text":"Spawn (right-click to teleport)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
item replace entity @s[scores={bedcharge=180}] hotbar.2 with minecraft:lime_bed{display:{Name:'{"text":"Spawn (right-click to teleport)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
item replace entity @s[scores={bedcharge=320}] hotbar.2 with minecraft:yellow_bed{display:{Name:'{"text":"Spawn (right-click to teleport)","italic":false}'},Unbreakable:1b,AttributeModifiers:[{AttributeName:"generic.attack_speed",Name:"generic.attack_speed",Amount:100,Operation:0,UUID:[I;200076539,1128678101,-2063028094,2055093148]}]}
#clear @s[scores={bedcharge=1000..}] black_bed

# shift hit
function game:player/shift

# bat use
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:netherite_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] at @s run function game:smash/hit
execute as @s[scores={click=1..},nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] at @s run function game:smash/hit

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
function game:player/levelupbat

tag @s remove degrade

# bat timer actionbar
execute as @s[scores={batLV=2..}] at @s run function game:player/battimer

# leave game
tag @s[scores={potion=1..}] remove ingame
team leave @s[scores={potion=1..}]
kill @s[scores={potion=1..}]
scoreboard players set @s potion 0