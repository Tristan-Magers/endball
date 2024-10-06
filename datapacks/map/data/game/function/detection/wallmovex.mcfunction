execute as @s[scores={dx=1..}] at @s run function game:detection/movexhigh
execute as @s[scores={dx=..-1}] at @s run function game:detection/movexlow

scoreboard players remove @s[scores={dx=1..}] dx 1
scoreboard players add @s[scores={dx=..-1}] dx 1

execute as @s[scores={dx=1..}] at @s run function game:detection/wallmovex
execute as @s[scores={dx=..-1}] at @s run function game:detection/wallmovex