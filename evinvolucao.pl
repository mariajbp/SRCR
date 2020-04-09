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

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma entidade adjudicante desconhecida
evolucao(contrato(IdC,Nif_desconhecido,IdAda,TContrato,TProcedimento,D,V,P,L,DT), contrato, incerto, idAd) :-
    evolucao(contrato(IdC,-1,IdAda,TContrato,TProcedimento,D,V,P,L,DT), positivo),
    insercao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,-1,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma entidade adjudicataria desconhecida
evolucao(contrato(IdC,IdAd,Nif_desconhecido,TContrato,TProcedimento,D,V,P,L,DT), contrato, incerto, idAda) :-
    evolucao(contrato(IdC,IdAd,-1,TContrato,TProcedimento,D,V,P,L,DT), positivo),
    insercao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,-1,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de contrato desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TC_desconhecido,TProcedimento,D,V,P,L,DT), contrato, incerto, tipocontrato) :-
    evolucao(contrato(IdC,IdAd,IdAda,tC_desconhecido,TProcedimento,D,V,P,L,DT), positivo),
    insercao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,NifAda,tC_desconhecido,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um tipo de procedimento desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TContrato,_,D,V,P,L,DT), contrato, incerto, tipoprocedimento) :-
    evolucao(contrato(IdC,IdAd,IdAda,TContrato,tP_desconhecido,D,V,P,L,DT), positivo),
    insercao( (excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,NifAda,TipoContrato,tP_desconhecido,Desc,Val,Prazo,Local,Data))).                    

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma descrição desconhecida
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D_desconhecida,V,P,L,DT), contrato, incerto, desc) :-
    evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,d_desconhecida,V,P,L,DT), positivo),
    insercao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,d_desconhecida,Val,Prazo,Local,Data))).     
  
% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um prazo desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P_desconhecido,L,DT) ,contrato, incerto, prazo) :-
    evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,-1,L,DT), positivo),
    insercao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,-1,Local,Data))).    

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com um local desconhecido
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L_desconhecido,DT) ,contrato, incerto, local) :-
    evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,l_desconhecido,DT), positivo),
    insercao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,l_desconhecido,Data))).    

% Insere conhecimento imperfeito incerto na base de conhecimento de um contrato com uma data desconhecida
evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,Data_desconhecida) ,contrato, incerto, data) :-
    evolucao(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,data(-1,-1,-1), positivo),
    insercao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,data(-1,-1,-1))))).  


%--- Adjudicante 

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nome desconhecido
evolucao(adjudicante(IdAd,nome_Desconhecido,Nif,Morada), adjudicante, incerto, nome) :-
    evolucao(adjudicante(IdAd,Nome_Desconhecido,Nif,Morada), positivo),
    insercao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,nome_Desconhecido,Nadj,M))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nif desconhecido
evolucao(adjudicante(IdAd,Nome,Nif_desconhecido,Morada), adjudicante, incerto, nif) :-
    evolucao(adjudicante(IdAd,Nome,-1,Morada), positivo),
    insercao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,N,-1,M))).
                
% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicante com uma morada desconhecida
evolucao(adjudicante(IdAd,Nome,Nif,Morada_desconhecida), adjudicante, incerto, morada) :-
    evolucao(adjudicante(IdAd,Nome,Nif,morada_desconhecida), positivo),
    insercao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,N,Nadj,morada_desconhecida))).

%evolucao(adjudicante(100,nome,10100009,morada_desconhecida), adjudicante, incerto, nome)
%--- Adjudicatária

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nome desconhecido
evolucao(adjudicataria(IdAd,Nome_Desconhecido,Nif,Morada), adjudicataria, incerto, nome) :-
    evolucao(adjudicataria(IdAd,nome_Desconhecido,Nif,Morada), positivo),
    insercao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,nome_Desconhecido,Nadj,M))).

% Insere conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nif desconhecido
evolucao(adjudicataria(IdAd,Nome,Nif_desconhecido,Morada), adjudicataria, incerto, nif) :-
    evolucao(adjudicataria(IdAd,Nome,-1,Morada), positivo),
    insercao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,N,-1,M))).
                
% Insere conhecimento imperfeito incerto na base de conhecimento de uma djudicataria com uma morada desconhecida
evolucao(adjudicataria(IdAd,Nome,Nif,Morada_desconhecida), adjudicataria, incerto, morada) :-
    evolucao(adjudicataria(IdAd,Nome,Nif,morada_desconhecida), positivo),
    insercao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,N,Nadj,morada_desconhecida))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito impreciso

