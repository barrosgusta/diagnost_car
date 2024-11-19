% Base de evidências, testemunhos e suas relações com suspeitos e teorias
% Evidências
impressao_digital(lugar_crime).
motivo(financeiro).
motivo(pasional).
testemunha(visto_discutindo).
testemunha(visto_na_cena_do_crime).
alibi(suspeito1, nao_verificado).
alibi(suspeito2, verificado).

% Relacionamentos
relacao(intima).
relacao(profissional).

% Suspeitos relacionados com evidências
suspeito(jose) :-
    evidencia(motivo(financeiro)),
    impressao_digital(lugar_crime).
suspeito(maria) :-
    evidencia(testemunha(visto_na_cena_do_crime)),
    alibi(suspeito1, nao_verificado).

% Teorias relacionadas com os testemunhos e evidências
teoria(crime_passional) :-
    evidencia(testemunha(visto_discutindo)),
    relacao(intima).
teoria(roubo) :-
    evidencia(motivo(financeiro)),
    impressao_digital(lugar_crime).

% Função principal para iniciar a análise do caso
analisar_caso :-
    write("Bem-vindo ao sistema de análise de investigação criminal!"), nl,
    coletar_informacoes.

% Função para coletar informações sobre o caso específico
coletar_informacoes :-
    write("Informe a evidência ou testemunho encontrado (impressao_digital, motivo, testemunha, alibi): "), nl,
    read(Evidencia), nl,
    assert(evidencia(Evidencia)),
    sugerir_analise.

% Função para sugerir a análise com base nas evidências fornecidas
sugerir_analise :-
    % Verifica suspeitos relacionados à evidência
    findall(Suspeito, suspeito(Suspeito), Suspeitos),
    findall(Teoria, teoria(Teoria), Teorias),
    (Suspeitos \= [] -> (
        write("Suspeitos possíveis:"), nl,
        listar(Suspeitos)
    ) ; true),
    (Teorias \= [] -> (
        write("Teorias do crime possíveis:"), nl,
        listar(Teorias)
    ) ; true),
    (Suspeitos = [], Teorias = [] ->
        write("Não encontramos evidências ou suspeitos conclusivos. Recomendamos investigar mais a fundo e verificar álibis."),
        nl ; true).

% Função auxiliar para listar itens
listar([]).
listar([X|Xs]) :-
    write("- "), write(X), nl,
    listar(Xs).

% Limpar informações após a análise
limpar_informacoes :-
    retractall(evidencia(_)).
