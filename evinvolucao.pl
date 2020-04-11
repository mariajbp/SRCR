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
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D_desconhecida,V,P,L,DT), incerto, desc) :-
    solucoes(Inv,+incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,desconhecido,V,P,L,DT)) :: Inv, Linv),
    insercao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,desconhecido,V,P,L,DT)),
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
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,valor) :-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valor_interdito,P,L,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,L,Data),
            nao(nulointerdito(Val))),R), comprimento(R,0))
    )),
    teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,morada):-
    solucoes(Inv, interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,morada_interdita,Data)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,L,Data),
            nao(nulointerdito(Local))),R), comprimento(R,0))
    )),
    teste(Linv).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),interdito,data):-
    solucoes(Inv, +interdito(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)) :: Inv,Linv),
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data_interdita)),
    insercao((+contrato(I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat) :: (solucoes((I,IdA,IdA,Tc,TP,Desc,Val,Pr,Local,Dat),(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Val,P,L,Data),
            nao(nulointerdito(Dat))),R), comprimento(R,0))
    )),
    teste(Linv).        
evolucao(adjudicante(IdAd,Nome,Nif,M), interdito, morada ):-
    solucoes(Inv, +interdito(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
    insercao(adjudicante(IdAd,Nome,Nif,morada_interdita)),
    insercao((+adjudicante(IdAd,Nome,Nif,M) :: (solucoes((IdAd,Nome,Nif,M),(
        adjudicante(IdAd,Nome,Nif,M),
        nao(nulointerdito(M))),R), comprimento(R,0))
    )),
    teste(Linv).

evolucao(adjudicante(IdAd,Nome,Nif,M), interdito, nome ):-
    solucoes(Inv, interdito(adjudicante(IdAd,nome_interdito,Nif,M)) :: Inv,Linv),
    insercao(adjudicante(IdAd,Nome,Nif,M)),
    insercao((+adjudicante(IdAd,Nome,Nif,M) :: (solucoes((IdAd,Nome,Nif,M),(
        adjudicante(IdAd,Nome,Nif,M),
        nao(nulointerdito(Nome))),R), comprimento(R,0))
    )),
    teste(Linv).
evolucao(adjudicante(IdAd,Nome,Nif,M), interdito, morada ):-
        solucoes(Inv, +interdito(adjudicataria(IdAd,Nome,Nif,M)) :: Inv,Linv),
        insercao(adjudicataria(IdAd,Nome,Nif,morada_interdita)),
        insercao((+adjudicataria(IdAd,Nome,Nif,M) :: (solucoes((IdAd,Nome,Nif,M),(
            adjudicataria(IdAd,Nome,Nif,M),
            nao(nulointerdito(M))),R), comprimento(R,0))
        )),
        teste(Linv).
    
evolucao(adjudicataria(IdAd,Nome,Nif,M), interdito, nome ):-
    solucoes(Inv, interdito(adjudicataria(IdAd,nome_interdito,Nif,M)) :: Inv,Linv),
    insercao(adjudicataria(IdAd,Nome,Nif,M)),
    insercao((+adjudicataria(IdAd,Nome,Nif,M) :: (solucoes((IdAd,Nome,Nif,M),(
        adjudicataria(IdAd,Nome,Nif,M),
        nao(nulointerdito(Nome))),R), comprimento(R,0))
    )),
    teste(Linv).
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involução de conhecimento perfeito (positivo e negativo)

% Retira conhecimento da base de conhecimento
involucao(T) :- solucoes(Inv, -T :: Inv, Linv),
                remocao(T),
                teste(Linv).

% Retira conhecimento perfeito positivo na base de conhecimento
involucao(T, positivo) :- solucoes(Inv, -T :: Inv, Linv),
                          remocao(T),
                          teste(Linv).

% Retira conhecimento perfeito negativo na base de conhecimento
involucao(T, negativo) :- solucoes(Inv, -(-T) :: I, Linv),
                          remocao(-T),
                          teste(Linv).

% Involuçao de conhecimento imperfeito incerto

%--- Contrato

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de contrato desconhecido
involucao(contrato(IdC,IdAd,IdAda,TC_desconhecido,TProcedimento,D,V,P,L,DT), contrato, incerto, tipocontrato) :-
    involucao(contrato(IdC,IdAd,IdAda,tC_desconhecido,TProcedimento,D,V,P,L,DT), positivo),
    remocao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                     contrato(IdC,NifAd,NifAda,tC_desconhecido,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de procedimento desconhecido
involucao(contrato(IdC,IdAd,IdAda,TContrato,_,D,V,P,L,DT), contrato, incerto, tipoprocedimento) :-
    involucao(contrato(IdC,IdAd,IdAda,TContrato,tP_desconhecido,D,V,P,L,DT), positivo),
    remocao( (excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,NifAda,TipoContrato,tP_desconhecido,Desc,Val,Prazo,Local,Data))).                    

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com uma descrição desconhecida
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D_desconhecida,V,P,L,DT), contrato, incerto, desc) :-
    involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,d_desconhecida,V,P,L,DT), positivo),
    remocao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                     contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,d_desconhecida,Val,Prazo,Local,Data))).     
  
% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um prazo desconhecido
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P_desconhecido,L,DT) ,contrato, incerto, prazo) :-
    involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,-1,L,DT), positivo),
    remocao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                     contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,-1,Local,Data))).    

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com um local desconhecido
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L_desconhecido,DT) ,contrato, incerto, local) :-
    involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,l_desconhecido,DT), positivo),
    remocao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                     contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,l_desconhecido,Data))).    

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com uma data desconhecida
involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,Data_desconhecida) ,contrato, incerto, data) :-
    involucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,data(-1,-1,-1), positivo),
    remocao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                     contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,data(-1,-1,-1))))).  


%--- Adjudicante 

% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nome desconhecido
involucao(adjudicante(IdAd,nome_Desconhecido,Nif,Morada), adjudicante, incerto, nome) :- involucao(adjudicante(IdAd,Nome_Desconhecido,Nif,Morada), positivo),
    remocao((excecao(adjudicante(Id,N,Nadj,M)) :- adjudicante(Id,nome_Desconhecido,Nadj,M))).

         
% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicante com uma morada desconhecida
involucao(adjudicante(IdAd,Nome,Nif,Morada_desconhecida), adjudicante, incerto, morada) :- involucao(adjudicante(IdAd,Nome,Nif,morada_desconhecida), positivo),
    remocao((excecao(adjudicante(Id,N,Nadj,M)) :- adjudicante(Id,N,Nadj,morada_desconhecida))).

%involucao(adjudicante(100,nome,10100009,morada_desconhecida), adjudicante, incerto, nome)
%--- Adjudicatária

% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nome desconhecido
involucao(adjudicataria(IdAd,Nome_Desconhecido,Nif,Morada), adjudicataria, incerto, nome) :-
    involucao(adjudicataria(IdAd,nome_Desconhecido,Nif,Morada), positivo),
    remocao((excecao(adjudicataria(Id,N,Nadj,M)) :- adjudicataria(Id,nome_Desconhecido,Nadj,M))).
            
% Remove conhecimento imperfeito incerto na base de conhecimento de uma djudicataria com uma morada desconhecida
involucao(adjudicataria(IdAd,Nome,Nif,Morada_desconhecida), adjudicataria, incerto, morada) :-
    involucao(adjudicataria(IdAd,Nome,Nif,morada_desconhecida), positivo),
    remocao((excecao(adjudicataria(Id,N,Nadj,M)) :- adjudicataria(Id,N,Nadj,morada_desconhecida))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involuçao de conhecimento imperfeito impreciso

% Remove conhecimento imperfeito impreciso na base de conhecimento de qualquer fonte de conhecimento
involucao(T, impreciso) :- solucoes(Inv, +(excecao(T)) :: Inv, Linv),
                          remocao(excecao(T)),
                          teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),contrato, impreciso, valor, LimiteInferior, LimiteSuperior) :-
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :-
        Valor >= LimiteInferior, Valor =< LimiteSuperior )).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),contrato, impreciso, prazo, LimiteInferior, LimiteSuperior) :-
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT) ):-
        P >= LimiteInferior, P =< LimiteSuperior)).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data(D,M,A)),contrato, impreciso, data, data(Di,Mi,Ai), data(Ds,Ms,As)) :-
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)) :-
        ((A > Ai);(A==Ai,(M>Mi;(M==Mi,D>=Di)))),((A < As);(A==As,(M<Ms;(M==Ms,D=<Ds)))))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involuçao de conhecimento imperfeito interdito
%
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,valor):-
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valorInterdito,P,L,Data)),
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)) :-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valorInterdito,P,L,Data))).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,morada):-
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,moradaInterdita,Data)),
    remocao((excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,moradaInterdita,Data))).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,data):-
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,dataInterdita)),
    remocao(( excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,dataInterdita))).

involucao(adjudicante(IdAd,Nome,Nif,M),adjudicante, interdito, morada ):- remocao(adjudicante(IdAd,Nome,Nif,moradaInterdita)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):- adjudicante(IdAd,Nome,Nif,moradaInterdita))).

involucao(adjudicante(IdAd,Nome,Nif,M),adjudicante, interdito, nome ):- remocao(adjudicante(IdAd,nomeInterdito,Nif,M)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):- adjudicante(IdAd,nomeInterdito,Nif,M))).

involucao(adjudicataria(IdAd,Nome,Nif,M),adjudicataria, interdito, morada ):- remocao(adjudicataria(IdAd,Nome,Nif,moradaInterdita)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):- adjudicataria(IdAd,Nome,Nif,moradaInterdita))).

involucao(adjudicataria(IdAd,Nome,Nif,M),adjudicataria, interdito, nome ):- remocao(adjudicataria(IdAd,nomeInterdito,Nif,M)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):- adjudicataria(IdAd,nomeInterdito,Nif,M))).