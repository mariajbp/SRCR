%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Predicados Auxiliares
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado não: Q -> {V,F}

% Devolve o valor de verdade contrário a Q (negação fraca)
nao(Q) :- Q, !, fail.
nao(Q).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soluções: X,XS,R -> {V,F}

% Encontra todas as soluções
solucoes(X, XS, R) :- findall(X, XS, R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: X,R -> {V,F}
% Devolve o comprimento de uma lista
comprimento([],0).
comprimento([_|XS],R) :- comprimento( XS,S ), R is 1 + S.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inserção de conhecimento
insercao(Q) :- assert(Q).
insercao(Q) :- retract(Q), !, fail.

% Remoção de conhecimento
remocao(Q) :- retract(Q).
remocao(Q) :- assert(Q), !, fail.

% Testa se todos os predicados são verdadeiros
teste([]).
teste([I|L]) :- I, teste(L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Nif válido
nifValido(Nif) :- (Nif >= 100000000), Nif =< 999999999.

% Valor válido (>= 0)
valorValido(V) :- V >= 0.

menos3Anos(data(_,_,NYDt),data(_,_,NYData)):-SubY is NYData-NYDt, SubY =< 3.
sumVals([V],V).
sumVals([Vl|T],Ret):- sumVals(T,Ret2), Ret is Ret2+Vl.

