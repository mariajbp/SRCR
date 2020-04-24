%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução/Involução de conhecimento
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Insere novo conhecimento na base de conhecimento
evolucao(T) :- evolucao(T, positivo).

% Insere conhecimento perfeito positivo na base de conhecimento
evolucao(T, positivo) :- solucoes(Inv, +T :: Inv, Linv),
                         insercao(T),
                         teste(Linv).

% Insere conhecimento perfeito negativo na base de conhecimento
evolucao(T, negativo) :- solucoes(Inv, +(-T) :: Inv, Linv),
                         insercao(-T),
                         teste(Linv).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito incerto

%--- Contrato

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de contrato desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TC_desconhecido,TProcedimento,D,V,P,L,DT), incerto, tipocontrato) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,desconhecido,TProcedimento,D,V,P,L,DT)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,desconhecido,TProcedimento,D,V,P,L,DT)),
    teste(Linv).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de procedimento desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TC,TProcedimento,D,V,P,L,DT), incerto, tipoprocedimento) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,TC,desconhecido,D,V,P,L,DT)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,TC,desconhecido,D,V,P,L,DT)),
    teste(Linv).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma descrição desconhecida
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D_desconhecida,V,P,L,DT), incerto, descricao) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,desconhecido,V,P,L,DT)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,desconhecido,V,P,L,DT)),
    teste(Linv).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma valor desconhecida
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,DT), incerto, valor) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,desconhecido,P,L,DT)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,desconhecido,P,L,DT)),
    teste(Linv).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um prazo desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P_desconhecido,L,DT) , incerto, prazo) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,desconhecido,L,DT)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,desconhecido,L,DT)),
    teste(Linv).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um local desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L_desconhecido,DT), incerto, local) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,desconhecido,DT)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,desconhecido,DT)),
    teste(Linv).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma data desconhecida
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,Data_desconhecida) , incerto, data) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,desconhecido)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,desconhecido)),
    teste(Linv).


%--- Adjudicante 

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nome desconhecido
evolucao(adjudicante(IdAd,Nome,Nif,Morada), incerto, nome) :-
    solucoes(Inv,+incerto(adjudicante(IdAd,desconhecido,Nif,Morada)) :: Inv, Linv),
    insercao(adjudicante(IdAd,desconhecido,Nif,Morada)),
    teste(Linv).


% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com uma morada desconhecida
evolucao(adjudicante(IdAd,Nome,Nif,Morada), incerto, morada) :-
    solucoes(Inv,+incerto(adjudicante(IdAd,Nome,Nif,desconhecido)) :: Inv, Linv),
    insercao(adjudicante(IdAd,Nome,Nif,desconhecido)),
    teste(Linv).

%--- Adjudicatária

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nome desconhecido
evolucao(adjudicataria(IdAd,Nome,Nif,Morada), incerto, nome) :-
    solucoes(Inv,+incerto(adjudicataria(IdAd,desconhecido,Nif,Morada)) :: Inv, Linv),
    insercao(adjudicataria(IdAd,desconhecido,Nif,Morada)),
    teste(Linv).

% Insere conhecimento imperfeito incerto na base de conhecimento de uma djudicataria com uma morada desconhecida
evolucao(adjudicataria(IdAd,Nome,Nif,Morada), incerto, morada) :-
    solucoes(Inv,+incerto(adjudicataria(IdAd,Nome,Nif,desconhecido)) :: Inv, Linv),
    insercao(adjudicataria(IdAd,Nome,Nif,desconhecido)),
    teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito impreciso

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com um tipo de contrato impreciso
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,tipocontrato):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com um tipo de procedimento impreciso
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,tipoprocedimento):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com uma descrição imprecisa
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,descricao):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com valoe impreciso
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,valor):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com um prazo impreciso
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,prazo):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com um local impreciso
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,local):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com uma data impreciso
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,data):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com um intervalo de valores
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT), impreciso, valor, LimiteInferior, LimiteSuperior) :-
    insercao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,L,DT)) :-
                      Val >= LimiteInferior, Val =< LimiteSuperior)).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com um intervalo de valores para o prazo
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT), impreciso, prazo, LimiteInferior, LimiteSuperior) :-
    insercao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,Pr,L,DT)) :-
                      Pr >= LimiteInferior, Pr =< LimiteSuperior)).

