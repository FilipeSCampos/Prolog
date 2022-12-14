% Desafio prolog 1 menção
% https://rachacuca.com.br/logica/problemas/feira-das-nacoes/


%%% Estande(Cor,Representante,Nação,Idade,Professor).

main :-
    %% Tempo inicial
    statistics(cputime,T1),

    modelo(L),
    imprime_lista(L),

    %% Tempo final
    statistics(cputime ,T2),
    Tempo_BUSCA is (T2 - T1),
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.


main :-

        nl,
        write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
        nl,
        write('........ UFA apos o fail .......').

%%%%%%%%% BASE DE DADOS
%cores
cor(amarela).
cor(azul).
cor(branco).
cor(verde).
cor(vermelho).

%Representante
rep(cassio).
rep(gabriel).
rep(helena).
rep(lais).
rep(sandro).

%naçao
naçao(alemanha).
naçao(espanha).
naçao(italia).
naçao(japao).
naçao(portugal).

%idade
idade(sete).
idade(oito).
idade(nove).
idade(dez).
idade(onze).

%professor
prof(jucenir).
prof(marcio).
prof(marilene).
prof(rosa).
prof(rogerio).

% Vamos estabelecemos uma regra com a função ALLDIFERENT
% podemos ter apenas um único resultado
% A restrição alldifferent garante que as variáveis ​​na lista devem
% ter valores diferentes

alldifferent([]).%define uma lista vazia (nenhum membro)
alldifferent([Elemento|Lista]):-
      not(member(Elemento,Lista)),% retorna TRUE se o elemento NÃO for membro da lista
      alldifferent(Lista).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

modelo([ (Cor_1, R_1, Naçao_1, Idade_1, Prof_1),
         (Cor_2, R_2, Naçao_2, Idade_2, Prof_2),
         (Cor_3, R_3, Naçao_3, Idade_3, Prof_3),
         (Cor_4, R_4, Naçao_4, Idade_4, Prof_4),
         (Cor_5, R_5, Naçao_5, Idade_5, Prof_5)
        ])

         :-

%%%%%%%%%%%%%%%%%%%%%%%%%% Cor
    cor(Cor_1),
    cor(Cor_2),
    cor(Cor_3),
    cor(Cor_4),
    cor(Cor_5),
    alldifferent([Cor_1, Cor_2, Cor_3, Cor_4, Cor_5]),


%%%%%%%%%%%%%%%%%%%%%%%% Representante
    rep(R_1),
    rep(R_2),
    rep(R_3),
    rep(R_4),
    rep(R_5),

%O grupo da Helena está em uma das pontas.

    (R_1 == helena),

%O grupo do Sandro está na quinta posição.
    (R_5 == sandro),


    alldifferent([R_1, R_2, R_3, R_4, R_5]),
%O grupo do Sandro está exatamente à direita do grupo do Cássio.
%logo R_4 == cassio.
%Cássio está no grupo do estande Amarelo

(
%(R_1==cassio, Cor_1==amarela);
%(R_2==cassio, Cor_2==amarela);
%(R_3==cassio, Cor_3==amarela);
(R_4==cassio, Cor_4==amarela)
%(R_5==cassio, Cor_5==amarela)
),
%%%%%%%%%%%%%%%%%%% naçao
    naçao(Naçao_1),
    naçao(Naçao_2),
    naçao(Naçao_3),
    naçao(Naçao_4),
    naçao(Naçao_5),

    alldifferent([Naçao_1, Naçao_2, Naçao_3, Naçao_4, Naçao_5]),
%O grupo de Portugal está exatamente à esquerda do grupo da Espanha.
(
(Naçao_1==portugal, Naçao_2==espanha);
(Naçao_2==portugal, Naçao_3==espanha);
(Naçao_3==portugal, Naçao_4==espanha);
(Naçao_4==portugal, Naçao_5==espanha)
),
%O grupo do Japão está em algum lugar à esquerda do grupo da Espanha.
(
(Naçao_5==espanha, (Naçao_4==japao; Naçao_3==japao; Naçao_2==japao ; Naçao_1==japao));
(Naçao_4==espanha, (Naçao_3==japao; Naçao_2==japao; Naçao_1==japao));
(Naçao_3==espanha, (Naçao_2==japao; Naçao_1==japao));
(Naçao_2==espanha, Naçao_1==japao)
),
%O estande do Japão está exatamente à direita do estande da Itália.
(
(Naçao_2==japao, Naçao_1==italia);
(Naçao_3==japao, Naçao_2==italia);
(Naçao_4==japao, Naçao_3==italia);
(Naçao_5==japao, Naçao_4==italia)
),
%O estande Branco está ao lado do estande de Portugal.
(
(Naçao_1==portugal, Cor_2==branco);
(Naçao_2==portugal, (Cor_1==branco; Cor_3==branco));
(Naçao_3==portugal, (Cor_2==branco; Cor_4==branco));
(Naçao_4==portugal, (Cor_3==branco; Cor_5==branco));
(Naçao_5==portugal, Cor_4==branco)
),
%%%%%%%%%%%% idade
   idade(Idade_1),
   idade(Idade_2),
   idade(Idade_3),
   idade(Idade_4),
   idade(Idade_5),

