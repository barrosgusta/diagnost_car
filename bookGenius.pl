% Base de dados de livros com informações de gênero e interesses
livro('1984', ficcao, "Um clássico de George Orwell sobre uma distopia onde o governo controla tudo.").
livro('Sapiens', historia, "Um relato fascinante sobre a história da humanidade, escrito por Yuval Noah Harari.").
livro('O Poder do Hábito', autoajuda, "Charles Duhigg explora como os hábitos funcionam e como podemos mudá-los.").
livro('Duna', ficcao, "Uma obra-prima de ficção científica de Frank Herbert, situada em um planeta desértico.").
livro('A Arte da Guerra', estrategia, "Sun Tzu oferece lições de estratégia militar que podem ser aplicadas em várias áreas da vida.").
livro('A Revolução dos Bichos', ficcao, "Outra obra de Orwell, uma alegoria sobre política e poder.").
livro('Uma Breve História do Tempo', ciencia, "Stephen Hawking explica os mistérios do universo de forma acessível.").
livro('Mindset', autoajuda, "Carol Dweck explica como o tipo certo de mentalidade pode levar ao sucesso.").
livro('O Diário de Anne Frank', historia, "Um relato comovente de uma jovem durante a Segunda Guerra Mundial.").

% Regras para recomendar livros com base no gênero e interesses
recomendar(Titulo, Descricao) :-
    livro(Titulo, Genero, Descricao),
    genero(Genero),
    !.
    % Regra: Recomenda um livro com base no gênero preferido.

recomendar(Titulo, Descricao) :-
    livro(Titulo, _, Descricao),
    interesse(Topico),
    sub_string(Descricao, _, _, _, Topico),
    !.
    % Regra: Recomenda um livro se a descrição contiver um interesse do usuário.

% Caso nenhum livro seja encontrado
sem_recomendacao :-
    \+ (recomendar(_, _)), % Só executa se nenhum livro for encontrado
    write("Não conseguimos encontrar um livro que combine com suas preferências. Experimente outros gêneros ou interesses!"),
    nl.

% Função principal para iniciar o sistema de recomendações
recomendar_livros :-
    write("Bem-vindo ao sistema de recomendações de livros!"),
    nl,
    coletar_preferencias.

% Função para coletar as preferências do usuário
coletar_preferencias :-
    write("Você gosta de ficção? "), read(Resp1), nl,
    (Resp1 == sim -> assert(genero(ficcao)) ; true),

    write("Você gosta de livros de história? "), read(Resp2), nl,
    (Resp2 == sim -> assert(genero(historia)) ; true),

    write("Você gosta de ciência? "), read(Resp3), nl,
    (Resp3 == sim -> assert(genero(ciencia)) ; true),

    write("Você gosta de autoajuda? "), read(Resp4), nl,
    (Resp4 == sim -> assert(genero(autoajuda)) ; true),

    write("Você gosta de estratégias? "), read(Resp5), nl,
    (Resp5 == sim -> assert(genero(estrategia)) ; true),

    write("Quais são seus interesses? (Exemplo: política, universo, hábitos, etc.) "), read(Interesse), nl,
    (Interesse \= nenhum -> assert(interesse(Interesse)) ; true),

    apresentar_recomendacoes.

% Função para apresentar recomendações com base nas preferências coletadas
apresentar_recomendacoes :-
    (recomendar(Titulo, Descricao),
     write("Recomendamos o livro: "), write(Titulo), nl,
     write("Descrição: "), write(Descricao), nl,
     fail; % Continua procurando outras recomendações
     sem_recomendacao),
    limpar_preferencias.

% Limpa as preferências para que o sistema possa ser reutilizado
limpar_preferencias :-
    retractall(genero(_)),
    retractall(interesse(_)).
