execute if score .players.red .data <= .players.blue .data run team join red @r[tag=join,team=]
scoreboard players set .players.red .data 0
execute as @a[team=red] run scoreboard players add .players.red .data 1
execute if score .players.red .data >= .players.blue .data run team join blue @r[tag=join,team=]
scoreboard players set .players.blue .data 0
execute as @a[team=blue] run scoreboard players add .players.blue .data 1