%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante que garante que não existe conhecimento perfeito positivo repetido
+contrato(A,B,C,D,E,F,G,H,I,J)		:: (solucoes(A,contrato(A,B,C,D,E,F,G,H,I,J),L),comprimento(L,1)).
+adjudicante(A,B,C,D) 				:: (solucoes(A,adjudicante(A,B,C,D),L),comprimento(L,1)).
+adjudicataria(A,B,C,D) 			:: (solucoes(A,adjudicataria(A,B,C,D),L),comprimento(L,1)).
% Invariante que garante que não existe conhecimento perfeito negativo repetido
+(-contrato(A,B,C,D,E,F,G,H,I,J)) 	:: (solucoes(A,-contrato(A,B,C,D,E,F,G,H,I,J),L),comprimento(L,1)).
+(-adjudicante(A,B,C,D)) 			:: (solucoes(A,-adjudicante(A,B,C,D),L),comprimento(L,1)).
+(-adjudicataria(A,B,C,D)) 			:: (solucoes(A,-adjudicataria(A,B,C,D),L),comprimento(L,1)).
% Invariante que garante que não existe conhecimento imperfeito incerto repetido
+incerto(CII) 						:: (solucoes(CII, CII, R),comprimento(R, 1)).
% Invariante que garante que não existe conhecimento imperfeito impreciso repetido
+impreciso(CII) 					:: (solucoes(CII, CII, R),comprimento(R, 1)).
% Invariante que garante que não existe conhecimento imperfeito interdito repetido
+interdito(CII) 					:: (solucoes(CII, CII, R),comprimento(R, 1)).
% Invariante que garante que não existem excecoes repetidas
+(excecao(E)) :: (solucoes(E, excecao(E), R), comprimento(R, 1)).
% Invariante que não permite adicionar conhecimento perfeito positivo que contradiz conhecimento perfeito negativo
+contrato(A,B,C,D,E,F,G,H,I,J)		:: nao(solucoes(A,-contrato(A,B,C,D,E,F,G,H,I,J),L),comprimento(L,1)).
+adjudicante(A,B,C,D) 				:: nao(solucoes(A,-adjudicante(A,B,C,D),L),comprimento(L,1)).
+adjudicataria(A,B,C,D) 			:: nao(solucoes(A,-adjudicataria(A,B,C,D),L),comprimento(L,1)).
% Invariante que não permite adicionar conhecimento perfeito negativo que contradiz conhecimento perfeito positivo
+(-contrato(A,B,C,D,E,F,G,H,I,J)) 	:: nao(solucoes(A,contrato(A,B,C,D,E,F,G,H,I,J),L),comprimento(L,1)).
+(-adjudicante(A,B,C,D)) 			:: nao(solucoes(A,adjudicante(A,B,C,D),L),comprimento(L,1)).
+(-adjudicataria(A,B,C,D)) 			:: nao(solucoes(A,adjudicataria(A,B,C,D),L),comprimento(L,1)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Contrato
%Garantir que não há 2 contratos com ids iguais
+incerto(contrato(IdC,_,_,_,_,_,_,_,_,_)) :: (solucoes(IdC, contrato(IdC,_,_,_,_,_,_,_,_,_),R), comprimento(R,1)).
+impreciso(contrato(IdC,_,_,_,_,_,_,_,_,_)) :: (solucoes(IdC, contrato(IdC,_,_,_,_,_,_,_,_,_),R), comprimento(R,1)).
+interdito(contrato(IdC,_,_,_,_,_,_,_,_,_)) :: (solucoes(IdC, contrato(IdC,_,_,_,_,_,_,_,_,_),R), comprimento(R,1)).
+contrato(IdC,_,_,_,_,_,_,_,_,_) :: (solucoes(IdC, contrato(IdC,_,_,_,_,_,_,_,_,_),R), comprimento(R,1)).

% Garantir que cada contrato só tem 1 dos 3 tipos de procedimentos possiveis
+contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,DT) :: (contrato(IdC,IdAd,IdAda,TContrato,"Ajuste Direto",D,V,P,L,DT);
															     contrato(IdC,IdAd,IdAda,TContrato,"Consulta Previa",D,V,P,L,DT);
                                                     		     contrato(IdC,IdAd,IdAda,TContrato,"Concurso Publico",D,V,P,L,DT)).
+incerto(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,DT)) :: (contrato(IdC,IdAd,IdAda,TContrato,desconhecido,D,V,P,L,DT);
																		  contrato(IdC,IdAd,IdAda,TContrato,"Ajuste Direto",D,V,P,L,DT);
															    		  contrato(IdC,IdAd,IdAda,TContrato,"Consulta Previa",D,V,P,L,DT);
                                                     		    		  contrato(IdC,IdAd,IdAda,TContrato,"Concurso Publico",D,V,P,L,DT)).
+impreciso(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,DT)) :: (excecao(contrato(IdC,IdAd,IdAda,TContrato,"Ajuste Direto",D,V,P,L,DT));
																			excecao(contrato(IdC,IdAd,IdAda,TContrato,"Consulta Previa",D,V,P,L,DT));
																			excecao(contrato(IdC,IdAd,IdAda,TContrato,"Concurso Publico",D,V,P,L,DT))).
+interdito(contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,D,V,P,L,DT)) :: (excecao(contrato(IdC,IdAd,IdAda,TContrato,procedimentoInterdito,D,V,P,L,DT));
																			excecao(contrato(IdC,IdAd,IdAda,TContrato,"Ajuste Direto",D,V,P,L,DT));
																			excecao(contrato(IdC,IdAd,IdAda,TContrato,"Consulta Previa",D,V,P,L,DT));
																			excecao(contrato(IdC,IdAd,IdAda,TContrato,"Concurso Publico",D,V,P,L,DT))).
