#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

void Tabuleiro(char tabuleiro[3][3]) //renderizar tabuleiro
{
    //tabuleiro jogo da velha
    printf("\n\n#####JOGO DA VELHA#####\n\n");
    printf("  %c  |  %c  |  %c  \n", tabuleiro[0][0], tabuleiro[0][1], tabuleiro[0][2]);
    printf("-----------------\n");
    printf("  %c  |  %c  |  %c  \n", tabuleiro[1][0], tabuleiro[1][1], tabuleiro[1][2]);
    printf("-----------------\n");
    printf("  %c  |  %c  |  %c  \n", tabuleiro[2][0], tabuleiro[2][1], tabuleiro[2][2]);
    printf("\n");
 
}

void VerificaFimJogo(char tabuleiro[3][3], int *fim_jogo)
{
    int i, j;
    char vencedor;
    //verifica se o jogo acabou
    for (i = 0; i < 3; i++)
    {
        if (tabuleiro[i][0] == tabuleiro[i][1] && tabuleiro[i][1] == tabuleiro[i][2] && tabuleiro[i][0] != ' ')
        {
            *fim_jogo = 1;
            vencedor = tabuleiro[i][0];
        }
    }
    for (j = 0; j < 3; j++)
    {
        if (tabuleiro[0][j] == tabuleiro[1][j] && tabuleiro[1][j] == tabuleiro[2][j] && tabuleiro[0][j] != ' ')
        {
            *fim_jogo = 1;
            vencedor = tabuleiro[0][j];
        }
    }
    if (tabuleiro[0][0] == tabuleiro[1][1] && tabuleiro[1][1] == tabuleiro[2][2] && tabuleiro[0][0] != ' ')
    {
        *fim_jogo = 1;
        vencedor = tabuleiro[0][0];
    }
    if (tabuleiro[0][2] == tabuleiro[1][1] && tabuleiro[1][1] == tabuleiro[2][0] && tabuleiro[0][2] != ' ')
    {
        *fim_jogo = 1;
        vencedor = tabuleiro[0][2];
    }

    if (vencedor == 'X')
    {
        printf("\nO jogador X venceu!\n");
    }
    else if (vencedor == 'O')
    {
        printf("\nO jogador O venceu!\n");
    }
}

void Usuario(char tabuleiro[3][3]) //jogada do usuario
{
    int jogada = 1;
    
    while(jogada==1)
    {
        int linha, coluna;
        printf("Digite a linha: ");
        scanf("%d", &linha);
        printf("Digite a coluna: ");
        scanf("%d", &coluna);
        if (tabuleiro[linha][coluna] == ' ')
        {
            tabuleiro[linha][coluna] = 'X';
            jogada = 0;
        }
        if(jogada == 1)
        {
            printf("\n Jogada Invalida :( Tente outro lugar: \n");
        }        
    }
}

void Computador(char tabuleiro[3][3]) //jogada do computador
{
    int linha, coluna, jogador = 1;
    
    while(jogador==1)
    {
        int linha, coluna;
        linha = rand() % 3;
        coluna = rand() % 3;
        if (tabuleiro[linha][coluna] == ' ')
        {
            tabuleiro[linha][coluna] = 'O';
            jogador = 0;
        }
    }
}

int main()
{
    char tabuleiro[3][3];
    memset(tabuleiro, ' ', sizeof(tabuleiro));
    int i, j;
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
    else
    {
        printf("\nEMPATE\n");
        printf("\n!!!FIM DE JOGO!!!\n");
        Tabuleiro(tabuleiro);
    }
    return 0;
}