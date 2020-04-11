evolucao(contrato(40,600218719,501181973,"Aquisicao","Ajuste Direto",desc,340,25,local,data(1,1,2020)),incerto, descricao).


evolucao(contrato(40,600218719,501181973,"Aquisicao",p,desc,340,25,local,data(1,1,2020)),impreciso, tipoprocedimento).


evolucao(contrato(40,600218719,501181973,"Aquisicao","Consulta Previa",desc,v,25,local,data(1,1,2020)),impreciso, valor,2,3).
solucoes(Inv, +impreciso(contrato(40,600218719,501181973,"Aquisicao","Consulta Previa",desc,range,25,local,data(1,1,2020))) :: Inv,Linv).

[
(solucoes(contrato(40,600218719,501181973,[65,113,117,105,115,105|...],[67,111,110,115,117,108|...],desc,range,25,local,data(1,1,2020)),excecao(contrato(40,600218719,501181973,[65,113,117,105,115|...],[67,111,110,115,117|...],desc,range,25,local,data(1,1,2020))),_A),comprimento(_A,1)),
(excecao(contrato(40,600218719,501181973,[65,113,117,105,115,105|...],[65,106,117,115,116,101|...],desc,range,25,local,data(1,1,2020)));
    excecao(contrato(40,600218719,501181973,[65,113,117,105,115|...],[67,111,110,115,117|...],desc,range,25,local,data(1,1,2020)));
    excecao(contrato(40,600218719,501181973,[65,113,117,105,115|...],[67,111,110,99,117|...],desc,range,25,local,data(1,1,2020)))
),
(intervalo(range);valorValido(range))
]
solucoes(yee,excecao(contrato(40,_,_,_,_,_,2,_,_,_)),L).


evolucao(contrato(40,600018709,502381973,idk,"Ajuste Direto","desc",340,25,"local",data(1,1,2020)), interdito, tipocontrato).