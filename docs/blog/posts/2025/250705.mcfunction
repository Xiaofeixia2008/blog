tag @a remove inOverworld
execute in overworld as @a[rm=0] run tag @s add inOverworld
execute in nether as @e[rm=0] run tellraw @a[tag=inOverworld] {"rawtext":[{"text":"114514"}]}

execute if block 30 65 60 air if score redBedState data matches 1 as @a[scores={team=1}] run tellraw @s {"rawtext":[{"text":"§c你的床已被破坏！"}]}
execute if block 30 65 60 air if score redBedState data matches 1 as @a[scores={team=1}] run titleraw @s title {"rawtext":[{"text":"§c床已被破坏！"}]}
execute if block 30 65 60 air if score redBedState data matches 1 as @a[scores={team=!1}] run title @s title "§c红队的床已被破坏！"
execute if block 30 65 60 air if score redBedState data matches 1 run scoreboard players set redBedState data 0

scoreboard players add @a isOnline 0
execute as @a[scores={isOnline=0},tag=vip] run tellraw @s {"rawtext":[{"translate":"§lMersury Cylinder Server >> §r§eWelcome %%s back to server","with":{"rawtext":[{"selector":"@s"}]}}]}
execute as @a[scores={isOnline=0},tag=vip] run title @s title §b114514
scoreboard objectives remove isOnline
scoreboard objectives add isOnline dummy "在线数据"
scoreboard players set @a isOnline 1

scoreboard objectives add deathCount dummy "死亡榜"
scoreboard objectives add deathRemained dummy
scoreboard objectives add deathState dummy
scoreboard players set CONST_5 deathRemained 5
?
scoreboard players set @a[scores={deathState=!2}] deathState 1
scoreboard players set @e[type=player] deathState 0
scoreboard players add @a[scores={deathState=1}] deathCount 1
execute as @a[scores={deathState=1}] at @s run function death
scoreboard players set @a[scores={deathState=1}] deathState 2
?
scoreboard players operation @s deathRemained = CONST_5 deathRemained
scoreboard players operation @s deathRemained -= @s deathCount
execute as @s[scores={deathCount=..4}] run tellraw @s {"rawtext":[{"translate":"You have died for %%s time(s), you'll be failure if you died for another %%s time(s)!","with":{"rawtext":[{"score":{"objective":"deathCount","name":"@s"}}, {"score":{"objective":"deathRemained","name":"@s"}}]}}]}
execute as @s[scores={deathCount=5..}] run tellraw @s {"rawtext":[{"text":"§cGame Over! Try Again!"}]}
execute as @s[scores={deathCount=5..}] run title @s title §l§cGame Over!
execute as @s[scores={deathCount=5..}] run title @s subtitle §7Try Again!
scoreboard players set @a[scores={deathCount=5..}] deathCount 0

title @a times 0 2 0
execute as @a at @s if entity @e[type=zombie, r=7] run title @s title §1
execute as @a at @s if entity @e[type=zombie, r=7] run title @s subtitle §c§lRun!

execute if score timeline time matches 0 run title @s title §lMainline Completed!
execute if score timeline time matches 40 run title @s subtitle §bThe ending house have been opened
scoreboard players add timeline time 1

scoreboard objectives add data dummy
scoreboard players set CONST_M data 1200
scoreboard players set CONST_S data 20
scoreboard players set CONST_MS data 50
scoreboard players operation record data = @p record
scoreboard players operation m data = record data
scoreboard players operation m data /= CONST_M data
scoreboard players operation s data = record data
scoreboard players operation s data %= CONST_M data
scoreboard players operation s data /= CONST_S data
scoreboard players operation ms data = record data
scoreboard players operation s data %= CONST_S data
scoreboard players operation ms data *= CONST_MS data
tellraw @p {"rawtext":[{"translate":"§bYour record is %%s:%%s.%%s","with":{"rawtext":[{"score":{"objective":"data","name":"m"}}, {"score":{"objective":"data","name":"s"}}, {"score":{"objective":"data","name":"ms"}}]}}]}