% Insere conhecimento imperfeito impreciso na base de conhecimento de um contrato com um intervalo de datas            
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Dt), impreciso, data, data(Di,Mi,Ai), data(Ds,Ms,As)) :-
    insercao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data(D,M,A))) :-
                      ((A > Ai);(A==Ai,(M>Mi;(M==Mi,D>=Di)))),((A < As);(A==As,(M<Ms;(M==Ms,D=<Ds)))))).


% Insere conhecimento imperfeito impreciso na base de conhecimento de um adjudicante com nome impreciso
evolucao(adjudicante(IdAd,Nome,Nif,M),impreciso,nome):-
    solucoes(Inv, +impreciso(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicante(IdAd,Nome,Nif,M))) ,
    teste(Linv).
% Insere conhecimento imperfeito impreciso na base de conhecimento de um adjudicante com morada imprecisa
evolucao(adjudicante(IdAd,Nome,Nif,M),impreciso,morada):-
    solucoes(Inv, +impreciso(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicante(IdAd,Nome,Nif,M))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de uma entidade adjudicataruia com nome impreciso
evolucao(adjudicataria(IdAd,Nome,Nif,M),impreciso,nome):-
    solucoes(Inv, +impreciso(adjudicataria(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicataria(IdAd,Nome,Nif,M))) ,
    teste(Linv).

% Insere conhecimento imperfeito impreciso na base de conhecimento de uma entidade adjudicataruia com morada imprecisa
evolucao(adjudicataria(IdAd,Nome,Nif,M),impreciso,morada):-
    solucoes(Inv, +impreciso(adjudicataria(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicataria(IdAd,Nome,Nif,M))) ,
    teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito interdito

% Insere conhecimento imperfeito interdito na base de conhecimento de um contrato com um tipo de contrato interdito
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,tipocontrato) :-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,tc_interdito,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,tc_interdito,TProcedimento,D,Valor,P,L,Data)),
    teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de um contrato com um tipo de procedimento interdito
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,tipoprocedimento) :-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,tp_interdito,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,tp_interdito,D,Valor,P,L,Data)),
    teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de um contrato com uma descrição interdita
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,descricao) :-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,descricao_interdita,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,descricao_interdita,Valor,P,L,Data)),
    teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de um contrato com valor interdito
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,valor) :-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valor_interdito,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valor_interdito,P,L,Data)),
    teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de um contrato com um prazo interdito
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,prazo) :-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,prazo_interdito,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,prazo_interdito,L,Data)),
    teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de um contrato com um local interdito
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,local):-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,local_interdito,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,local_interdito,Data)),
    teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de um contrato com uma data interdita
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,data):-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data_interdita)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data_interdita)),
    teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de uma entidade adjudicante com nome impreciso
evolucao(adjudicante(Id,Nome,Nif,Morada), interdito, nome ):-
        solucoes(Inv, +interdito(adjudicante(Id,nome_interdito,Nif,Morada)) :: Inv,Linv),
        insercao(adjudicante(Id, nome_interdito, Nif, Morada)),
        teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de uma entidade adjudicante com morada imprecisa
evolucao(adjudicante(Id,Nome,Nif,Morada), interdito, morada ):-
        solucoes(Inv, +interdito(adjudicante(Id,Nome,Nif,morada_interdita)) :: Inv,Linv),
        insercao(adjudicante(Id, Nome, Nif, morada_interdita)),
        teste(Linv).

% Insere conhecimento imperfeito interdito na base de conhecimento de uma entidade adjudicataria com nome impreciso
evolucao(adjudicataria(Id,Nome,Nif,Morada), interdito, nome ):-
        solucoes(Inv, +interdito(adjudicataria(Id,nome_interdito,Nif,Morada)) :: Inv,Linv),
        insercao(adjudicataria(Id, nome_interdito, Nif, Morada)),
        teste(Linv).       

% Insere conhecimento imperfeito interdito na base de conhecimento de uma entidade adjudicantaria com morada imprecisa         
evolucao(adjudicataria(Id,Nome,Nif,Morada), interdito, morada ):-
        solucoes(Inv, +interdito(adjudicataria(Id,Nome,Nif,morada_interdita)) :: Inv,Linv),
        insercao(adjudicataria(Id, Nome, Nif, morada_interdita)),
        teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
involucao(I):-involucao(I,positivo).

% Remove conhecimento perfeito positivo na base de conhecimento
involucao(T, positivo) :- solucoes(Inv, -T :: Inv, Linv),
                         remocao(T),
                         teste(Linv).

% Remove conhecimento perfeito negativo na base de conhecimento
involucao(T, negativo) :- solucoes(Inv, -(-T) :: Inv, Linv),
                         remocao(-T),
                         teste(Linv).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito incerto

