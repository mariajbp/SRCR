%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais
%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariante que garante que não existe conhecimento perfeito positivo repetido
+CPP :: (solucoes(CPP, CPP, S), comprimento(S, 1)).

% Invariante que garante que não existe conhecimento perfeito negativo repetido

% Invariante que não permite adicionar conhecimento perfeito positivo que contradiz conhecimento perfeito negativo

% Invariante que não permite adicionar conhecimento perfeito negativo que contradiz conhecimento perfeito positivo

% Invariante que garante que não existem excecoes repetidas
+(excecao(E)) :: (solucoes(E, excecao(E), S), comprimento(S, 1)).

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Contrato

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Adjudicante

%- - - - - - - - - - - - - - - - - - - - - - - - - - -  -  -  -  -   -
% Invariantes Estruturais e Referenciais: Adjudicataria