below(assistant,associate).
below(assistant,full).
below(associate,full).

{ pres(T, P) : prof(P, _, _, _) } = 1 :- thesis(T, _, _).

:- pres(T, P), thesis(T, P, _).
:- pres(T, P), coSup(T, P).
:- pres(T, P), mainEx(T, P, _).
:- pres(T, Pres), thesis(T, Sup, _), prof(Sup, _, Sec, _), prof(Pres, _, Sec, _).
:- pres(T, Pres), mainEx(T, Exam, _), prof(Exam, _, Sec, _), prof(Pres, _, Sec, _).
:- prof(P, _, _, _), limit(P, Max), #count{ T : pres(T, P) } > Max.
:- thesis(T, Sup, 1), mainEx(T, Exam, _), pres(T, Pres), not prof(Sup, _, _, _), prof(Exam, _, _, 0), prof(Pres, _, _, 0).
:- pres(T, Pres), thesis(T, Sup, _), prof(Sup, CatSup, _, _), prof(Pres, CatPres, _, _), below(CatPres, CatSup).
:- pres(T, Pres), mainEx(T, _, CatExam), prof(Pres, CatPres, _, _), below(CatPres, CatExam).


presCount(P, N) :- prof(P, _, _, _), N = #count{ T : pres(T, P) }.
supCount(P, N) :- prof(P, _, _, _), N = #count{ T : thesis(T, P, _) }.
mainExCount(P, N) :- prof(P, _, _, _), N = #count{ T : mainEx(T, P, _) }.


effort(P, E) :- prof(P, _, _, _),
    presCount(P, Pres),
    supCount(P, Sup),
    mainExCount(P, Main),
    E = Pres + Sup + 2*Main.

#minimize { E*E, P : effort(P, E) }.

#show pres/2.
