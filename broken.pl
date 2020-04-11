
involucao(adjudicante(21,nome,123456789,morada)).
evolucao(adjudicante(21,nome,123456789,morada)).

involucao(adjudicataria(21,nome,123456789,morada)).
evolucao(adjudicataria(21,nome,123456789,morada)).
evolucao(contrato(780,501413197,504099388, "Locacao de bens moveis", "Concurso Publico", "A", 210000, 30, "Porto", data(16,03,2030))).

evolucao(contrato(780,501413197,504099388, "Locacao de bens moveis", "Concurso Publico", "A", 210000, 30, "Porto", data(16,03,2040)), contrato, incerto, tipoprocedimento)

evolucao(contrato(40,600018709,502381973,idk,"Ajuste Direto",desc,340,25,local,data(1,1,2020)), incerto, tipocontrato).
involucao(contrato(40,600018709,502381973,idk,"Ajuste Direto",desc,340,25,local,data(1,1,2020)), incerto, tipocontrato).

evolucao(adjudicante(IdAd,Nome,Nif,Morada), incerto, nome) :-
    solucoes(Inv,+incerto(adjudicante(IdAd,Nome,Nif,Morada)) :: Inv, Linv),
    insercao(adjudicante(IdAd,Nome,Nif,Morada)),
    teste(Linv).

solucoes(Inv, interdito(adjudicante(IdAd,Nome,Nif,M)) :: Inv,Linv),
insercao(adjudicante(IdAd,Nome,Nif,M)),
insercao((+adjudicante(IdAd,Nome,Nif,M) :: (solucoes((IdAd,Nome,Nif,M),(
    adjudicante(IdAd,Nome,Nif,M),
    nao(nulointerdito(interdito))),R), comprimento(R,0)).
)),
teste(Linv).

evolucao(contrato(40,600218719,501181973,lol,"Ajuste Direto",desc,340,25,local,data(1,1,2020)),impreciso, tipocontrato).

