%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag(discontiguous_warnings,off).
:- set_prolog_flag(single_var_warnings,off).
:- set_prolog_flag(unknown,fail).

:- op(900,xfy,'::').
:- dynamic adjudicante/4.
:- dynamic adjudicataria/4.
:- dynamic contrato/10.
:- dynamic idAdjud/1.
:- dynamic idAdjudicata/1.
:- dynamic excecao/1.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregar predicados do ficheiro no qual é guardado o estado

:- include('bc.pl').
:- include('aux.pl').
:- include('evinvolucao.pl').
:- include('invariantes.pl').


% Extensao do meta-predicado demo: Questao,Resposta -> {"verdadeiro","falso","desconhecido"}
% capaz de responder a uma única questão
demo(Q,verdadeiro) :- Q.
demo(Q,falso) :- -Q.
demo(Q,desconhecido) :- nao(Q), nao(-Q).

% Extensao do meta-predicado siLista: [Questao],[Resposta] -> {V,F,D}
% capaz de responder a várias questões em simultâneo
demoList([Q],[R]):- demo(R,S).
demoList([Q|Qs],[R|Rs]) :- demo(Q,R), demoList(Qs,Rs).
%%