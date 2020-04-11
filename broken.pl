
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
contrato(20,A,B,C,D,_,_,_,_,_).
evolucao(contrato(40,600218719,501181973,lol,"Concurso",desc,340,25,local,data(1,1,2020)),impreciso, tipocontrato).
excecao(contrato(40,600218719,501181973,lol,"Ajuste Direto",desc,340,25,local,data(1,1,2020)))


evolucao(contrato(40,600018709,502381973,idk,"Ajuste Direto","desc",340,25,"local",data(1,1,2020)), impreciso, tipocontrato).

evolucao(contrato(20,123456789,502381973, "Aquisicao","Ajuste Direto",desc, 4000, 195, "Lisboa", data(19,03,2020))).
evolucao(, incerto, nome).
(adjudicataria(20,nomee,987654321,morada)).
evolucao(contrato(41,600028709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)),impreciso, valor).