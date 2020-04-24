%yes
evolucao(contrato(20,600018709,502381973, "Aquisicao","Ajuste Direto","desc", 4000, 195, "Lisboa", data(19,03,2020))).
involucao(contrato(20,600018709,502381973, "Aquisicao","Ajuste Direto","desc", 4000, 195, "Lisboa", data(19,03,2020))).

involucao(contrato(20,600018709,502381973, "Aquisicao","Ajuste Direto","desc", 4000, 195, "Lisboa", data(19,03,2020)), positivo).
%no
evolucao(contrato(20,123456789,502381973, "Aquisicao","Ajuste Direto","desc", 4000, 195, "Lisboa", data(19,03,2020))).


evolucao(adjudicante(21,nome,123456789,morada)).
involucao(adjudicante(21,nome,123456789,morada)).

evolucao(adjudicataria(21,nome,987654321,morada)).
involucao(adjudicataria(21,nome,123456789,morada)).


% ------------------------------- Insere conhecimento imperfeito incerto 
%yes
evolucao(contrato(31,600018709,502381973,idk,"Ajuste Direto","desc",340,25,"local",data(1,1,2020)), incerto, tipocontrato).
involucao(contrato(31,600018709,502381973,idk,"Ajuste Direto",desc,340,25,local,data(1,1,2020)),incerto, tipocontrato).
%no
evolucao(contrato(15,123456789,502381973,idk,"Ajuste Direto","desc",340,25,"local",data(1,1,2020)), incerto, tipocontrato). 

%yes
evolucao(contrato(30,600018709,502381973,"Aquisicao de servicos",idk,desc,340,25,local,data(1,1,2020)), incerto, tipoprocedimento).
involucao(contrato(30,600018709,502381973,"Aquisicao de servicos",idk,desc,340,25,local,data(1,1,2020)),incerto, tipoprocedimento).

%yes
evolucao(contrato(32,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)),incerto, descricao).
involucao(contrato(32,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)), incerto, descricao).

%yes
evolucao(contrato(33,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,-1,25,local,data(1,1,2020)),incerto, valor).
involucao(contrato(33,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,-1,25,local,data(1,1,2020)), incerto, valor).

%%prazos
% yes
evolucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,20,-1,local,data(1,1,2020)),incerto, prazo).
involucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,20,-1,local,data(1,1,2020)), incerto, prazo).

evolucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,20,25,local,data(1,1,2020)),incerto, prazo).

%yes
evolucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)), incerto, local).
involucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)),  incerto, local).

%%data
evolucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(-1,-1,-1)), incerto, data).

%% ---------- adjudicante & adjudicataria

evolucao(adjudicante(20,wtv,987654321,morada), incerto, nome).
involucao(adjudicante(20,wtv,987654321,morada), incerto, nome).

evolucao(adjudicante(20,wtv,987654321,morada), incerto, morada).
involucao(adjudicante(20,wtv,987654321,morada), incerto, morada).

% ------------------------------- Insere conhecimento imperfeito impreciso 
% Id,IdAd, IdAda, TipoDeContrato, TipoDeProcedimento, Descrição, Valor, Prazo, Local, Data -> {V,F,D}
%nao é suposto funcionar
evolucao(contrato(40,600018709,502381973,idk,"Ajuste Direto","desc",340,25,"local",data(1,1,2020)), impreciso, tipocontrato).
involucao(contrato(40,600018709,502381973,idk,"Ajuste Direto",desc,340,25,local,data(1,1,2020)),impreciso, tipocontrato).

%yes
evolucao(contrato(40,600218719,501181973,i,"Consulta Previa",desc,340,25,local,data(1,1,2020)),impreciso, tipocontrato).


evolucao(contrato(35,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)), impreciso, tipoprocedimento).
involucao(contrato(35,600018709,502381973,"Aquisicao de servicos",idk,desc,340,25,local,data(1,1,2020)),impreciso, tipoprocedimento).

evolucao(contrato(36,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)),impreciso, descricao).
involucao(contrato(36,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)), impreciso, descricao).

%%prazos
evolucao(contrato(37,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,-1,25,local,data(1,1,2020)),impreciso, valor).
involucao(contrato(37,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,-1,25,local,data(1,1,2020)), impreciso, valor).


evolucao(contrato(38,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,20,-1,local,data(1,1,2020)),impreciso, prazo).
involucao(contrato(38,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,20,-1,local,data(1,1,2020)), impreciso, prazo).


evolucao(contrato(39,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)), impreciso, local).
involucao(contrato(39,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)),  impreciso, local).

%%data
evolucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(-1,-1,-1)), impreciso, data).

%no 
evolucao(contrato(40,123456789,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(-1,-1,-1)), impreciso, data).


%% ---------- adjudicante & adjudicataria

evolucao(adjudicante(20,wtv,987654321,morada), impreciso, nome).
involucao(adjudicante(20,wtv,987654321,morada), impreciso, nome).

involucao(adjudicante(21,wtv,123456789,morada), impreciso, morada).


% ------------------------------- Insere conhecimento imperfeito interdito 
% Id,IdAd, IdAda, TipoDeContrato, TipoDeProcedimento, Descrição, Valor, Prazo, Local, Data -> {V,F,D}
evolucao(contrato(40,600018709,502381973,idk,"Ajuste Direto","desc",340,25,"local",data(1,1,2020)), interdito, tipocontrato).
involucao(contrato(40,600018709,502381973,idk,"Ajuste Direto",desc,340,25,local,data(1,1,2020)),interdito, tipocontrato).


evolucao(contrato(23,600018709,502381973,"Aquisicao de servicos",idk,desc,340,25,local,data(1,1,2020)), interdito, tipoprocedimento).
involucao(contrato(23,600018709,502381973,"Aquisicao de servicos",idk,desc,340,25,local,data(1,1,2020)),interdito, tipoprocedimento).

evolucao(contrato(24,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)),interdito, descricao).
involucao(contrato(23,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)), interdito, descricao).

evolucao(contrato(25,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,-1,25,local,data(1,1,2020)),interdito, valor).

%%prazos
evolucao(contrato(25,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,20,-1,local,data(1,1,2020)),interdito, prazo).
involucao(contrato(25,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,20,-1,local,data(1,1,2020)), interdito, prazo).


evolucao(contrato(26,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)), interdito, local).
involucao(contrato(27,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(1,1,2020)),  interdito, local).

%%data
evolucao(contrato(40,600018709,502381973,"Aquisicao de servicos","Ajuste Direto",desc,340,25,local,data(-1,-1,-1)), interdito, data).

%% ---------- adjudicante

%yes
evolucao(adjudicante(20,wtv,987654321,morada), interdito, nome).
involucao(adjudicante(20,wtv,987654321,morada), interdito, nome).
%yes
evolucao(adjudicante(21,wtv,123456789,morada), interdito, morada).
involucao(adjudicante(21,wtv,123456789,morada), interdito, morada).
%no
evolucao(adjudicante(20,wtv,600018709,morada), interdito, nome).

