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