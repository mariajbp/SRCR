%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante que garante que não existe conhecimento perfeito positivo repetido
+CPP :: (solucoes(CPP, CPP, S), comprimento(R, 1)).

% Invariante que garante que não existe conhecimento perfeito negativo repetido

% Invariante que não permite adicionar conhecimento perfeito positivo que contradiz conhecimento perfeito negativo

% Invariante que não permite adicionar conhecimento perfeito negativo que contradiz conhecimento perfeito positivo

% Invariante que garante que não existem excecoes repetidas
+(excecao(E)) :: (solucoes(E, excecao(E), R), comprimento(R, 1)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Contrato

% Garantir que cada contrato só tem 1 dos 3 tipos de procedimentos possiveis
+contrato(X1,X2,X3,TProcedimento,X4,X5,X6,X7,X8) :- contrato(X1,X2,X3,ajuste_direto,X4,X5,X6,X7,X8);
                                                    contrato(X1,X2,X3,consulta_previa,X4,X5,X6,X7,X8);
                                                    contrato(X1,X2,X3,concurso_publico,X4,X5,X6,X7,X8).


% Garantir que o id do adjudicante associado ao contrato existe
+contrato(IdAd,_,_,_,_,_,_,_,_) :: (solucoes(IdAd, contrato(IdAd,_,_,_,_,_,_,_,_), R),
                           					 comprimento(R, 1)).

% Garantir que o id da adjudicataria associado ao contrato existe
+contrato(_,IdAda,_,_,_,_,_,_,_) :: (solucoes(IdAda, contrato(_,IdAda,_,_,_,_,_,_,_), R),
                           			 comprimento(R, 1)).												


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Adjudicante

%Garantir que o id e nif de cada Adjudicante é único
+adjudicante(IdAd,Nome,Nif,Morada) :: (solucoes(IdAd, adjudicante(IdAd,_,_,_),R), comprimento(R,1),
									  (solucoes(Nif, adjudicataria(_,Nif,_,_),R2), comprimento(R2,1))).

% Garantir que adjudicantes com ids diferentes têm diferente informação
% para conhecimento perfeito positivo
+adjudicante(IdAd,Nome,Nif,Morada) :: (solucoes((Nome, Nif,Morada), adjudicante(_,Nome,Nif,Morada), R), 
									   comprimento(R,1)).

% Garantir que não é possível remover uma entidade adjudicataria com um contrato
-adjudicante(_,_,Nif,_) :: (solucoes(Nif), contrato(Nif,_,_,_,_,_,_,_,_), R,
                            comprimento(R, 0)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Adjudicataria

%Garantir que o id e nif de cada entidade adjudicataria é único
+adjudicataria(IdAda, Nome, Nif, Morada) :: (solucoes(IdAda,adjudicataria(IdAda,_,_,_),R),comprimento(R,1),
											(solucoes(Nif,adjudicataria(_,Nif,_,_),R2),comprimento(R2,1))).

% Garantir que entidades adjudicatarias com ids diferentes têm diferente informação
% para conhecimento perfeito positivo
+adjudicataria(IdAd,Nome,Nif,Morada) :: (solucoes((Nome, Nif,Morada), adjudicataria(_,Nome,Nif,Morada), R), 
									     comprimento(R,1)).

% Garantir que não é possível remover uma entidade adjudicataria com um contrato
-adjudicataria(_,_,Nif,_) :: (solucoes(Nif), contrato(_,Nif,_,_,_,_,_,_,_), R,
                              comprimento(R, 0)).