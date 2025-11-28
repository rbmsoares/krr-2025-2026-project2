prof(p001,full,section1,1).
prof(p002,associate,section1,0).
prof(p003,assistant,section1,0).

prof(p004,full,section2,1).
prof(p005,associate,section2,0).
prof(p006,assistant,section2,0).

prof(p007,full,section3,1).
prof(p008,associate,section3,0).
prof(p009,assistant,section3,0).

prof(p010,full,section4,1).
prof(p011,associate,section4,0).
prof(p012,assistant,section4,0).

prof(p013,full,section5,1).
prof(p014,associate,section5,0).
prof(p015,assistant,section5,0).

limit(p001,3).
limit(p004,3).
limit(p007,2).

thesis(t001,p002,0).
mainEx(t001,p003,assistant).

thesis(t002,p005,0).
mainEx(t002,p006,assistant).

thesis(t003,p008,0).
mainEx(t003,p009,assistant).

thesis(t004,p011,0).
mainEx(t004,p012,assistant).

thesis(t005,p014,0).
mainEx(t005,p015,assistant).

thesis(t006,p002,0).
coSup(t006,p003).
mainEx(t006,p006,assistant).

thesis(t007,p005,0).
mainEx(t007,p009,assistant).

thesis(t008,p008,1).
mainEx(t008,p012,assistant).

thesis(t009,p011,0).
mainEx(t009,p015,assistant).

thesis(t010,p014,0).
mainEx(t010,p002,associate).

thesis(t011,p002,0).
mainEx(t011,p009,assistant).

thesis(t012,p005,1).
mainEx(t012,p015,assistant).

thesis(t013,p008,0).
mainEx(t013,p002,associate).

thesis(t014,p011,0).
mainEx(t014,p005,associate).

thesis(t015,p014,0).
mainEx(t015,p008,associate).