scoreboard objectives add data dummy
scoreboard players set coin0 data 0
scoreboard players set coin1 data 0
execute as @a[scores={team=0}] run scoreboard players operation coin0 data += @s coin
execute as @a[scores={team=1}] run scoreboard players operation coin1 data += @s coin
execute if score coin0 data > coin1 data run titleraw @a actionbar {"rawtext":[{"translate":"你的名字 %%s | 金币 %%s | 击杀 %%s | 死亡 %%s | 优势队伍 红队","with":{"rawtext":[{"selector":"@s"}, {"score":{"objective":"coin","name":"@s"}}, {"score":{"objective":"killAmount","name":"@s"}}, {"score":{"objective":"deathCount","name":"@s"}}]}}]}
execute if score coin0 data = coin1 data run titleraw @a actionbar {"rawtext":[{"translate":"你的名字 %%s | 金币 %%s | 击杀 %%s | 死亡 %%s | 优势队伍 争夺中","with":{"rawtext":[{"selector":"@s"}, {"score":{"objective":"coin","name":"@s"}}, {"score":{"objective":"killAmount","name":"@s"}}, {"score":{"objective":"deathCount","name":"@s"}}]}}]}
execute if score coin0 data < coin1 data run titleraw @a actionbar {"rawtext":[{"translate":"你的名字 %%s | 金币 %%s | 击杀 %%s | 死亡 %%s | 优势队伍 蓝队","with":{"rawtext":[{"selector":"@s"}, {"score":{"objective":"coin","name":"@s"}}, {"score":{"objective":"killAmount","name":"@s"}}, {"score":{"objective":"deathCount","name":"@s"}}]}}]}

# 1-3
tag @a remove overworld
execute in overworld as @a[rm=0] run tag @a add overworld
execute in nether as @e[rm=0] run tellraw @a[tag=overworld] {"rawtext":[{"text":"你们好，主世界的生物们！"}]}

# 1-3
execute if block 30 65 60 air if score redBedState data matches 1 run tellraw @a[scores={team=1}] {"rawtext":[{"text":"§c你的床已被破坏！"}]}
execute if block 30 65 60 air if score redBedState data matches 1 run tellraw @a[scores={team=!1}] {"rawtext":[{"text":"§c红队的床已被破坏！"}]}
execute if block 30 65 60 air if score redBedState data matches 1 run title @a[scores={team=1}] title §l床已被破坏！
execute if block 30 65 60 air if score redBedState data matches 1 run scoreboard players set redBedState data 0

# 2-3
scoreboard players add @a isOnline 0
execute as @a[scores={isOnline=0},tag=vip] run tellraw @a {"rawtext":[{"translate":"§lxxx服务器 >> §r§e欢迎 %%s 回到服务器","with":{"rawtext":[{"selector":"@s"}]}}]}
execute as @a[scores={isOnline=0},tag=vip] run title @a title §b欢迎回到服务器！
scoreboard objectives remove isOnline
scoreboard objectives add isOnline dummy "在线数据"
scoreboard players set @a isOnline 1

# 4.1
scoreboard objectives add health dummy "剩余生命"
scoreboard players set const5 health 5
# 4.2
execute as @a[scores={deathCount=1..4}] run scoreboard players operation @s health = const5 health
execute as @a[scores={deathCount=1..4}] run scoreboard players operation @s health -= @s deathCount
execute as @a[scores={deathCount=1..4}] run tellraw @s {"rawtext":[{"translate":"§7你已经死亡 %%s 次了，再死亡 %%s 次你将失败！","with":{"rawtext":[{"score":{"objective":"deathCount","name":"@s"}},{"score":{"objective":"health","name":"@s"}}]}}]}
# 4.3
execute as @a[scores={deathCount=5..}] run tellraw @s {"rawtext":[{"text":"§c闯关失败！重来一次吧！"}]}
execute as @a[scores={deathCount=5..}] run title @s title §l§c闯关失败！
execute as @a[scores={deathCount=5..}] run §7重来一次吧！
execute as @a[scores={deathCount=5..}] run scoreboard players set @s deathCount 0

# 5
title @a times 0 60 0
execute as @a at @s if entity @e[type=zombie,r=7] run title @s title §1
execute as @a at @s if entity @e[type=zombie,r=7] run title @s subtitle §c§l跑！

