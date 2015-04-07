% Projecto - Lógica para Programação
% -------------------------------
%            Grupo 43
%
%	72913 - Bruno Henriques
%	72960 - Tiago Santos
% -------------------------------

% ----------------------------------------------------------------
% -----------  Regras auxiliares de manipulação de listas --------
% ----------------------------------------------------------------

% sublista(P, L) - Devolve true se P for uma sublista da lista L,
% e false caso contrário.
%
% Caso terminal: A lista Sb é prefixo da lista L
% Caso recursivo: Verifica-se se a lista Sb é prefixo da lista L
% sem o seu primeiro elemento.

sublista(Sb,L)		:-	prefix(Sb,L).
sublista(Sb,[_|T])	:-	sublista(Sb,T).

% ----------------------------------------------------------------
% ----------- Regras necessárias para o projecto -----------------
% ----------------------------------------------------------------

% existe(E, L) - Devolve true se E for membro da lista L e false
% caso contrário.
%
% Chamada à função built-in do SWI-Prolog que verifica se
% o elemento E pertence à lista L.

existe(E, L)	:-	member(E,L).

% lado(S1, S2, Suspeitos - Devolve true se S1 e S2 estiverem um ao
% lado do outro na lista de Suspeitos independentemente da ordem
% com que estes se apresentam na mesma. Devolve false caso contrário.
%
% É verdade se e só se for encontrado a sequência [S1, S2] ou [S2,S3]
% na lista Suspeitos.

lado(S1, S2, Suspeitos)	:-	sublista([S1, S2], Suspeitos).
lado(S1, S2, Suspeitos)	:-	sublista([S2, S1], Suspeitos).

% entre(S1,S2,S3, Suspeitos) - Devolve true se S2 estiver entre S1
% e S3 (ou entre S3 e S1) e false caso contrario.
%
% É verdade se e só se for encontrado a sequência [S1, S2, S3] ou
% [S3, S2,S1] na lista Suspeitos.

entre(S1,S2,S3, Suspeitos)	:-	sublista([S1,S2,S3], Suspeitos).
entre(S1,S2,S3, Suspeitos)	:-	sublista([S3,S2,S1], Suspeitos).

% esquerda(S1,S2, Suspeitos) - Retorna true se S1 estiver à esquerda
% de S2 na lista Suspeitos e false caso contrário
%
% Caso de paragem: Se o suspeito S2 existe no resto da lista de suspeitos
% que tem S1 na cabeça.
% Caso recursivo: Caso o suspeito S1 não corresponder ao primeiro
% elemento da lista de Suspeitos, continua-se a pelo mesmo no resto
% da lista.

esquerda(S1, S2, [S1|R])	:-	existe(S2, R).
esquerda(S1, S2, [_|R])		:-	esquerda(S1, S2, R).

% direita(S1,S2, Suspeitos) - Retorna true se S1 estiver à direita
% de S2 na lista Suspeitos e false caso contrário
%
% S1 está à direita de S2 se e só se S2 estiver à esquerda do primeiro
% na lista de suspeitos.

direita(E1, E2, Suspeitos)	:-	esquerda(E2, E1, Suspeitos).

% naoEntre(S1,S2,S3, Suspeitos) - Devolve true se S2 não estiver
% entre S1 e S3 (ou entre S3 e S1) e false caso contrario.
%
% O suspeito S1 e S3 têm que ter 1 elemento entre eles e a posição do suspeito
% S2 na lista de Suspeitos não pode ter a posição do elemento que se encontra
% entre S1 e S3.

naoEntre(S1, S2, S3, Suspeitos) :-
	nth1(M, Suspeitos, S1),
	nth1(K, Suspeitos, S2),
	nth1(N, Suspeitos, S3),
	((K =\= N+1, M is N+2) ; ((K =\= M+1), N is M+2)).

% ou(S1,S2,S3, Suspeitos) - Devolve true se o Suspeito S1 for o Suspeito S2 ou S3
% se e só se os Suspeitos S2 e S3 forem diferentes. Devolve false caso contrário.
%
% As variáveis S1, S2 e S3 são inicializadas usando a regra existe(S,
% Suspeitos) e de seguida verifica-se se S1 unifica com o suspeito S2
% ou com S3 onde S2 e S3 não são unificáveis.

ou(S1, S2, S3, Suspeitos) :-
	existe(S1, Suspeitos),
	existe(S2, Suspeitos),
	existe(S3, Suspeitos),
	((S1 = S2, S2 \= S3) ; (S1 = S3, S2 \= S3)).

% -----------               END OF FILE                    --------








