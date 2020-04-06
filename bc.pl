%Extensão do predicato Contrato: IdAd, IdAda, TipoDeContrato, TipoDeProcedimento, Descrição, Valor, Prazo, Local, Data -> {V,F,D}

% ------- Conhecimento Perfeito Positivo
contrato(600018709,502381973, 'Aquisição de serviços', 'Ajuste Direto', 'Aquisição de serviços de acesso à DATAJURIS – Base de Dados Jurídicos', 4000, '195 dias','Lisboa', '19-03-2020').
contrato(506696464,809589087, 'Aquisição de serviços', 'Ajuste Direto','Reparação e Conservação de Escolas - Fornecimento de aluminos', 2800,'30 dias', 'Vila Flor', '16-02-2020').
contrato(506901173,515204463, 'Aquisição de serviços', 'Ajuste Direto', 'Obras de Demolição e Reposição da Legalidade De Anexo', 4694.60,'25 dias','Braga','11-03-2020').
contrato(502011378,980474710, 'Aquisição de bens móveis', 'Concurso público', 'Aquisição de um microscópio 2Photon', 320000, '105 dias', 'Braga', '31-03-2020').
contrato(680047360,500853975, 'Aquisição de bens móveis', 'Concurso Público', 'Aquisição de Café, por lotes, para os anos de 2020 e 2021', 157275, '353 dias', 'Braga', '13-01-2020').
contrato(501413197,504099388, 'Locação de bens móveis', 'Concurso público', 'Aquisição de nós de computação (servidores) para cloud interna', 210000, '30 dias', 'Porto', '16-03-2020').
contrato(600084779,502443855, 'Aquisição de serviços', 'Consulta Prévia', 'Aquisição de serviços de desenvolvimento aplicacional dos sistemas de informação da Autoridade Tributária e Aduaneira', 201400, '210 dias', '19-02-2020').
contrato(600006638,504654748, 'Aquisição de bens móveis', 'Consulta Prévia', 'Aquisição de 2 equipamentos multifuncionais', 10980, '30 dias', '12-03-2020').
contrato(508481287,508592909, 'Aquisição de bens móveis', 'Consulta Prévia', 'Aquisição de seringas', 5653.40, '352 dias', '14-01-2020').

% ------- Conhecimento Perfeito Negativo

-contrato(501128840,502605731,'Aquisição de serviços', 'Ajuste Direto', 'Prestação de Serviços de Informática para a Gestão dos Clientes', 4800.50, '365 dias', '17-03-2020').

% ------- Conhecimento Imperfeito Incerto
contrato(unknownidAd, 505044897, 'Aquisição de bens móveis', 'Ajuste Direto', 'Aquisição de materiais para a manutenção das infraestruturas da AdDP', 267.50, '3 dias', '02-04-2020').
excecao(contrato(IdAd,IdAda,TContrato,TProcedimento,Descricao,Val,Prazo,Local,Data)) :- contrato(unknownidAd,IdAda,TContrato,TProcedimento,Descricao,Val,Prazo,Local,Data).

contrato(600014690, unknownidAda, 'Aquisição de serviços', 'Ajuste Direto', 'Prestação de Assistencia técnica para o software de gestão da bilioteca para a SGPCM', 2250, '365 dias', '30-03-2020').
excecao(contrato(IdAd,IdAda,TContrato,TProcedimento,Descricao,Val,Prazo,Local,Data)) :- contrato(IdAd,unknownidAda,TContrato,TProcedimento,Descricao,Val,Prazo,Local,Data).

% ------- Conhecimento Imperfeito Impreciso
excecao(contrato(506346773, 503504564, 'Locação de bens móveis', 'Contrato Público', 'Fornecimento de energia elétrica para as instalações da GESAMB', 1780.22, '365 dias','Évora' '18-01-2020')). 
excecao(contrato(506346773, 980245974, 'Locação de bens móveis', 'Contrato Público', 'Fornecimento de energia elétrica para as instalações da GESAMB', 1780.22, '365 dias','Évora' '18-01-2020')).