# 6
scoreboard players add timeline time 1
execute if score timeline time matches 1 run title @a title §l主 线 已 完 成
execute if score timeline time matches 41 run title @a subtitle §b结束屋已开放

# 7
scoreboard players set const60 record 60
scoreboard players set const20 record 20
scoreboard players set const5 record 5
## 获取秒数，为游戏刻数/20（例如810刻/20=40秒）
scoreboard players operation second record = @p record
scoreboard players operation second record /= const20 record
## 获取毫秒数，为游戏刻数%20*5（例如810刻%20=10,10*5=50毫秒）
scoreboard players operation millisecond record = @p record
scoreboard players operation millisecond record %= const20 record
scoreboard players operation millisecond record *= const5 record
## 获取分钟，为秒数/60（例如125秒/60=2分钟）
scoreboard players operation minute record = second record
scoreboard players operation minute record /= const60 record
## 输出
tellraw @a {"rawtext":[{"translate":"§b你的记录为%%s:%%s.%%s","with":{"rawtext":[{"score":{"objective":"record","name":"minute"}},{"score":{"objective":"record","name":"second"}},{"score":{"objective":"record","name":"millisecond"}}]}}]}

# 8
## 计算两队分数
execute as @a[scores={team=0}] run scoreboard players operation redTeam coin += @s coin
execute as @a[scores={team=1}] run scoreboard players operation blueTeam coin += @s coin
## 比对后显示分数
execute if score redTeam coin > blueTeam coin as @a run titleraw @s actionbar {"rawtext":[{"translate":"你的名字 %%s | 金币 %%s | 击杀 %%s | 死亡 %%s | 优势队伍 红队","with":{"rawtext":[{"selector":"@s"},{"score":{"objective":"coin","name":"@s"}},{"score":{"objective":"killCount","name":"@s"}},{"score":{"objective":"deathCount","name":"@s"}}]}}]}
execute if score redTeam coin < blueTeam coin as @a run titleraw @s actionbar {"rawtext":[{"translate":"你的名字 %%s | 金币 %%s | 击杀 %%s | 死亡 %%s | 优势队伍 蓝队","with":{"rawtext":[{"selector":"@s"},{"score":{"objective":"coin","name":"@s"}},{"score":{"objective":"killCount","name":"@s"}},{"score":{"objective":"deathCount","name":"@s"}}]}}]}

# 2.9.2
camera @s fade time 1 9 1 color 11 45 14
camera @s set minecraft:third_person
camera @s set minecraft:free ease 11.4514 in_out_sine pos 17 -24 89 facing 17 -24 95
camera @s set minecraft:free ease 11.4514 in_quad pos 17 -24 89 rot 90 0
camera @s set minecraft:free ease 11.4514 linear pos 17 -24 89 facing 17 -60 89
camerashake add @s 1 6 rotational
hud @s hide health

execute if score timeline time matches 1060 run inputpermission set @a movement disabled
execute if score timeline time matches 1060 run camera @a set minecraft:free ease 3 in_out_quad pos -237 33 130 facing -247 35 130
execute if score timeline time matches 1420 as @a at @s run camera @s set minecraft:free ease 3 in_out_quad pos ^^^0.5 facing ^^^5
execute if score timeline time matches 1460 run camera @a clear
execute if score timeline time matches 1460 run inputpermission set @a movement enabled

# answer
camera @s fade time 1 9 1 color 11 45 14
camera @s set minecraft:third_person
camera @s set minecraft:free ease 3 in_out_sine pos 17 -24 89 facing 17 -24 95
camera @s set minecraft:free ease 3 in_quad pos 17 -24 89 rot 90 0
camera @s set minecraft:free ease 3 linear pos 17 -24 89 facing 17 -60 89
camerashake @s 1 6 rotational
hud @s hide health
execute if score timeline time matches 1060 run camera @a set minecraft:free ease 3 in_out_quad pos -237 33 130 facing -247 35 130
execute if score timeline time matches 1420 as @a at @s anchored eyes run camera @a set minecraft:free ease 3 in_out_quad pos ^^^0.5 facing ^^^1
execute if score timeline time matches 1460 run camera @a clear
execute if score timeline time matches 1460 run inputpermission set @a camera enabled
execute if score timeline time matches 1460 run inputpermission set @a movement enabled
