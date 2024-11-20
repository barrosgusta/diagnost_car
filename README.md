Sistema Especialista em Prolog
==============================

Este repositório contém vários sistemas especialistas implementados em Prolog, com o objetivo de resolver problemas específicos com base em regras e fatos definidos.

Sumário
-------

1.  Diagnóstico de Problemas em Veículos **(diagnostCar.pl)**
2.  Diagnóstico Médico **(diagnostMed.pl)**
3.  Recomendações de Livros **(bookGenius.pl)**
4.  Recomendação de Treinos de Academia **(workoutGenius.pl)**
5.  Análise de Investigação Criminal **(criminalClue.pl)**

* * *

Diagnóstico de Problemas em Veículos
------------------------------------

### Descrição:

Este sistema é responsável por identificar problemas comuns em veículos com base em sintomas ou comportamentos relatados pelos usuários. Ele sugere possíveis soluções ou ações a serem tomadas para resolver o problema.

### Regras:

*   Problema de bateria fraca: Identificado se o motor não liga e as luzes estão fracas.
*   Problema de freio desgastado: Identificado se há barulho ao frear e o pedal de freio está macio.

### Exemplo de uso:

```prolog
?- diagnosticar.
```
    

O sistema sugerirá o diagnóstico e possíveis ações para resolver o problema.

* * *

Diagnóstico Médico
------------------

### Descrição:

Este sistema sugere diagnósticos médicos com base em sintomas informados pelo usuário. Ele pode identificar doenças simples como gripe, infecção viral ou enxaqueca.

### Regras:

*   Gripe: Identificada se houver febre, tosse e cansaço.
*   Infecção viral: Identificada se houver febre, dor de garganta e dor muscular.
*   Enxaqueca: Identificada se houver dor de cabeça intensa e náusea.

### Exemplo de uso:

```prolog
?- diagnosticar.
```
    

O sistema fará inferências sobre o diagnóstico mais provável.

* * *

Recomendações de Livros
-----------------------

### Descrição:

Este sistema sugere livros com base nas preferências de gênero e interesses do usuário. O sistema utiliza uma base de dados de livros categorizados por gênero, como ficção, ciência, história, entre outros.

### Regras:

*   Recomendação de livros: Baseada no gênero e no interesse do usuário. Por exemplo, "1984" pode ser recomendado se o usuário tem interesse em política e gosta de ficção.

### Exemplo de uso:

```prolog
?- recomendar_livros.
```
    

O sistema sugerirá livros que correspondem ao gênero e ao interesse informados.

* * *

Recomendação de Treinos de Academia
-----------------------------------

### Descrição:

Este sistema sugere treinos de academia baseados nos objetivos do usuário, como perder peso, ganhar massa muscular ou melhorar o condicionamento físico. Ele leva em consideração também a experiência do usuário e a disponibilidade de tempo.

### Regras:

*   Hipertrofia: Se o objetivo é ganhar massa muscular e o usuário tem experiência intermediária.
*   Perda de peso: Se o objetivo é emagrecer e o usuário tem tempo limitado para treinar.

### Exemplo de uso:

```prolog
?- recomendar_treino.
```
    

O sistema irá sugerir um plano de treino com séries e repetições baseadas no objetivo do usuário.

* * *

Análise de Investigação Criminal
--------------------------------

### Descrição:

Este sistema ajuda na análise de casos criminais, sugerindo suspeitos ou teorias do crime com base nas evidências e testemunhos fornecidos pelo usuário. Ele pode sugerir investigações adicionais, como verificar álibis.

### Regras:

*   Suspeito: Identificado se houver evidências como impressões digitais e motivos financeiros.
*   Teorias: Inclui teorias como crime passional e roubo com base nas evidências e testemunhos.

### Exemplo de uso:

```prolog
?- analisar_caso.
Informe a evidência ou testemunho encontrado (impressao_digital, motivo, testemunha, alibi): 
|: motivo(financeiro).
```
    

O sistema listará suspeitos e teorias possíveis com base na evidência fornecida.

* * *

Como Usar
---------

### 1\. Instalação:

```bash
git clone https://github.com/usuario/prolog-sistemas.git
cd prolog-sistemas
```
    

Abra o arquivo .pl no SWI-Prolog:
```prolog
?- [nome_do_arquivo].
```
    

### 2\. Execução:

Para iniciar o sistema, use o comando adequado para cada sistema (por exemplo, `?- diagnosticar.`).
