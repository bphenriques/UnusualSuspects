%--------------------------------
% Auxiliar: Escreve matriz
%--------------------------------
writeSuspeitos([]).
writeSuspeitos([X| L]) :- write(X), nl, 
                          writeSuspeitos(L).


%------------------------------------------
%                   Testes
%------------------------------------------

testes :- 
    % Carrega testes
    ['bateria_testes.pl'],
    ['suspeitosDoCostume.pl'],  
    
    desafio(1, Suspeitos1),
    write('teste 1'), nl,
    writeSuspeitos(Suspeitos1),
    desafio(2, Suspeitos2),
    write('teste 2'), nl,
    writeSuspeitos(Suspeitos2).
    