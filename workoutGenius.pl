% Base de dados de treinos e exercícios para diferentes objetivos
treino('Treino de Hipertrofia', 
    "Supino reto (4x10), Agachamento livre (4x12), Rosca direta (3x15), Desenvolvimento militar (3x10).").
treino('Treino para Perda de Peso', 
    "Circuito: Burpees (3x15), Agachamento com salto (3x12), Prancha abdominal (3x30s), Corrida na esteira (20min).").
treino('Treino para Condicionamento Físico', 
    "Corrida intervalada (10x1min rápido/1min devagar), Flexões de braço (4x12), Agachamento com peso corporal (4x15).").
treino('Treino de Força Avançada', 
    "Levantamento terra (5x5), Barra fixa (4x8), Supino inclinado (4x6), Remada curvada (4x6).").

% Regras de recomendação com base nos objetivos e experiência do usuário
plano_de_treino('Treino de Hipertrofia') :-
    objetivo(ganhar_massa),
    experiencia(intermediario).

plano_de_treino('Treino para Perda de Peso') :-
    objetivo(emagrecer),
    disponibilidade(tempo_limitado).

plano_de_treino('Treino para Condicionamento Físico') :-
    objetivo(melhorar_condicionamento),
    experiencia(iniciante).

plano_de_treino('Treino de Força Avançada') :-
    objetivo(ganhar_massa),
    experiencia(avancado).

% Caso nenhum plano de treino seja encontrado
sem_treino :-
    \+ (plano_de_treino(_)),
    write("Não encontramos um treino para o seu perfil. Consulte um profissional de educação física para personalizar seu plano!"),
    nl.

% Função principal para iniciar o sistema de recomendações
recomendar_treino :-
    write("Bem-vindo ao sistema de recomendações de treinos de academia!"),
    nl,
    coletar_informacoes.

% Função para coletar as informações do usuário
coletar_informacoes :-
    write("Qual é o seu objetivo? (ganhar_massa, emagrecer, melhorar_condicionamento): "),
    read(Objetivo), nl,
    assert(objetivo(Objetivo)),

    write("Qual é sua experiência na academia? (iniciante, intermediario, avancado): "),
    read(Experiencia), nl,
    assert(experiencia(Experiencia)),

    write("Qual é sua disponibilidade de tempo? (tempo_limitado, tempo_moderado, tempo_livre): "),
    read(Disponibilidade), nl,
    assert(disponibilidade(Disponibilidade)),

    apresentar_treinos.

% Função para apresentar treinos com base nas informações coletadas
apresentar_treinos :-
    (plano_de_treino(NomeTreino),
     treino(NomeTreino, Descricao),
     write("Recomendamos o seguinte treino: "), write(NomeTreino), nl,
     write("Descrição do treino: "), write(Descricao), nl,
     fail; % Continua procurando outros treinos, se houver
     sem_treino),
    limpar_informacoes.

% Limpa as informações do usuário para permitir nova execução
limpar_informacoes :-
    retractall(objetivo(_)),
    retractall(experiencia(_)),
    retractall(disponibilidade(_)).