%Garantir que o valor do contrato por ajuste direto é igual ou inferior a 5000 euros
+contrato(IdC,_,_,_,"Ajuste Direto",_,V,_,_,_) :: (V =< 5000).
+incerto(contrato(IdC,_,_,_,"Ajuste Direto",_,V,_,_,_)) :: (contrato(IdC,_,_,_,"Ajuste Direto",_,desconhecido,_,_,_) ; V =< 5000).

%------------------------------------------------------------------------------------------------------------%
%                                                                                                            %
%                                                                                                            %
%                                                     TO DO                                                   %
%                                                                                                            %
%                                                                                                            %
%                                                                                                            %
%------------------------------------------------------------------------------------------------------------%

%Garantir que o contrato por ajuste direto é um contrato de aquisicao ou locacao de bens moveis ou aquisicao de serviços ou desconheciodo
+contrato(IdC,_,_,TContrato,"Ajuste Direto",_,_,_,_,_) :: (contrato(IdC,_,_,"Aquisicao","Ajuste Direto",_,_,_,_,_);
													   contrato(IdC,_,_,"Locacao de bens moveis","Ajuste Direto",_,_,_,_,_);
													   contrato(IdC,_,_,tC_desconhecido,"Ajuste Direto",_,_,_,_,_);
   													 contrato(IdC,_,_,"Aquisicao de servicos","Ajuste Direto",_,_,_,_,_)).

% Prazo de vigencia ate 1 ano
+contrato(IdC,_,_,_,"Ajuste Direto",_,_,Prazo,_,_) :: Prazo=<365.
										
%Regra dos 3 anos válida para todos os contratos
+contrato(IdC,IdAd,IdAda,TContrato,TProcedimento,Descricao,Val,Prazo,Local,Data)::(solucoes(Vl, (contrato(_,IdAd,IdAda,_,_,_,Vl,_,_,Dt),(Vl =\= -1),menos3Anos(Dt,Data)),L),
                                                                                sumVals([-Val|L],Ret),
                                                                                Ret<75000).

menos3Anos(data(_,_,NYDt),data(_,_,NYData)):-SubY is NYData-NYDt, SubY =< 3.

sumVals([V],V).
sumVals([Vl|T],Ret):- sumVals(T,Ret2), Ret is Ret2+Vl.

% Garantir que o valor de cada contrato é válido (>= 0) para conhecimento perfeito positivo
+contrato(IdC,_,_,_,_,_,V,_,_,_) :: valorValido(V).

% Garantir que o valor de cada contrato é válido (>= 0) para conhecimento perfeito negativo
+(-contrato(IdC,_,_,_,_,_,V,_,_,_)) :: valorValido(V).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Adjudicante

%Garantir que o id e nif de cada entidade adjudicante é único para conhecimento perfeito positivo
+adjudicante(IdAd,Nome,Nif,Morada) :: (solucoes(IdAd, adjudicante(IdAd,_,_,_),R), comprimento(R,1),
									  (solucoes(Nif, adjudicante(_,_,Nif,_),R2), comprimento(R2,1))).

% Garantir que adjudicantes com ids diferentes têm diferente informação para conhecimento perfeito positivo
+adjudicante(IdAd,Nome,Nif,Morada) :: (solucoes((Nome, Nif,Morada), adjudicante(_,Nome,Nif,Morada), R), 
									   comprimento(R,1)).

% Garantir que adjudicantes com ids diferentes têm diferente informação para conhecimento perfeitonegativo
+(-adjudicante(IdAd,Nome,Nif,Morada)) :: (solucoes((Nome, Nif,Morada), -adjudicante(_,Nome,Nif,Morada), R), 
									   comprimento(R,1)).									

% Garantir que não é possível remover uma entidade adjudicataria com um contrato 
-adjudicante(_,_,Nif,_) :: (solucoes(Nif, contrato(IdC,Nif,_,_,_,_,_,_,_,_), R),
                            comprimento(R, 0)).
						
% Garantir que o nif do adjudicante é válido para conhecimento positivo
+adjudicante(_,_,Nif,_) :: nifValido(Nif).

% Garantir que o nif do adjudicante é válido para conhecimento negatuvo
+(-adjudicante(_,_,Nif,_)) :: nifValido(Nif).

%--------------------------------- - - - - - - - - - -  -  -  -  -   - 
%evolucao(contrato(40,600018709,502381973,TC_desconhecido,ajuste_direto,desc,500,30,local,data(1,1,2020)), contrato,incerto,tipocontrato).
% Invariantes Estruturais e Referenciais: Adjudicataria
%+contrato(100,506696464,980474710, aquisicao_servicos, ajuste_direto, "R", 2800, 30, "V", data(16,02,2010)).

%Garantir que o id e nif de cada entidade adjudicataria é único
+adjudicataria(IdAda, Nome, Nif, Morada) :: (solucoes(IdAda,adjudicataria(IdAda,_,_,_),R),comprimento(R,1),
											(solucoes(Nif,adjudicataria(_,_,Nif,_),R2),comprimento(R2,1))).

% Garantir que entidades adjudicatarias com ids diferentes têm diferente informação
% para conhecimento perfeito positivo
+adjudicataria(IdAd,Nome,Nif,Morada) :: (solucoes((Nome, Nif,Morada), adjudicataria(_,Nome,Nif,Morada), R), 
									     comprimento(R,1)).

% Garantir que não é possível remover uma entidade adjudicataria com um contrato
-adjudicataria(_,_,Nif,_) :: (solucoes(Nif, contrato(IdC,_,Nif,_,_,_,_,_,_,_), R),
                              comprimento(R, 0)).

% Garantir que o nif da adjudicataria é válido
+adjudicataria(_,_,Nif,_) :: (nifValido(Nif)).