% ------- Conhecimento Imperfeito Interdito

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensão do predicato adjudicante: IdAd, Nome, NIF, Morada -> {V,F,D}

% ------- Conhecimento Perfeito Positivo
adjudicante(1, 'Direção-Geral do Tribunal de Contas', 600018709, 'Lisboa').
adjudicante(2, 'Múnicipio de Vila Flor', 506696464, 'Vila Flor').
adjudicante(3, 'Múnicipio de Braga', 506901173,'Braga').
adjudicante(4, 'Universidade do Minho', 502011378, 'Braga').
adjudicante(5, 'Serviços de Acção Social da Universidade do Minho', 680047360, 'Braga').
adjudicante(6, 'Universidade do Porto', 501413197, 'Porto').
adjudicante(7, 'Autoridade Tributária e Aduaneira', 600084779, 'Lisboa').
adjudicante(8, 'Supremo Tribunal Administrativo', 600006638, 'Lisboa').
adjudicante(9, 'Centro Hospitalar Universitário de Lisboa Norte, E. P. E.', 508481287, 'Lisboa').

adjudicante(10,'Gesamb - Gestão Ambiental e de Resíduos',506346773, 'Évora').

adjudicante(11, 'Secretaria-Geral da Presidência do Conselho de Ministros',600014690).

% ------- Conhecimento Perfeito Negativo
-adjudicante(13, 'Município de Bragança', 501128840, 'Bragança').

% ------- Conhecimento Imperfeito Incerto
adjudicante(12, 'Águas do Douro e Paiva, S. A.', unknown_nif, 'Vila Nova de Gaia').
excecao(adjudicante(Id, Nome, Nif, Morada)) :- adjudicante(Id, Nome, unknown_nif, Morada).

% ------- Conhecimento Imperfeito Impreciso


% ------- Conhecimento Imperfeito Interdito

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensão do predicato adjudicatária: IdAda, Nome, NIF, Morada -> {V,F,D}

% ------- Conhecimento Perfeito Positivo
adjudicataria(1, 'Data Juris - Direito e Informática Lda.', 502381973, 'Portugal').
adjudicataria(2, 'Carlos Manuel Pires', 809589087, 'Vila Flor').
adjudicataria(3, 'Plateia de Cálculos Unipessoal, Lda', 515204463, 'Braga').
adjudicataria(4, 'OLYMPUS IBERIA SAU', 980474710, 'Portugal').
adjudicataria(5, 'Manuel Rui Azinhais Nabeiro,Lda.',500853975, 'Braga').
adjudicataria(6, 'Pamafe Informática, Lda', 504099388, 'Portugal').
adjudicataria(7, 'Accenture Tecnology Solutions - Soluções Informáticas Integradas, S.A.', 502443855, Portugal).
adjudicataria(8, 'Beltrão Coelho, Lda.', 504654748, 'Portugal').
adjudicataria(9, 'Batist Medical Portugal Unipessoal, Lda', 508592909, 'Portugal').
adjudicataria(10, 'Endesa Energia, S.A. - Sucursal Portugal', 980245974, 'Portugal').
adjudicataria(11, 'EDP', 503504564, 'Portugal').

% ------- Conhecimento Perfeito Negativo
-adjudicataria(13, 'CGITI Portugal,S.A', 502605731 'Portugal').

% ------- Conhecimento Imperfeito Incerto
adjudicataria(12, 'BIBLIOSOFT- Informática, Formação e Serviços, Lda.', unknown_nif, 'Portugal').
excecao(adjudicataria(Id,Nome,Nif,Morada)) :- adjudicataria(Id,Nome,unknown_nif,Morada).

% ------- Conhecimento Imperfeito Impreciso


% ------- Conhecimento Imperfeito Interdito