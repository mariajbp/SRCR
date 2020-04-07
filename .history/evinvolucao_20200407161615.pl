%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução/Involução de conhecimento
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Insere novo conhecimento na base de conhecimento
evolucao(T) :- solucoes(Inv,+T::Inv,Linv),
               insercao(T),
               teste(Linv).

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

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma entidade adjudicante desconhecida
evolucao(contrato(Nif_desconhecido,IdAda,TContrato,TProcedimento,D,V,P,L,DT) contrato, incerto, idAd) :-
    evolucao(contrato(Nif_desconhecido,IdAda,TContrato,TProcedimento,D,V,P,L,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(Nif_desconhecido,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma entidade adjudicataria desconhecida
evolucao(contrato(IdAd,Nif_desconhecido,TContrato,TProcedimento,D,V,P,L,DT) contrato, incerto, idAda) :-
    evolucao(contrato(IdAd,Nif_desconhecido,TContrato,TProcedimento,D,V,P,L,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,Nif_desconhecido,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de contrato desconhecido
evolucao(contrato(IdAd,IdAda,TC_desconhecido,TProcedimento,D,V,P,L,DT) contrato, incerto, tipocontrato) :-
    evolucao(contrato(IdAd,IdAda,TC_desconhecido,TProcedimento,D,V,P,L,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,NifAda,TC_desconhecido,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de procedimento desconhecido
evolucao(contrato(IdAd,IdAda,TContrato,TP_desconhecido,D,V,P,L,DT) contrato, incerto, tipoprocedimento) :-
    evolucao(contrato(IdAd,IdAda,TContrato,TP_desconhecido,D,V,P,L,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,NifAda,TipoContrato,TP_desconhecido,Desc,Val,Prazo,Local,Data))).                    

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma descrição desconhecida
evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D_desconhecida,V,P,L,DT) contrato, incerto, desc) :-
    evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D_desconhecida,V,P,L,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,D_desconhecida,Val,Prazo,Local,Data))).     

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um valor desconhecido
evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V_desconhecido,P,L,DT) contrato, incerto, valor) :-
    evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V_desconhecido,P,L,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,V_desconhecido,Prazo,Local,Data))).    

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um prazo desconhecido
evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V,P_desconhecido,L,DT) contrato, incerto, prazo) :-
    evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V,P_desconhecido,L,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,P_desconhecido,Local,Data))).    

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um local desconhecido
evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V,P,L_desconhecido,DT) contrato, incerto, local) :-
    evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V,P,L_desconhecido,DT), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,L_desconhecido,Data))).    

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma data desconhecida
evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,Data_desconhecida) contrato, incerto, data) :-
    evolucao(contrato(IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,Data_desconhecida), positivo),
    insercao((excecao(contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data_desconhecida))).  


%--- Adjudicante

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nome desconhecido
evolucao(adjudicante(IdAd,Nome_Desconhecido,Nif,Morada), adjudicante, incerto, nome) :-
    evolucao(adjudicante(IdAd,Nome_Desconhecido,Nif,Morada), positivo),
    insercao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,Nome_Desconhecido,Nadj,M))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nif desconhecido
evolucao(adjudicante(IdAd,Nome,Nif_desconhecido,Morada), adjudicante, incerto, nif) :-
    evolucao(adjudicante(IdAd,Nome,Nif_desconhecido,Morada), positivo),
    insercao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,N,NNif_desconhecido,M))).
                
% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com uma morada desconhecida
evolucao(adjudicante(IdAd,Nome,Nif,Morada_desconhecida), adjudicante, incerto, morada) :-
    evolucao(adjudicante(IdAd,Nome,Nif,Morada_desconhecida), positivo),
    insercao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,N,Nadj,Morada_desconhecida))).


%--- Adjudicatária

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nome desconhecido
evolucao(adjudicataria(IdAd,Nome_Desconhecido,Nif,Morada), adjudicataria, incerto, nome) :-
    evolucao(adjudicataria(IdAd,Nome_Desconhecido,Nif,Morada), positivo),
    insercao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,Nome_Desconhecido,Nadj,M))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nif desconhecido
evolucao(adjudicataria(IdAd,Nome,Nif_desconhecido,Morada), adjudicataria, incerto, nif) :-
    evolucao(adjudicataria(IdAd,Nome,Nif_desconhecido,Morada), positivo),
    insercao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,N,NNif_desconhecido,M))).
                
% Insere conhecimento imperfeito incerto na base de conhecimento de uma djudicataria com uma morada desconhecida
evolucao(adjudicataria(IdAd,Nome,Nif,Morada_desconhecida), adjudicataria, incerto, morada) :-
    evolucao(adjudicataria(IdAd,Nome,Nif,Morada_desconhecida), positivo),
    insercao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,N,Nadj,Morada_desconhecida))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito impreciso

% Insere conhecimento imperfeito impreciso na base de conhecimento de qualquer fonte de conhecimento
evolucao(T, impreciso) :- solucoes(Inv, +(excecao(T)) :: Inv, Lint),
                          insercao(excecao(T)),
                          teste(Linv).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito interdito



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