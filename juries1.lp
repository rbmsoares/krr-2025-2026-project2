below(assistant,associate).
below(assistant,full).
below(associate,full).

{ president(T, P) : prof(P, _, _, _) } = 1 :- thesis(T, _, _).

:- president(T, P), thesis(T, P, _).
:- president(T, P), coSup(T, P).
:- president(T, P), mainEx(T, P, _).
:- president(T, Pres), thesis(T, Sup, _), prof(Sup, _, Sec, _), prof(Pres, _, Sec, _).
:- president(T, Pres), mainEx(T, Exam, _), prof(Exam, _, Sec, _), prof(Pres, _, Sec, _).
:- president(T, Pres), coSup(T, CoSup), prof(CoSup, _, Sec, _), prof(Pres, _, Sec, _).
:- prof(P, _, _, _), limit(P, Max), #count{ T : president(T, P) } > Max.
:- thesis(T, Sup, 1), mainEx(T, Exam, _), president(T, Pres), not prof(Sup, _, _, _), prof(Exam, _, _, 0), prof(Pres, _, _, 0).
:- president(T, Pres), thesis(T, Sup, _), prof(Sup, CatSup, _, _), prof(Pres, CatPres, _, _), below(CatPres, CatSup).
:- president(T, Pres), mainEx(T, _, CatExam), prof(Pres, CatPres, _, _), below(CatPres, CatExam).

#show president/2.