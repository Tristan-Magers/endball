tp @s ^ ^ ^.1
tag @s remove first
tag @s remove in
execute as @s at @s positioned ~ ~-.3 ~ run function game:detailin
tag @s[tag=in] add first
tag @s remove in
execute as @s[tag=first] at @s positioned ~ ~.3 ~ run function game:detailin
tp @s[tag=!in] ^ ^ ^-.15
scoreboard players set @s[tag=!in] move 0
scoreboard players remove @s move 1
execute as @s[scores={move=1..}] at @s run function game:detection/move
