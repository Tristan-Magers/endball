execute as @s[scores={dy=1..}] at @s run function game:detection/moveyhigh
execute as @s[scores={dy=..-1}] at @s run function game:detection/moveylow

scoreboard players remove @s[scores={dy=1..}] dy 1
scoreboard players add @s[scores={dy=..-1}] dy 1

execute as @s[scores={dy=1..}] at @s run function game:detection/wallmovey
execute as @s[scores={dy=..-1}] at @s run function game:detection/wallmovey