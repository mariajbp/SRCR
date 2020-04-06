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
+contrato(X1,X2,X3,TProcedimento,X4,X5,X6,X7,X8) :: (contrato(X1,X2,X3,ajuste_direto,X4,X5,X6,X7,X8);
                                                    contrato(X1,X2,X3,consulta_previa,X4,X5,X6,X7,X8);
                                                    contrato(X1,X2,X3,concurso_publico,X4,X5,X6,X7,X8)).

%Garantir que o valor do contrato por ajuste direto é igual ou inferior a 5000 euros
+contrato(_,_,_,ajuste_direto,_,V,_,_,_) :: (V=<5000).

%Garantir que o contrato por ajuste direto é um contrato de aquisicao ou locacao de bens moveis ou aquisicao de serviços
+contrato(_,_,TContrato,ajuste_direto,_,_,_,_,_) :: (+contrato(_,_,aquisicao,ajuste_direto,_,_,_,_,_);
  													 +contrato(_,_,locacao_bens_moveis,ajuste_direto,_,_,_,_,_);
   													 +contrato(_,_,aquisicao_servicos,ajuste_direto,_,_,_,_,_)).

% Prazo de vigencia ate 1 ano
+contrato(_,_,_,ajustedireto,_,_,Prazo,_,_) :: (Prazo =< 365).


% Garantir que o id do adjudicante associado ao contrato existe
+contrato(IdAd,_,_,_,_,_,_,_,_) :: (solucoes(IdAd, contrato(IdAd,_,_,_,_,_,_,_,_), R),
                           					 comprimento(R, 1)).

% Garantir que o id da adjudicataria associado ao contrato existe
+contrato(_,IdAda,_,_,_,_,_,_,_) :: (solucoes(IdAda, contrato(_,IdAda,_,_,_,_,_,_,_), R),
										comprimento(R, 1)).	
										

%Regra dos 3 anos válida para todos os contratos
%solucoes((Aa,Ar,Vl,Dt), contrato(Aa,Ar,_,_,_,Vl,_,_,Dt),L).
menos3Anos(Dt,Data):- split_string(Dt,"-", SubStrDt),split_string(Data,"-", SubStrData),
					nth(2, SubStrDt, YDt),nth(2, SubStrData, YData),
					number_codes(NYDt, YDt),number_codes(NYData, YData),
					SubY is YData-YDt, SubY=<3.
sumVals([],0).
sumVals([(Vl,Dt)|T],Ret):- Ret2 is Ret+Vl, sumVals(T,Ret2).											


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
						
% Garantir que o nif do adjudicante é válido
+adjudicante(_,_,Nif,_) :: ((Nif>=100000000),(Nif=<999999999)).
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

% Garantir que o nif da adjudicataria é válido
+adjudicataria(_,_,Nif,_) :: ((Nif>=100000000),(Nif=<999999999)).