% Insere conhecimento imperfeito impreciso na base de conhecimento de qualquer fonte de conhecimento
evolucao(T, impreciso) :- solucoes(Inv, +(excecao(T)) :: Inv, Linv),
                          insercao(excecao(T)),
                          teste(Linv).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),contrato, impreciso, valor, LimiteInferior, LimiteSuperior) :-
    insercao((
        excecao(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)
        ) :-
        Valor >= LimiteInferior, Valor =< LimiteSuperior
    )).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),contrato, impreciso, prazo, LimiteInferior, LimiteSuperior) :-
    insercao((
        excecao(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT) 
        ):-
        P >= LimiteInferior, P =< LimiteSuperior
    )).

evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data(D,M,A)),contrato, impreciso, data, data(Di,Mi,Ai), data(Ds,Ms,As)) :-
    insercao((
        excecao(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)
        ) :-
        ((A > Ai);(A==Ai,(M>Mi;(M==Mi,D>=Di)))),((A < As);(A==As,(M<Ms;(M==Ms,D=<Ds))))
    )).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Evolução de conhecimento imperfeito interdito
%
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,valor):-
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valorInterdito,P,L,Data)),
    insercao((
        excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valorInterdito,P,L,Data)
    )).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,morada):-
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,moradaInterdita,Data)),
    insercao((
        excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,moradaInterdita,Data)
    )).
evolucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,data):-
    insercao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,dataInterdita)),
    insercao((
        excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,dataInterdita)
    )).
evolucao(adjudicante(IdAd,Nome,Nif,M),adjudicante, interdito, morada ):-
    insercao(adjudicante(IdAd,Nome,Nif,moradaInterdita)),
    insercao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicante(IdAd,Nome,Nif,moradaInterdita)
    )).
evolucao(adjudicante(IdAd,Nome,Nif,M),adjudicante, interdito, nome ):-
    insercao(adjudicante(IdAd,nomeInterdito,Nif,M)),
    insercao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicante(IdAd,nomeInterdito,Nif,M)
    )).
evolucao(adjudicataria(IdAd,Nome,Nif,M),adjudicataria, interdito, morada ):-
    insercao(adjudicataria(IdAd,Nome,Nif,moradaInterdita)),
    insercao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicataria(IdAd,Nome,Nif,moradaInterdita)
    )).
evolucao(adjudicataria(IdAd,Nome,Nif,M),adjudicataria, interdito, nome ):-
    insercao(adjudicataria(IdAd,nomeInterdito,Nif,M)),
    insercao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicataria(IdAd,nomeInterdito,Nif,M)
    )).
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

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com uma entidade adjudicante desconhecida
involucao(contrato(IdC,Nif_desconhecido,IdAda,TContrato,TProcedimento,D,V,P,L,DT), contrato, incerto, idAd) :-
    involucao(contrato(IdC,-1,IdAda,TContrato,TProcedimento,D,V,P,L,DT), positivo),
    remocao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,-1,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

% Remove conhecimento imperfeito incerto na base de conhecimento de um contrato com uma entidade adjudicataria desconhecida
involucao(contrato(IdC,IdAd,Nif_desconhecido,TContrato,TProcedimento,D,V,P,L,DT), contrato, incerto, idAda) :-
    involucao(contrato(IdC,IdAd,-1,TContrato,TProcedimento,D,V,P,L,DT), positivo),
    remocao((excecao(contrato(IdC,NifAd,NifAda,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data)) :-
                      contrato(IdC,NifAd,-1,TipoContrato,TipoProcedimento,Desc,Val,Prazo,Local,Data))).

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
involucao(adjudicante(IdAd,nome_Desconhecido,Nif,Morada), adjudicante, incerto, nome) :-
    involucao(adjudicante(IdAd,Nome_Desconhecido,Nif,Morada), positivo),
    remocao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,nome_Desconhecido,Nadj,M))).

% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicante com um nif desconhecido
involucao(adjudicante(IdAd,Nome,Nif_desconhecido,Morada), adjudicante, incerto, nif) :-
    involucao(adjudicante(IdAd,Nome,-1,Morada), positivo),
    remocao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,N,-1,M))).
                
% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicante com uma morada desconhecida
involucao(adjudicante(IdAd,Nome,Nif,Morada_desconhecida), adjudicante, incerto, morada) :-
    involucao(adjudicante(IdAd,Nome,Nif,morada_desconhecida), positivo),
    remocao((excecao(adjudicante(Id,N,Nadj,M)) :-
                      adjudicante(Id,N,Nadj,morada_desconhecida))).

%involucao(adjudicante(100,nome,10100009,morada_desconhecida), adjudicante, incerto, nome)
%--- Adjudicatária

% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nome desconhecido
involucao(adjudicataria(IdAd,Nome_Desconhecido,Nif,Morada), adjudicataria, incerto, nome) :-
    involucao(adjudicataria(IdAd,nome_Desconhecido,Nif,Morada), positivo),
    remocao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,nome_Desconhecido,Nadj,M))).

% Remove conhecimento imperfeito incerto na base de conhecimento de um adjudicataria com um nif desconhecido
involucao(adjudicataria(IdAd,Nome,Nif_desconhecido,Morada), adjudicataria, incerto, nif) :-
    involucao(adjudicataria(IdAd,Nome,-1,Morada), positivo),
    remocao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,N,-1,M))).
                
% Remove conhecimento imperfeito incerto na base de conhecimento de uma djudicataria com uma morada desconhecida
involucao(adjudicataria(IdAd,Nome,Nif,Morada_desconhecida), adjudicataria, incerto, morada) :-
    involucao(adjudicataria(IdAd,Nome,Nif,morada_desconhecida), positivo),
    remocao((excecao(adjudicataria(Id,N,Nadj,M)) :-
                      adjudicataria(Id,N,Nadj,morada_desconhecida))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involuçao de conhecimento imperfeito impreciso

% Remove conhecimento imperfeito impreciso na base de conhecimento de qualquer fonte de conhecimento
involucao(T, impreciso) :- solucoes(Inv, +(excecao(T)) :: Inv, Linv),
                          remocao(excecao(T)),
                          teste(Linv).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),contrato, impreciso, valor, LimiteInferior, LimiteSuperior) :-
    remocao((
        excecao(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)
        ) :-
        Valor >= LimiteInferior, Valor =< LimiteSuperior
    )).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT),contrato, impreciso, prazo, LimiteInferior, LimiteSuperior) :-
    remocao((
        excecao(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT) 
        ):-
        P >= LimiteInferior, P =< LimiteSuperior
    )).

involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,data(D,M,A)),contrato, impreciso, data, data(Di,Mi,Ai), data(Ds,Ms,As)) :-
    remocao((
        excecao(
            contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,DT)
        ) :-
        ((A > Ai);(A==Ai,(M>Mi;(M==Mi,D>=Di)))),((A < As);(A==As,(M<Ms;(M==Ms,D=<Ds))))
    )).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Involuçao de conhecimento imperfeito interdito
%
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,valor):-
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valorInterdito,P,L,Data)),
    remocao((
        excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,valorInterdito,P,L,Data)
    )).
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,morada):-
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,moradaInterdita,Data)),
    remocao((
        excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,moradaInterdita,Data)
    )).
involucao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data),contrato,interdito,data):-
    remocao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,dataInterdita)),
    remocao((
        excecao(contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,Data)):-
        contrato(IdC,IdAd,IdAda,TipoContrato,TProcedimento,D,Valor,P,L,dataInterdita)
    )).
involucao(adjudicante(IdAd,Nome,Nif,M),adjudicante, interdito, morada ):-
    remocao(adjudicante(IdAd,Nome,Nif,moradaInterdita)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicante(IdAd,Nome,Nif,moradaInterdita)
    )).
involucao(adjudicante(IdAd,Nome,Nif,M),adjudicante, interdito, nome ):-
    remocao(adjudicante(IdAd,nomeInterdito,Nif,M)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicante(IdAd,nomeInterdito,Nif,M)
    )).
involucao(adjudicataria(IdAd,Nome,Nif,M),adjudicataria, interdito, morada ):-
    remocao(adjudicataria(IdAd,Nome,Nif,moradaInterdita)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicataria(IdAd,Nome,Nif,moradaInterdita)
    )).
involucao(adjudicataria(IdAd,Nome,Nif,M),adjudicataria, interdito, nome ):-
    remocao(adjudicataria(IdAd,nomeInterdito,Nif,M)),
    remocao((excecao(adjudicante(IdAd,Nome,Nif,M)):-
    adjudicataria(IdAd,nomeInterdito,Nif,M)
    )).