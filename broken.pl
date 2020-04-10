
involucao(adjudicante(21,nome,123456789,morada)).
evolucao(adjudicante(21,nome,123456789,morada)).

involucao(adjudicataria(21,nome,123456789,morada)).
evolucao(adjudicataria(21,nome,123456789,morada)).
evolucao(contrato(780,501413197,504099388, "Locacao de bens moveis", "Concurso Publico", "A", 210000, 30, "Porto", data(16,03,2030))).

evolucao(contrato(780,501413197,504099388, "Locacao de bens moveis", "Concurso Publico", "A", 210000, 30, "Porto", data(16,03,2040)), contrato, incerto, tipoprocedimento)

evolucao(contrato(40,600018709,502381973,idk,"Ajuste Direto",desc,340,25,local,data(1,1,2020)), incerto, tipocontrato).
involucao(contrato(40,600018709,502381973,idk,"Ajuste Direto",desc,340,25,local,data(1,1,2020)), incerto, tipocontrato).