%Na terceira posição está o estande do representante de 8 anos.

    (Idade_3 == oito),

    alldifferent([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),
%O grupo do representante de 10 anos está exatamente à direita do estande Vermelho
(
(Idade_2==dez, Cor_1==vermelho);
(Idade_3==dez, Cor_2==vermelho);
(Idade_4==dez, Cor_3==vermelho);
(Idade_5==dez, Cor_4==vermelhi)
),
%%%%%%%%%%%%% professor

   prof(Prof_1),
   prof(Prof_2),
   prof(Prof_3),
   prof(Prof_4),
   prof(Prof_5),

   alldifferent([Prof_1, Prof_2, Prof_3, Prof_4, Prof_5]),
%O grupo do Cássio está sob o comando do professor Rogério.
(Prof_4 == rogerio, R_4== cassio),
%O grupo do representante de 9 anos está ao lado do grupo comandado pelo professor Jucenir.
(
(Prof_1==jucenir, Idade_2==nove);
(Prof_2==jucenir, (Idade_1==nove; Idade_3==nove));
(Prof_3==jucenir, (Idade_2==nove; Idade_4==nove));
(Prof_4==jucenir, (Idade_3==nove; Idade_5==nove));
(Prof_5==jucenir, Idade_4==nove)
),
% O representante de 10 anos está no grupo organizado pelo professor
% Márcio.
(
(Idade_1==dez, Prof_1==marcio);
(Idade_2==dez, Prof_2==marcio);
(Idade_3==dez, Prof_3==marcio);
(Idade_4==dez, Prof_4==marcio);
(Idade_5==dez, Prof_5==marcio)
),
%O estande Amarelo está ao lado do grupo do Gabriel.
(
(Cor_1==amarela, R_2==gabriel);
(Cor_2==amarela, (R_1==gabriel; R_3==gabriel));
(Cor_3==amarela, (R_2==gabriel; R_4==gabriel));
(Cor_4==amarela, (R_3==gabriel; R_5==gabriel));
(Cor_5==amarela, R_4==gabriel)
),
%O estande Amarelo está em algum lugar à esquerda do estande do professor Jucenir.
(
(Prof_5==jucenir, (Cor_4==amarela; Cor_3==amarela; Cor_2==amarela ; Cor_1==amarela));
(Prof_4==jucenir, (Cor_3==amarela; Cor_2==amarela; Cor_1==amarela));
(Prof_3==jucenir, (Cor_2==amarela; Cor_1==amarela));
(Prof_2==jucenir, Cor_1==amarela)
),
%O grupo do representante mais novo está em algum lugar à direita do estande Branco.
(
(Cor_1==branco, (Idade_2==sete; Idade_3==sete; Idade_4==sete; Idade_5==sete));
(Cor_2==branco, (Idade_3==sete; Idade_4==sete; Idade_5==sete));
(Cor_3==branco, (Idade_4==sete; Idade_5==sete));
(Cor_4==branco, Idade_5==sete)
),
%O estande Branco é comandado pela Rosa.
(
(Cor_1==branco, Prof_1==rosa);
(Cor_2==branco, Prof_2==rosa);
(Cor_3==branco, Prof_3==rosa);
(Cor_4==branco, Prof_4==rosa);
(Cor_5==branco, Prof_5==rosa)
),
%O estande Verde está em algum lugar à esquerda do estande da professora Rosa.
(
(Prof_5==rosa, (Cor_4==verde; Cor_3==verde; Cor_2==verde ; Cor_1==verde));
(Prof_4==rosa, (Cor_3==verde; Cor_2==verde; Cor_1==verde));
(Prof_3==rosa, (Cor_2==verde; Cor_1==verde));
(Prof_2==rosa, Cor_1==verde)
),
%O estande da Alemanha está ao lado do estande do representante de 9 anos.
(
(Idade_1==nove, Naçao_2==alemanha);
(Idade_2==nove, (Naçao_1==alemanha; Naçao_3==alemanha));
(Idade_3==nove, (Naçao_2==alemanha; Naçao_4==alemanha));
(Idade_4==nove, (Naçao_3==alemanha; Naçao_5==alemanha));
(Idade_5==nove, Naçao_4==alemanha)
),
%
nl,%insere uma nova linha (coloca o cursor no início da linha de baixo)
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).
