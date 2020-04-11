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

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma valor desconhecido
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
%% Contrato Impreciso por opçao
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,tipocontrato):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,tipoprocedimento):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,descricao):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,valor):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,prazo):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,local):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),impreciso,data):-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :: Inv,Linv),
    insercao(excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT))) ,
    teste(Linv).

%% Contrato impreciso por intervalo
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT), impreciso, valor, LimiteInferior, LimiteSuperior) :-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,L,DT)) :: Inv,Linv),
    insercao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,L,DT)) :-
                      Val >= LimiteInferior, Val =< LimiteSuperior)),
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT), impreciso, prazo, LimiteInferior, LimiteSuperior) :-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,Pr,L,DT)) :: Inv,Linv),
    insercao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,Pr,L,DT)) :-
                      Pr >= LimiteInferior, Pr =< LimiteSuperior)),
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Dt), impreciso, data, data(Di,Mi,Ai), data(Ds,Ms,As)) :-
    solucoes(Inv, +impreciso(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data(D,M,A))) :: Inv,Linv),
    insercao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data(D,M,A))) :-
                      ((A > Ai);(A==Ai,(M>Mi;(M==Mi,D>=Di)))),((A < As);(A==As,(M<Ms;(M==Ms,D=<Ds)))))),
    teste(Linv).




%% Adjudicante impreciso por opção
evolucao(adjudicante(IdAd,Nome,Nif,M),impreciso,nome):-
    solucoes(Inv, +impreciso(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicante(IdAd,Nome,Nif,M))) ,
    teste(Linv).

evolucao(adjudicante(IdAd,Nome,Nif,M),impreciso,morada):-
    solucoes(Inv, +impreciso(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicante(IdAd,Nome,Nif,M))) ,
    teste(Linv).

%% Adjudicataria impreciso por opção
evolucao(adjudicataria(IdAd,Nome,Nif,M),impreciso,nome):-
    solucoes(Inv, +impreciso(adjudicataria(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicataria(IdAd,Nome,Nif,M))) ,
    teste(Linv).

evolucao(adjudicataria(IdAd,Nome,Nif,M),impreciso,morada):-
    solucoes(Inv, +impreciso(adjudicataria(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(excecao(adjudicataria(IdAd,Nome,Nif,M))) ,
    teste(Linv).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito interdito
%
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,tipocontrato) :-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,tc_interdito,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,tc_interdito,TProcedimento,D,Valor,P,L,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,T,TProcedimento,D,Valor,P,L,Data),
            nao(nulointerdito(T))),R), comprimento(R,0))
    )),
    teste(Linv).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,tipoprocedimento) :-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,tp_interdito,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,tp_interdito,D,Valor,P,L,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TPr,D,Valor,P,L,Data),
            nao(nulointerdito(TPr))),R), comprimento(R,0))
    )),
    teste(Linv).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,tipocontrato) :-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,descricao_interdita,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,descricao_interdita,Valor,P,L,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,Des,Valor,P,L,Data),
            nao(nulointerdito(Des))),R), comprimento(R,0))
    )),
    teste(Linv).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,valor) :-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valor_interdito,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valor_interdito,P,L,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,V,P,L,Data),
            nao(nulointerdito(V))),R), comprimento(R,0))
    )),
    teste(Linv).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,prazo) :-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,prazo_interdito,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,prazo_interdito,L,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,Pra,L,Data),
            nao(nulointerdito(Pra))),R), comprimento(R,0))
    )),
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,morada):-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,morada_interdita,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,morada_interdita,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,Loc,Data),
            nao(nulointerdito(Loc))),R), comprimento(R,0))
    )),
    teste(Linv).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,data):-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data_interdita)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data_interdita)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),
            nao(nulointerdito(Dat))),R), comprimento(R,0))
    )),
    teste(Linv).

%% Adjudicante Interdita
evolucao(adjudicante(Id,Nome,Nif,Morada), interdito, nome ):-
        solucoes(Inv, +interdito(adjudicante(Id,nome_interdito,Nif,Morada)) :: Inv,Linv),
        insercao(adjudicante(Id, nome_interdito, Nif, Morada)),
        insercao((+adjudicante(A,B,C,D) :: ( solucoes( (A,B,C,D),(adjudicante(Id,N,Nif,Morada),nao(nulointerdito(N))),R),
                        comprimento(R,0)))),
        teste(Linv).

evolucao(adjudicante(Id,Nome,Nif,Morada), interdito, morada ):-
        solucoes(Inv, +interdito(adjudicante(Id,Nome,Nif,morada_interdita)) :: Inv,Linv),
        insercao(adjudicante(Id, Nome, Nif, morada_interdita)),
        insercao((+adjudicante(A,B,C,D) :: ( solucoes( (A,B,C,D),(adjudicante(Id,Nome,Nif,M),nao(nulointerdito(M))),R),
                        comprimento(R,0)))),
        teste(Linv).
%% Adjudicataria Interdita
evolucao(adjudicataria(Id,Nome,Nif,Morada), interdito, nome ):-
        solucoes(Inv, +interdito(adjudicataria(Id,nome_interdito,Nif,Morada)) :: Inv,Linv),
        insercao(adjudicataria(Id, nome_interdito, Nif, Morada)),
        insercao((+adjudicataria(A,B,C,D) :: ( solucoes( (A,B,C,D),(adjudicataria(Id,N,Nif,Morada),nao(nulointerdito(N))),R),
                        comprimento(R,0)))),
        teste(Linv).        
evolucao(adjudicataria(Id,Nome,Nif,Morada), interdito, morada ):-
        solucoes(Inv, +interdito(adjudicataria(Id,Nome,Nif,morada_interdita)) :: Inv,Linv),
        insercao(adjudicataria(Id, Nome, Nif, morada_interdita)),
        insercao((+adjudicataria(A,B,C,D) :: ( solucoes( (A,B,C,D),(adjudicataria(Id,Nome,Nif,M),nao(nulointerdito(M))),R),
                        comprimento(R,0)))),
        teste(Linv).

