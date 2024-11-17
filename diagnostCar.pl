% Base de conhecimento com problemas comuns e sintomas associados
% Definindo sintomas e problemas específicos que podem ser identificados com base nos sintomas relatados

% Problemas comuns e suas regras baseadas em sintomas
problema(bateria_fraca) :-
    motor_nao_liga,
    luzes_fracas.
    % Regra: Se o motor não liga e as luzes estão fracas, o problema pode ser bateria fraca.

problema(freio_desgastado) :-
    barulho_ao_frear,
    pedal_freio_macio.
    % Regra: Se há barulho ao frear e o pedal do freio está macio, o problema pode ser freio desgastado.

problema(vazamento_oleo) :-
    mancha_no_chao,
    baixo_nivel_oleo.
    % Regra: Se há uma mancha de óleo no chão e o nível de óleo está baixo, pode haver um vazamento de óleo.

problema(alternador_defeituoso) :-
    motor_nao_liga,
    luz_bateria_acende.
    % Regra: Se o motor não liga e a luz da bateria acende, pode ser um problema no alternador.

problema(pneu_descalibrado) :-
    direcao_pesada,
    pneus_desequilibrados.
    % Regra: Se a direção está pesada e os pneus estão desequilibrados, o problema pode ser um pneu descalibrado.

% Regras de diagnóstico e solução
solucao(bateria_fraca) :-
    write("Verifique a bateria do veículo. Talvez seja necessário recarregar ou substituir."),
    nl.
    % Solução para bateria fraca: recomenda verificar a bateria.

solucao(freio_desgastado) :-
    write("Verifique o sistema de freios. Pode ser necessário substituir as pastilhas de freio."),
    nl.
    % Solução para freio desgastado: recomenda verificar e substituir pastilhas, se necessário.

solucao(vazamento_oleo) :-
    write("Verifique o nível de óleo e inspecione o local de vazamento. Complete o óleo, se necessário."),
    nl.
    % Solução para vazamento de óleo: recomenda verificar e completar o nível de óleo.

solucao(alternador_defeituoso) :-
    write("Pode haver um problema no alternador. Leve o carro a um mecânico para inspeção."),
    nl.
    % Solução para alternador defeituoso: recomenda levar a um mecânico.

solucao(pneu_descalibrado) :-
    write("Calibre os pneus e verifique o balanceamento das rodas."),
    nl.
    % Solução para pneu descalibrado: recomenda calibrar e balancear os pneus.

% Regra para verificar se o problema é grave e sugerir a ação adequada
solucao_grave(alternador_defeituoso) :-
    write("Problema grave detectado. Leve o carro a um mecânico imediatamente."),
    nl.
    % Para problemas graves como o alternador defeituoso, sugere levar a um mecânico.

% Função principal para iniciar o diagnóstico
diagnosticar :-
    write("Descreva o problema do veículo respondendo com 'sim' ou 'nao' aos sintomas a seguir."),
    nl,
    perguntar_problema.

% Função que questiona sobre cada sintoma para identificar o problema
perguntar_problema :-
    write("O motor não liga? "), read(Resp1), nl,
    (Resp1 == sim -> assert(motor_nao_liga) ; true),

    write("As luzes estão fracas? "), read(Resp2), nl,
    (Resp2 == sim -> assert(luzes_fracas) ; true),

    write("Há barulho ao frear? "), read(Resp3), nl,
    (Resp3 == sim -> assert(barulho_ao_frear) ; true),

    write("O pedal do freio está macio? "), read(Resp4), nl,
    (Resp4 == sim -> assert(pedal_freio_macio) ; true),

    write("Há uma mancha de óleo no chão? "), read(Resp5), nl,
    (Resp5 == sim -> assert(mancha_no_chao) ; true),

    write("O nível de óleo está baixo? "), read(Resp6), nl,
    (Resp6 == sim -> assert(baixo_nivel_oleo) ; true),

    write("A luz da bateria acende? "), read(Resp7), nl,
    (Resp7 == sim -> assert(luz_bateria_acende) ; true),

    write("A direção está pesada? "), read(Resp8), nl,
    (Resp8 == sim -> assert(direcao_pesada) ; true),

    write("Os pneus estão desequilibrados? "), read(Resp9), nl,
    (Resp9 == sim -> assert(pneus_desequilibrados) ; true),

    identificar_problema.

% Função que identifica o problema baseado nos sintomas relatados
identificar_problema :-
    (problema(P), solucao(P), nl;
     problema(P), solucao_grave(P), nl),
    retractall(motor_nao_liga),
    retractall(luzes_fracas),
    retractall(barulho_ao_frear),
    retractall(pedal_freio_macio),
    retractall(mancha_no_chao),
    retractall(baixo_nivel_oleo),
    retractall(luz_bateria_acende),
    retractall(direcao_pesada),
    retractall(pneus_desequilibrados).
