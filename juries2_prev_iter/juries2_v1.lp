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

numPres(P, N) :- prof(P, _, _, _), N = #count{ T : pres(T, P) }.
numSup(P, N) :- prof(P, _, _, _), N = #count{ T : thesis(T, P, _) }.
numMain(P, N) :- prof(P, _, _, _), N = #count{ T : mainEx(T, P, _) }.

totalEffort(P, E) :- prof(P, _, _, _), numPres(P, NPres), numSup(P, NSup), numMain(P, NMain), E = NPres + NSup + 2*NMain.

#minimize { E*E, P : totalEffort(P, E) }.

#show pres/2.