%--- Contrato

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de contrato desconhecido
involucao(contrato(IdC,IdAd,IdAda,TC_desconhecido,TProcedimento,D,V,P,L,DT), incerto, tipocontrato) :-
    solucoes(Inv,-incerto(contrato(IdC,IdAd,IdAda,desconhecido,TProcedimento,D,V,P,L,DT)) :: Inv, Linv),
    remocao(contrato(IdC,IdAd,IdAda,desconhecido,TProcedimento,D,V,P,L,DT)),
    teste(Linv).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de procedimento desconhecido
involucao(contrato(IdC,IdAd,IdAda,TC,TProcedimento,D,V,P,L,DT), incerto, tipoprocedimento) :-
    solucoes(Inv,-incerto(contrato(IdC,IdAd,IdAda,TC,desconhecido,D,V,P,L,DT)) :: Inv, Linv),
    remocao(contrato(IdC,IdAd,IdAda,TC,desconhecido,D,V,P,L,DT)),
    teste(Linv).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com uma descrição desconhecida
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D_desconhecida,V,P,L,DT), incerto, descricao) :-
    solucoes(Inv,-incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,desconhecido,V,P,L,DT)) :: Inv, Linv),
    remocao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,desconhecido,V,P,L,DT)),
    teste(Linv).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com uma valor desconhecida
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,DT), incerto, valor) :-
    solucoes(Inv,-incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,desconhecido,P,L,DT)) :: Inv, Linv),
    remocao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,desconhecido,P,L,DT)),
    teste(Linv).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um prazo desconhecido
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P_desconhecido,L,DT) , incerto, prazo) :-
    solucoes(Inv,-incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,desconhecido,L,DT)) :: Inv, Linv),
    remocao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,desconhecido,L,DT)),
    teste(Linv).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um local desconhecido
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L_desconhecido,DT), incerto, local) :-
    solucoes(Inv,-incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,desconhecido,DT)) :: Inv, Linv),
    remocao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,desconhecido,DT)),
    teste(Linv).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com uma data desconhecida
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,Data_desconhecida) , incerto, data) :-
    solucoes(Inv,-incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,desconhecido)) :: Inv, Linv),
    remocao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,desconhecido)),
    teste(Linv).


%--- Adjudicante 

% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nome desconhecido
involucao(adjudicante(IdAd,Nome,Nif,Morada), incerto, nome) :-
    solucoes(Inv,-incerto(adjudicante(IdAd,desconhecido,Nif,Morada)) :: Inv, Linv),
    remocao(adjudicante(IdAd,desconhecido,Nif,Morada)),
    teste(Linv).


% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicante com uma morada desconhecida
involucao(adjudicante(IdAd,Nome,Nif,Morada), incerto, morada) :-
    solucoes(Inv,-incerto(adjudicante(IdAd,Nome,Nif,desconhecido)) :: Inv, Linv),
    remocao(adjudicante(IdAd,Nome,Nif,desconhecido)),
    teste(Linv).

%--- Adjudicatária

% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nome desconhecido
involucao(adjudicataria(IdAd,Nome,Nif,Morada), incerto, nome) :-
    solucoes(Inv,-incerto(adjudicataria(IdAd,desconhecido,Nif,Morada)) :: Inv, Linv),
    remocao(adjudicataria(IdAd,desconhecido,Nif,Morada)),
    teste(Linv).

% Remove conhecimento imperfeito incerto na base de conhecimento de uma djudicataria com uma morada desconhecida
involucao(adjudicataria(IdAd,Nome,Nif,Morada), incerto, morada) :-
    solucoes(Inv,-incerto(adjudicataria(IdAd,Nome,Nif,desconhecido)) :: Inv, Linv),
    remocao(adjudicataria(IdAd,Nome,Nif,desconhecido)),
    teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito impreciso
%% Contrato Impreciso por opçao
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,tipocontrato):-
    solucoes(Inv, -impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    remocao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,tipoprocedimento):-
    solucoes(Inv, -impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    remocao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,descricao):-
    solucoes(Inv, -impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    remocao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,valor):-
    solucoes(Inv, -impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    remocao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,prazo):-
    solucoes(Inv, -impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    remocao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,local):-
    solucoes(Inv, -impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    remocao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,data):-
    solucoes(Inv, -impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    remocao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

%% Contrato impreciso por intervalo
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT), impreciso, valor, LimiteInferior, LimiteSuperior) :-
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,L,DT)) :-
                      Val >= LimiteInferior, Val =< LimiteSuperior)).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT), impreciso, prazo, LimiteInferior, LimiteSuperior) :-
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,Pr,L,DT)) :-
                      Pr >= LimiteInferior, Pr =< LimiteSuperior)).
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Dt), impreciso, data, data(Di,Mi,Ai), data(Ds,Ms,As)) :-
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data(D,M,A))) :-
                      ((A > Ai);(A==Ai,(M>Mi;(M==Mi,D>=Di)))),((A < As);(A==As,(M<Ms;(M==Ms,D=<Ds)))))).

