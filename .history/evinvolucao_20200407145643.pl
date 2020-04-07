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

                        