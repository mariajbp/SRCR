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
:- dynamic contrato/9.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Carregar predicados do ficheiro no qual é guardado o estado

:- include('bc2.pl').
:- include('aux.pl').
:- include('invariantes.pl').