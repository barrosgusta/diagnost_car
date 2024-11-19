% Base de conhecimento com sintomas comuns e doenças simples
% Definindo as regras de inferência para diagnóstico com base nos sintomas

% Doenças comuns e suas regras baseadas nos sintomas
doenca(gripe) :-
    febre,
    tosse,
    cansaço.
    % Regra: Se há febre, tosse e cansaço, o diagnóstico pode ser gripe.

doenca(infeccao_viral) :-
    febre,
    dor_de_garganta,
    dor_muscular.
    % Regra: Se há febre, dor de garganta e dor muscular, pode ser uma infecção viral.

doenca(enxaqueca) :-
    dor_de_cabeca,
    sensibilidade_a_luz,
    nausea.
    % Regra: Se há dor de cabeça, sensibilidade à luz e náusea, o diagnóstico pode ser enxaqueca.

doenca(resfriado) :-
    tosse,
    nariz_entupido,
    espirros.
    % Regra: Se há tosse, nariz entupido e espirros, o diagnóstico pode ser resfriado.

doenca(alergia) :-
    espirros,
    coceira,
    olhos_lacrimejando.
    % Regra: Se há espirros, coceira e olhos lacrimejando, pode ser uma alergia.

% Regras de diagnóstico e soluções recomendadas
solucao(gripe) :-
    write("Diagnóstico: Gripe. Descanse, hidrate-se e, se necessário, use medicamentos para aliviar os sintomas."),
    nl.
    % Solução para gripe: recomenda descanso, hidratação e medicamentos para sintomas.

solucao(infeccao_viral) :-
    write("Diagnóstico: Infecção Viral. Descanse, mantenha-se hidratado e consulte um médico se os sintomas persistirem."),
    nl.
    % Solução para infecção viral: recomenda descanso e alerta para consultar médico se necessário.

solucao(enxaqueca) :-
    write("Diagnóstico: Enxaqueca. Evite luz forte, descanse em um local calmo e use medicamentos indicados para dor."),
    nl.
    % Solução para enxaqueca: recomenda evitar luz, descanso e medicação.

solucao(resfriado) :-
    write("Diagnóstico: Resfriado. Descanse, mantenha-se hidratado e use descongestionantes, se necessário."),
    nl.
    % Solução para resfriado: recomenda descanso, hidratação e descongestionantes.

solucao(alergia) :-
    write("Diagnóstico: Alergia. Evite o alérgeno, use anti-histamínicos, se necessário, e mantenha o ambiente limpo."),
    nl.
    % Solução para alergia: recomenda evitar o alérgeno e usar anti-histamínicos.

% Caso nenhum diagnóstico seja identificado
sem_diagnostico :-
    write("Os sintomas não correspondem a nenhuma condição conhecida. Consulte um médico para avaliação detalhada."),
    nl.
    % Mensagem padrão para sintomas que não têm diagnóstico definido.

% Função principal para iniciar o diagnóstico
diagnosticar :-
    write("Descreva os sintomas respondendo com 'sim' ou 'nao' às perguntas a seguir."),
    nl,
    perguntar_sintomas.

% Função que questiona o usuário sobre cada sintoma
perguntar_sintomas :-
    write("Você está com febre? "), read(Resp1), nl,
    (Resp1 == sim -> assert(febre) ; true),

    write("Você está com tosse? "), read(Resp2), nl,
    (Resp2 == sim -> assert(tosse) ; true),

    write("Você está sentindo cansaço? "), read(Resp3), nl,
    (Resp3 == sim -> assert(cansaço) ; true),

    write("Você está com dor de garganta? "), read(Resp4), nl,
    (Resp4 == sim -> assert(dor_de_garganta) ; true),

    write("Você está com dor muscular? "), read(Resp5), nl,
    (Resp5 == sim -> assert(dor_muscular) ; true),

    write("Você está com dor de cabeça? "), read(Resp6), nl,
    (Resp6 == sim -> assert(dor_de_cabeca) ; true),

    write("Você tem sensibilidade à luz? "), read(Resp7), nl,
    (Resp7 == sim -> assert(sensibilidade_a_luz) ; true),

    write("Você está com náusea? "), read(Resp8), nl,
    (Resp8 == sim -> assert(nausea) ; true),

    write("Você está com nariz entupido? "), read(Resp9), nl,
    (Resp9 == sim -> assert(nariz_entupido) ; true),

    write("Você está espirrando? "), read(Resp10), nl,
    (Resp10 == sim -> assert(espirros) ; true),

    write("Você tem coceira? "), read(Resp11), nl,
    (Resp11 == sim -> assert(coceira) ; true),

    write("Seus olhos estão lacrimejando? "), read(Resp12), nl,
    (Resp12 == sim -> assert(olhos_lacrimejando) ; true),

    identificar_doenca.

% Função que identifica a doença com base nos sintomas relatados
identificar_doenca :-
    (doenca(D), solucao(D), nl;
     sem_diagnostico),
    retractall(febre),
    retractall(tosse),
    retractall(cansaço),
    retractall(dor_de_garganta),
    retractall(dor_muscular),
    retractall(dor_de_cabeca),
    retractall(sensibilidade_a_luz),
    retractall(nausea),
    retractall(nariz_entupido),
    retractall(espirros),
    retractall(coceira),
    retractall(olhos_lacrimejando).
