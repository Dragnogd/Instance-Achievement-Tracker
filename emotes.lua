--------------------------------------
-- Namespaces
--------------------------------------
local _, core = ...

core.emotes = {
    [0] = {
        emoteString = "<player> tanzt mit <target>.", --Dance deDE
        emote = "DANCE",
        relation = 0,
        language = "deDE",
    },
    [1] = {
        emoteString = "<player> überschüttet <target> mit Lob.", --Praise deDE,
        emote = "PRAISE",
        relation = 0,
        language = "deDE",
    },
    [2] = {
        emoteString = "<player> streichelt <target>.", --Pet deDE,
        emote = "PET",
        relation = 0,
        language = "deDE",
    },
    [3] = {
        emoteString = "<player> dances with <target>.", --dance enGB/enUS,
        emote = "DANCE",
        relation = 0,
        language = "enUS",
    },
    [4] = {
        emoteString = "<player> lavishes praise upon <target>.", --Praise enGB/enUS,
        emote = "PRAISE",
        relation = 0,
        language = "enUS",
    },
    [5] = {
        emoteString = "<player> pets <target>.", --Pet enGB/enUS,
        emote = "PET",
        relation = 0,
        language = "enUS",
    },
    [6] = {
        emoteString = "<player> baila con <target>.", --Dance esES/esMX,
        emote = "DANCE",
        relation = 0,
        language = "esES",
    },
    [7] = {
        emoteString = "<player> siente admiración por <target>.", --Praise esES/esMX,
        emote = "PRAISE",
        relation = 0,
        language = "esES",
    },
    [8] = {
        emoteString = "<player> convierte a <target> en su mascota.", --Pet esES/esMX,
        emote = "PET",
        relation = 0,
        language = "esES",
    },
    [9] = {
        emoteString = "<player> danse avec <target>.", --Dance frFR,
        emote = "DANCE",
        relation = 0,
        language = "frFR",
    },
    [10] = {
        emoteString = "<player> fait l’éloge <target>.", --Praise frFR,
        emote = "PRAISE",
        relation = 0,
        language = "frFR",
    },
    [11] = {
        emoteString = "<player> cajole <target>.", --Pet frFR,
        emote = "PET",
        relation = 0,
        language = "frFR",
    },
    [12] = {
        emoteString = "<player> balla con <target>.", --Dance itIT,
        emote = "DANCE",
        relation = 0,
        language = "itIT",
    },
    [13] = {
        emoteString = "<player> colma di elogi <target>.", --Praise itIT,
        emote = "PRAISE",
        relation = 0,
        language = "itIT",
    },
    [14] = {
        emoteString = "<player> accarezza <target>.", --Pet itIT,
        emote = "PET",
        relation = 0,
        language = "itIT",
    },
    [15] = {
        emoteString = "<player> 이 <target>|1과 신나게 춤을 춥니다.", --Dance koKR,
        emote = "DANCE",
        relation = 0,
        language = "koKR",
    },
    [16] = {
        emoteString = "<player> 이 <target>에게 찬사를 보냅니다.", --Praise koKR,
        emote = "PRAISE",
        relation = 0,
        language = "koKR",
    },
    [17] = {
        emoteString = "<player> 이 <target>을 귀여워합니다.", --Pet koKR,
        emote = "PET",
        relation = 0,
        language = "koKR",
    },
    [18] = {
        emoteString = "<player> dança com <target>.", --Dance ptBR/ptPT,
        emote = "DANCE",
        relation = 0,
        language = "ptBR",
    },
    [19] = {
        emoteString = "<player> enaltece <target> generosamente.", --Praise ptBR,
        emote = "PRAISE",
        relation = 0,
        language = "ptBR",
    },
    [20] = {
        emoteString = "<player> faz cafuné em <target>.", --Pet ptBR,
        emote = "PET",
        relation = 0,
        language = "ptBR",
    },
    [21] = {
        emoteString = "<player> танцует с <target>.", --Dance ruRU,
        emote = "DANCE",
        relation = 0,
        language = "ruRU",
    },
    [22] = {
        emoteString = "<player> превозносит <target>.", --Praise ruRU,
        emote = "PRAISE",
        relation = 0,
        language = "ruRU",
    },
    [23] = {
        emoteString = "<player> поглаживает <target>.", --Pet ruRU,
        emote = "PET",
        relation = 0,
        language = "ruRU",
    },
    [24] = {
        emoteString = "<player>在和<target>跳舞。", --Dance zhCN,
        emote = "DANCE",
        relation = 0,
        language = "zhCN",
    },
    [25] = {
        emoteString = "<player>对于<target>大加赞赏。", --Praise zhCN,
        emote = "PRAISE",
        relation = 0,
        language = "zhCN",
    },
    [26] = {
        emoteString = "<player>对<target>作出亲昵的表示。", --Pet zhCN,
        emote = "PET",
        relation = 0,
        language = "zhCN",
    },
    [27] = {
        emoteString = "<player>在和<target>跳舞。", --Dance zhTW,
        emote = "DANCE",
        relation = 0,
        language = "zhTW",
    },
    [28] = {
        emoteString = "<player>對於<target>大加讚賞。", --Praise zhTW,
        emote = "PRAISE",
        relation = 0,
        language = "zhTW",
    },
    [29] = {
        emoteString = "<player>撫摸<target>。", --Pet zhTW,
        emote = "PET",
        relation = 0,
        language = "zhTW",
    },
    [30] = {
        emoteString = "Ihr tanzt mit <target>.", --Dance deDE
        emote = "DANCE",
        relation = 2,
        language = "deDE",
    },
    [31] = {
        emoteString = "Ihr überschüttet <target> mit Lob.", --Praise deDE
        emote = "PRAISE",
        relation = 2,
        language = "deDE",
    },
    [32] = {
        emoteString = "Ihr streichelt <target>.", --Pet deDE
        emote = "PET",
        relation = 2,
        language = "deDE",
    },
    [33] = {
        emoteString = "You dance with <target>.", --Dance enGB/enUS
        emote = "DANCE",
        relation = 2,
        language = "enUS",
    },
    [34] = {
        emoteString = "You lavish praise upon <target>.", --Praise enGB/enUS
        emote = "PRAISE",
        relation = 2,
        language = "enUS",
    },
    [35] = {
        emoteString = "You pet <target>.", --Pet enGB/enUS
        emote = "PET",
        relation = 2,
        language = "enUS",
    },
    [36] = {
        emoteString = "Bailas con <target>.", --Dance esES/esMX
        emote = "DANCE",
        relation = 2,
        language = "esES",
    },
    [37] = {
        emoteString = "Sientes admiración por <target>.", --Praise esES/esMX
        emote = "PRAISE",
        relation = 2,
        language = "esES",
    },
    [38] = {
        emoteString = "Acaricias a <target>.", --Pet esES/esMX
        emote = "PET",
        relation = 2,
        language = "esES",
    },
    [39] = {
        emoteString = "Vous dansez avec <target>.", --Dance frFR
        emote = "DANCE",
        relation = 2,
        language = "frFR",
    },
    [40] = {
        emoteString = "Vous faites l’éloge <target>.", --Praise frFR
        emote = "PRAISE",
        relation = 2,
        language = "frFR",
    },
    [41] = {
        emoteString = "Vous cajolez <target>.", --Pet frFR
        emote = "PET",
        relation = 2,
        language = "frFR",
    },
    [42] = {
        emoteString = "Balli con <target>.", --Dance itIT
        emote = "DANCE",
        relation = 2,
        language = "itIT",
    },
    [43] = {
        emoteString = "Colmi di elogi <target>.", --Praise itIT
        emote = "PRAISE",
        relation = 2,
        language = "itIT",
    },
    [44] = {
        emoteString = "Accarezzi <target>.", --Pet itIT
        emote = "PET",
        relation = 2,
        language = "itIT",
    },
    [45] = {
        emoteString = "당신은 <target>과 신나게 춤을 춥니다.", --Dance koKR
        emote = "DANCE",
        relation = 2,
        language = "koKR",
    },
    [46] = {
        emoteString = "당신은 <target>에게 찬사를 보냅니다.", --Praise koKR
        emote = "PRAISE",
        relation = 2,
        language = "koKR",
    },
    [47] = {
        emoteString = "당신은 <target>을 귀여워합니다.", --Pet koKR
        emote = "PET",
        relation = 2,
        language = "koKR",
    },
    [48] = {
        emoteString = "Você dança com <target>.", --Dance ptBR"
        emote = "DANCE",
        relation = 2,
        language = "ptBR",
    },
    [49] = {
        emoteString = "Você enaltece <target> generosamente.", --Praise ptBR
        emote = "PRAISE",
        relation = 2,
        language = "ptBR",
    },
    [50] = {
        emoteString = "Você faz cafuné em <target>.", --Pet ptBR
        emote = "PET",
        relation = 2,
        language = "ptBR",
    },
    [51] = {
        emoteString = "Вы танцуете с <target>.", --Dance ruRU
        emote = "DANCE",
        relation = 2,
        language = "ruRU",
    },
    [52] = {
        emoteString = "Вы превозносите <target>.", --Praise ruRU
        emote = "PRAISE",
        relation = 2,
        language = "ruRU",
    },
    [53] = {
        emoteString = "Вы поглаживаете <target>.", --Pet ruRU
        emote = "PET",
        relation = 2,
        language = "ruRU",
    },
    [54] = {
        emoteString = "你在和<target>跳舞。", --Dance zhCN
        emote = "DANCE",
        relation = 2,
        language = "zhCN",
    },
    [55] = {
        emoteString = "你对于<target>大加赞赏。", --Praise zhCN
        emote = "PRAISE",
        relation = 2,
        language = "zhCN",
    },
    [56] = {
        emoteString = "你对<target>作出亲昵的表示。", --Pet zhCN
        emote = "PET",
        relation = 2,
        language = "zhCN",
    },
    [57] = {
        emoteString = "你在和<target>跳舞。", --Dance zhTW
        emote = "DANCE",
        relation = 2,
        language = "zhTW",
    },
    [58] = {
        emoteString = "你對於<target>大加讚賞。", --Praise zhTW
        emote = "PRAISE",
        relation = 2,
        language = "zhTW",
    },
    [59] = {
        emoteString = "你撫摸<target>。", --Pet zhTW
        emote = "PET",
        relation = 2,
        language = "zhTW",
    },
}

