prof(p001,full,section1,1).
prof(p002,associate,section1,0).
prof(p003,assistant,section1,0).

prof(p004,full,section2,1).
prof(p005,associate,section2,0).
prof(p006,assistant,section2,0).

thesis(t001,p002,0).
coSup(t001,p003).
mainEx(t001,p006,assistant).

thesis(t002,p005,0).
coSup(t002,p006).
mainEx(t002,p002,associate).