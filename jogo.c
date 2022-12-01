#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

void Tabuleiro(char tabuleiro[9]) //renderizar tabuleiro
{
    //tabuleiro jogo da velha
    printf("\n\n#####JOGO DA VELHA#####\n\n");
    printf("  %c  |  %c  |  %c  \n", tabuleiro[0], tabuleiro[1], tabuleiro[2]);
    printf("-----------------\n");
    printf("  %c  |  %c  |  %c  \n", tabuleiro[3], tabuleiro[4], tabuleiro[5]);
    printf("-----------------\n");
    printf("  %c  |  %c  |  %c  \n", tabuleiro[6], tabuleiro[7], tabuleiro[8]);
    printf("\n");
 
}

void VerificaFimJogo(char tabuleiro[9], int* fim_jogo) {
    //determines if a player has won, returns 0 otherwise.
    unsigned wins[8][3] = {{0,1,2},{3,4,5},{6,7,8},{0,3,6},{1,4,7},{2,5,8},{0,4,8},{2,4,6}};
    for(int i = 0; i < 8; ++i) {
        if(tabuleiro[wins[i][0]] != ' ' &&
           tabuleiro[wins[i][0]] == tabuleiro[wins[i][1]] &&
           tabuleiro[wins[i][0]] == tabuleiro[wins[i][2]]) {
               printf("Jogador %c venceu!", tabuleiro[wins[i][2]]);
               *fim_jogo = 1;
           }
    }
}

int win(char tabuleiro[9]) {
    //determines if a player has won, returns 0 otherwise.
    unsigned wins[] = {0,1,2, 3,4,5, 6,7,8, 0,3,6, 1,4,7, 2,5,8, 0,4,8, 2,4,6};
    for(int i = 0; i < 8; ++i) {    
        if(tabuleiro[wins[i*3]] != ' ' &&
           tabuleiro[wins[i*3]] == tabuleiro[wins[i*3 + 1]] &&
           tabuleiro[wins[i*3]] == tabuleiro[wins[i*3 + 2]]) {
               return 1;
           }
    }

    return 0;
}


void Usuario(char tabuleiro[10]) //jogada do usuario
{
    int jogada = 1;
   
    while(jogada==1)
    {
        printf("Digite a posição [0-8]: ");
        int pos;
        scanf("%d", &pos);
        if (tabuleiro[pos] == ' ')
        {
            tabuleiro[pos] = 'X';
            jogada = 0;
        }
        if(jogada == 1)
        {
            printf("\n Jogada Invalida :( Tente outro lugar: \n");
        }        
    }
}


void Computador(char tabuleiro[10]) //jogada do computador
{
    int jogador = 1;
   
    while(jogador==1)
    {
        // Opção 1 - tentar vencer
        for(int i = 0; i < 9; i++) {
            if(tabuleiro[i] == ' ') {
                tabuleiro[i] = 'O';
                if(win(tabuleiro)) {
                    return;
                }
                tabuleiro[i] = ' ';
            }
        }

        // Opção 2 - impedir o usuário de vencer
        for(int i = 0; i < 9; i++) {
            if(tabuleiro[i] == ' ') {
                tabuleiro[i] = 'X';
                if(win(tabuleiro)) {
                    tabuleiro[i] = 'O';
                    return;
                }
                tabuleiro[i] = ' ';
            }
        }
       
        // Opção 3 - jogar aleatoriamente
        int pos = rand() % 9;
        if (tabuleiro[pos] == ' ')
        {
            tabuleiro[pos] = 'O';
            jogador = 0;
        }
    }
}

int main()
{
    srand(time(0));
    char tabuleiro[10] = {32,32,32,
                          32,32,32,
                          32,32,32};
   
    int jogadas = 0, fim_jogo = 0;
   
    while(jogadas <= 4)
    {
        if(fim_jogo == 0)
        {
            Tabuleiro(tabuleiro);
            Usuario(tabuleiro);
            VerificaFimJogo(tabuleiro, &fim_jogo);
        }
       
        if(jogadas !=4 && fim_jogo == 0)
        {
           
            Computador(tabuleiro);
            VerificaFimJogo(tabuleiro, &fim_jogo);
        }    
        jogadas++;
    }
   
    if(fim_jogo == 1 || jogadas > 4)
    {
        printf("\n!!!FIM DE JOGO!!!\n");
        Tabuleiro(tabuleiro);
    }
    return 0;
}