%% Adjudicante impreciso por opção
involucao(adjudicante(IdAd,Nome,Nif,M),impreciso,nome):-
    solucoes(Inv, -impreciso(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
    remocao(excecao(adjudicante(IdAd,Nome,Nif,M))) ,
    teste(Linv).

involucao(adjudicante(IdAd,Nome,Nif,M),impreciso,morada):-
    solucoes(Inv, -impreciso(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
    remocao(excecao(adjudicante(IdAd,Nome,Nif,M))) ,
    teste(Linv).

%% Adjudicataria impreciso por opção
involucao(adjudicataria(IdAd,Nome,Nif,M),impreciso,nome):-
    solucoes(Inv, -impreciso(adjudicataria(IdAd,Nome,Nif,M)) :: Inv,Linv),
    remocao(excecao(adjudicataria(IdAd,Nome,Nif,M))) ,
    teste(Linv).

involucao(adjudicataria(IdAd,Nome,Nif,M),impreciso,morada):-
    solucoes(Inv, -impreciso(adjudicataria(IdAd,Nome,Nif,M)) :: Inv,Linv),
    remocao(excecao(adjudicataria(IdAd,Nome,Nif,M))) ,
    teste(Linv).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento imperfeito interdito
%

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,tipocontrato) :-
    solucoes(Inv, -interdito(contrato(IdC,IdAd,IdAda,tc_interdito,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    remocao(contrato(IdC,IdAd,IdAda,tc_interdito,TProcedimento,D,Valor,P,L,Data)),
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,tipoprocedimento) :-
    solucoes(Inv, -interdito(contrato(IdC,IdAd,IdAda,tp_interdito,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,tp_interdito,D,Valor,P,L,Data)),
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,descricao) :-
    solucoes(Inv, -interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,descricao_interdita,Valor,P,L,Data)) :: Inv,Linv),
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,descricao_interdita,Valor,P,L,Data)),
    teste(Linv).
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,valor) :-
    solucoes(Inv, -interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valor_interdito,P,L,Data)) :: Inv,Linv),
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valor_interdito,P,L,Data)),
    teste(Linv).
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,prazo) :-
    solucoes(Inv, -interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,prazo_interdito,L,Data)) :: Inv,Linv),
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,prazo_interdito,L,Data)),
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,local):-
    solucoes(Inv, -interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,local_interdito,Data)) :: Inv,Linv),
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,local_interdito,Data)),
    teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,data):-
    solucoes(Inv, -interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data_interdita)) :: Inv,Linv),
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data_interdita)),
    teste(Linv).

%% Adjudicante Interdita
involucao(adjudicante(Id,Nome,Nif,Morada), interdito, nome ):-
        solucoes(Inv, -interdito(adjudicante(Id,nome_interdito,Nif,Morada)) :: Inv,Linv),
        remocao(adjudicante(Id, nome_interdito, Nif, Morada)),
        teste(Linv).

involucao(adjudicante(Id,Nome,Nif,Morada), interdito, morada ):-
        solucoes(Inv, -interdito(adjudicante(Id,Nome,Nif,morada_interdita)) :: Inv,Linv),
        remocao(adjudicante(Id, Nome, Nif, morada_interdita)),
        teste(Linv).

%% Adjudicataria Interdita
involucao(adjudicataria(Id,Nome,Nif,Morada), interdito, nome ):-
        solucoes(Inv, -interdito(adjudicataria(Id,nome_interdito,Nif,Morada)) :: Inv,Linv),
        remocao(adjudicataria(Id, nome_interdito, Nif, Morada)),
        teste(Linv).  

involucao(adjudicataria(Id,Nome,Nif,Morada), interdito, morada ):-
        solucoes(Inv, -interdito(adjudicataria(Id,Nome,Nif,morada_interdita)) :: Inv,Linv),
        remocao(adjudicataria(Id, Nome, Nif, morada_interdita)),
        teste(Linv).
