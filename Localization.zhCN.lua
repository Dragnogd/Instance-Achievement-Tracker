if(GetLocale() ~= 'zhCN') then return end

local _, core = ...
local baseLocale = {
    ["Main"] = "主界面",
    ["Battle for Azeroth"] = "争霸艾泽拉斯",
    ["Legion"] = "军团再临",
    ["Warlords of Draenor"] = "德拉诺之王",
    ["Mists of Pandaria"] = "潘达利亚之谜",
    ["Cataclysm"] = "大地的裂变",
    ["Wrath of the Lich King"] = "巫妖王之怒",
    ["Instance Achievement Tracker"] = "Instance Achievement Tracker(成就追踪)",
    ["Currently Tracking"] = "当前追踪",
    ["Achievements"] = "成就",
    ["Achievement"] = "成就",
    ["Tactics"] = "追踪",
    ["Features"] = "功能:",
    ["- Tracks when the criteria of instance achievements have been met and output this to chat"] = "- 追踪当前BOSS成就并输出到聊天框",
    ["- Tracks when the criteria of instance achievements has been failed and outputs this to chat"] = "- 追踪当前BOSS成就失败并输出到聊天框",
    ["- Keeps track of achievements which require you to kill so many mobs within a certain time period. It will announce to chat when enough mobs have spawned and whether they were killed in the time period."] = "- 持续追踪需要在一定时间内杀指定数量怪物成就，当有聚集足够的怪的时候他会在聊天框报告这些怪物是否在指定时间被击杀",
    ["- Scans all players in the group to see which achievements each player is missing for the current instance"] = "- 扫描队中的所有玩家，追踪没有当前BOSS成就的玩家",
    ["- Announce to chat players who are missing achievements for certain bosses"] = "- 通报某些BOSS还没有成就的玩家",
    ["- Announce to chat tactics for a certain boss"] = "- 通报某些BOSS成就攻略",
    ["Options"] = "选项",
    ["Enable Addon"] = "启用插件",
    ["Show Minimap Button"] = "在小地图显示按钮",
    ["(Achievement Tracking Disabled)"] = "(Achievement Tracking Disabled)", --TODO
    ["(Enter instance to start scanning)"] = "(Enter instance to start scanning)", --TODO
    ["Output Tactics"] = "输出打法",
    ["Output Players"] = "输出脚男",
    ["Track"] = "追踪",
    ["Players"] = "脚男",
    ["No players in the group need this achievement"] = "No players in the group need this achievement", --TODO
    ["scan still in progress"] = "scan still in progress", --TODO
    ["Enter instance to start scanning"] = "Enter instance to start scanning", --TODO
    ["Players who need Achievement"] = "Players who need Achievement", --TODO
    ["Disabled"] = "取消",
    ["Enabled"] = "开始",
    ["Tracking"] = "追踪",

    --["Only track missing achievements"] = "Only track missing achievements",
}

core:RegisterLocale('zhCN', baseLocale)
