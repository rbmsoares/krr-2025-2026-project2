below(assistant,associate).
below(assistant,full).
below(associate,full).

isProf(P) :- prof(P, _, _, _).

{ pres(T, P) : isProf(P) } = 1 :- thesis(T, _, _).

:- pres(T, P), thesis(T, P, _).
:- pres(T, P), coSup(T, P).
:- pres(T, P), mainEx(T, P, _).
sectionConflictSup(T, Pres) :- pres(T, Pres), thesis(T, Sup, _), prof(Sup, _, Sec, _), prof(Pres, _, Sec, _).
:- sectionConflictSup(T, Pres).
sectionConflictMain(T, Pres) :- pres(T, Pres), mainEx(T, Exam, _), prof(Exam, _, Sec, _), prof(Pres, _, Sec, _).
:- sectionConflictMain(T, Pres).

presidentCount(P, N) :- isProf(P), N = #count{ T : pres(T, P) }.


:- presidentCount(P, N), limit(P, Max), N > Max.

isCompanyThesis(T) :- thesis(T, Sup, 1), not isProf(Sup).
needsCommission(T) :- isCompanyThesis(T), mainEx(T, Exam, _), prof(Exam, _, _, 0).
:- needsCommission(T), pres(T, Pres), prof(Pres, _, _, 0).

categoryViolationSup(T) :- pres(T, Pres), thesis(T, Sup, _), prof(Sup, CatSup, _, _), prof(Pres, CatPres, _, _), below(CatPres, CatSup).
:- categoryViolationSup(T).

categoryViolationMain(T) :- pres(T, Pres), mainEx(T, _, CatExam), prof(Pres, CatPres, _, _), below(CatPres, CatExam).
:- categoryViolationMain(T).

presCount(P, N) :- isProf(P), N = #count{ T : pres(T, P) }.
supCount(P, N) :- isProf(P), N = #count{ T : thesis(T, P, _) }.
mainCount(P, N) :- isProf(P), N = #count{ T : mainEx(T, P, _) }.

effort(P, E) :- isProf(P), presCount(P, Pres), supCount(P, Sup), mainCount(P, Main), E = Pres + Sup + 2*Main.

#minimize { E*E, P : effort(P, E) }.

#show pres/2.
