prof(p001,full,section1,1).
prof(p002,associate,section1,0).
prof(p003,assistant,section1,0).

prof(p004,full,section2,1).
prof(p005,associate,section2,0).
prof(p006,assistant,section2,0).

prof(p007,full,section3,1).
prof(p008,associate,section3,0).

limit(p001,1).
limit(p004,2).

thesis(t001,p002,0).
mainEx(t001,p003,assistant).

thesis(t002,p005,0).
mainEx(t002,p006,assistant).

thesis(t003,p002,0).
mainEx(t003,p006,assistant).

thesis(t004,p005,0).
mainEx(t004,p003,assistant).

thesis(t005,p008,0).
mainEx(t005,p002,associate).