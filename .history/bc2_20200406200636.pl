%Extensao do predicato Contrato: IdAd, IdAda, TipoDeContrato, TipoDeProcedimento, Descrição, Valor, Prazo, Local, Data -> {V,F,D}

% ------- Conhecimento Perfeito Positivo
contrato(600018709,502381973, "Aquisicao de servicos", "Ajuste Direto", "Aquisicao de servicos de acesso da Base de Dados Juridicos", 4000, "195 dias", "Lisboa", "19-03-2020").
contrato(506696464,809589087, "Aquisicao de serviços", "Ajuste Direto", "Reparacao e Conservacao de Escolas - Fornecimento de aluminos", 2800, "30 dias", "Vila Flor", "16-02-2020").
contrato(506901173,515204463, "Aquisicao de servicos", "Ajuste Direto", "Obras de Demolicao e Reposicao da Legalidade De Anexo", 4694.60, "25 dias", "Braga", "11-03-2020").
contrato(502011378,980474710, "Aquisicao de bens moveis", "Concurso publico", "Aquisicao de um microscopio 2Photon", 320000, "105 dias", "Braga", '31-03-2020').
contrato(680047360,500853975, "Aquisicao de bens moveis", "Concurso publico", "Aquisicao de Cafe por lotes para os anos de 2020 e 2021", 157275, "353 dias", "Braga", "13-01-2020").
contrato(501413197,504099388, "Locacao de bens moveis", "Concurso publico", "Aquisicao de nos de computacao (servidores) para cloud interna", 210000, "30 dias", "Porto", "16-03-2020").
contrato(600084779,502443855, "Aquisicao de servicos", "Consulta Previa", "Aquisicao de servicos de desenvolvimento aplicacional dos sistemas de informacao da Autoridade Tributaria e Aduaneira", 201400, "210 dias", "19-02-2020").
contrato(600006638,504654748, "Aquisicao de bens moveis", "Consulta Previa", "Aquisicao de 2 equipamentos multifuncionais", 10980, "30 dias", "12-03-2020").


% ------- Conhecimento Perfeito Negativo
-contrato(501128840,502605731, "Aquisicao de servicos", "Ajuste Direto", "Prestacao de Servicos de Informatica para a Gestao dos Clientes", 4800.50, "365 dias", "17-03-2020").


% ------- Conhecimento Imperfeito Incerto
%Não se sabe o prazo do contrato
contrato(506346773, 503504564, "Locacao de bens moveis", "Concurso publico", "Fornecimento de energia eletrica em BTN e MT para as instalacoes da GESAMB", 1780.22, prazo_desconhecido, "18-01-2019").
excecao(contrato(IdA,IdAda,Tc,TP,Desc,Val,Pr,Local,Data)) :- contrato(IdA,IdAda,Tc,TP,Desc,Val,prazo_desconhecido,Local,Data).

% ------- Conhecimento Imperfeito Impreciso
%Não se sabe se o valor do contrato é 500€ ou 4700€
excecao(contrato(600086992, 503188620, "Locacao de bens moveis", "Concurso Publico", "Contratacao de 2 veiculos eletricos em regime de aluguer operacional de veiculos", 5000, "140 dias", "Portugal", "16-01-2020")).
excecao(contrato(600086992, 503188620, "Locacao de bens moveis", "Concurso Publico", "Contratacao de 2 veiculos eletricos em regime de aluguer operacional de veiculos", 4700, "140 dias", "Portugal", "16-01-2020")).

% ------- Conhecimento Imperfeito Interdito

%É impossivel saber o valor do contrato
contrato(508481287,508592909, 'Aquisicao de bens moveis', 'Consulta Previa', 'Aquisicao de seringas', valor_desconhecido, '352 dias', '14-01-2020').
excecao(contrato(IdA,IdAda,Tc,TP,Desc,Val,Pr,Local,Data)) :- contrato(contrato(IdA,IdAda,Tc,TP,Desc,valor_desconhecido,Pr,Local,Data)).
nulointerdito(valor_desconhecido).

