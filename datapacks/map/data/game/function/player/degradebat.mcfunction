scoreboard players remove @s[scores={batCool=-1..,smash_delay=..1}] batCool 1

tag @s[scores={batCool=0}] add degrade

execute as @s[tag=degrade,scores={batLV=2..}] at @s run playsound minecraft:block.note_block.basedrum master @a ~ ~ ~ 0.7 0.3

item replace entity @s[tag=degrade,scores={batLV=2}] hotbar.0 with wooden_hoe[item_name='{"text":" ","italic":false}',attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]
scoreboard players set @s[tag=degrade,scores={batLV=2}] batLV 1

item replace entity @s[tag=degrade,scores={batLV=3}] hotbar.0 with stone_hoe[item_name='{"text":"Level 1 (right-click to Smash)","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]
scoreboard players set @s[tag=degrade,scores={batLV=3}] batCool 40
scoreboard players set @s[tag=degrade,scores={batLV=3}] batLV 2

item replace entity @s[tag=degrade,scores={batLV=4}] hotbar.0 with iron_hoe[item_name='{"text":"Level 2 (right-click to Smash)","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]
scoreboard players set @s[tag=degrade,scores={batLV=4}] batCool 35
scoreboard players set @s[tag=degrade,scores={batLV=4}] batLV 3

item replace entity @s[tag=degrade,scores={batLV=5}] hotbar.0 with netherite_hoe[item_name='{"text":"Level 3 (right-click to Smash)","italic":false}',unbreakable={},attribute_modifiers=[{id:"attack_speed",type:"generic.attack_speed",amount:100,operation:"add_value"}]]
scoreboard players set @s[tag=degrade,scores={batLV=5}] batCool 30
scoreboard players set @s[tag=degrade,scores={batLV=5}] batLV 4