+contrato(IdA,IdAda,Tc,TP,Desc,Val,Pr,Local,Data) :: (solucoes((IdA,IdAda,Tc,TP,Desc,Val,Pr,Local,Data),
                                                      contrato(508481287,508592909, 'Aquisicao de bens moveis', 'Consulta Previa', 'Aquisicao de seringas', valor_desconhecido, '352 dias', '14-01-2020'),
                                                      nao(nulointerdito(valor_desconhecido)),R, comprimento(R,0))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensao do predicato adjudicante: IdAd, Nome, NIF, Morada -> {V,F,D}

% ------- Conhecimento Perfeito Positivo
adjudicante(1, "Direcao-Geral do Tribunal de Contas", 600018709, "Lisboa").
adjudicante(2, "Municipio de Vila Flor", 506696464, "Vila Flor").
adjudicante(3, "Municipio de Braga", 506901173, "Braga").
adjudicante(5, "Servicos de Accao Social da Universidade do Minho", 680047360, "Braga").
adjudicante(6, "Autoridade Tributaria e Aduaneira", 600084779, "Lisboa").
adjudicante(7, "Centro Hospitalar Universitario de Lisboa Norte", 508481287, "Lisboa").
adjudicante(10, "Gesamb - Gestão Ambiental e de Resíduos", 506346773, "Évora").

% ------- Conhecimento Perfeito Negativo
-adjudicante(9, "Municipio de Braganca", 501128840, "Braganca").

% ------- Conhecimento Imperfeito Incerto

%Não se sabe a morada da entidade
adjudicante(8, "Supremo Tribunal Administrativo", 600006638, morada_desconhecida).
excecao(adjudicante(Id,Nome,Nif,Morada)) :- adjudicante(Id,Nome,Nif,morada_desconhecida).

% ------- Conhecimento Imperfeito Impreciso

%Não se sabe se a morada da entidade é Braga ou Guimarães
excecao(adjudicante(4, "Universidade do Minho", 502011378, "Braga")).
excecao(adjudicante(4, "Universidade do Minho", 502011378, "Guimarães")).

% ------- Conhecimento Imperfeito Interdito
%É impossivel saber a nome da entidade
adjudicante(6, unknown_entity, 501413197, 'Porto').
excecao(adjudicante(Id,Nome,Nif,Morada)) :- adjudicataria(Id,unknown_entity,Nif,Morada).
nulointerdito(unknown_entity).

+adjudicante(Id,Nome,Nif,Morada) :: (solucoes((Id,Nome,Nif,Morada), 
                                     adjudicante(6, unknown_entity, 501413197, 'Porto'),
                                     nao(nulointerdito(unknown_entity)), R), comprimento(R,0)). 


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensao do predicato adjudicataria: IdAda, Nome, NIF, Morada -> {V,F,D}

% ------- Conhecimento Perfeito Positivo
adjudicataria(1, "Data Juris - Direito e Informatica Lda", 502381973, "Portugal").
adjudicataria(4, "OLYMPUS IBERIA SAU", 980474710, "Portugal").
adjudicataria(6, "Pamafe Informatica Lda", 504099388, "Portugal").
adjudicataria(7, "Accenture Tecnology Solutions - Solucoes Informaticas Integradas", 502443855, "Portugal").
adjudicataria(8, "Beltrao Coelho, Lda", 504654748, "Portugal").
adjudicataria(9, "Batist Medical Portugal Unipessoal Lda", 508592909, "Portugal").
adjudicataria(10, "EDP", 503504564, Portugal).

% ------- Conhecimento Perfeito Negativo
-adjudicataria(13, "CGITI Portugal", 502605731, "Portugal").

% ------- Conhecimento Imperfeito Incerto

%Não se sabe a morada da entidade
adjudicataria(3, "Plateia de Calculos Unipessoal Lda", 515204463, morada_desconhecida).
excecao(adjudicataria(Id,Nome,Nif,Morada)) :- adjudicataria(Id,Nome,Nif,morada_desconhecida).


% ------- Conhecimento Imperfeito Impreciso

%Não se sabe se a morada da entidade é Vila Flor ou Mirandela
excecao(adjudicataria(2, "Carlos Manuel Pires", 809589087, "Vila Flor")).
excecao(adjudicataria(2, "Carlos Manuel Pires", 809589087, "Mirandela")).


% ------- Conhecimento Imperfeito Interdito

%É impossivel saber a morada da entidade
adjudicataria(5, 'Manuel Rui Azinhais Nabeiro Lda', 500853975, unknown_address).
excecao(adjudicataria(Id,Nome,Nif,Morada)) :- adjudicataria(Id,Nome,Nif,unknown_address).
nulointerdito(unknown_address).

+adjudicataria(Id,Nome,Nif,Morada) :: (solucoes((Id,Nome,Nif,Morada), 
                                       adjudicataria(5,"Manuel Rui Azinhais Nabeiro Lda", 500853975, unknown_address),
                                       nao(nulointerdito(unknown_address)), R), comprimento(R,0)).
