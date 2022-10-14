#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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

void Preencher(char tabuleiro[3][3])  //preencher tabuleiro com espaços vazios
{
    for(int i = 0; i < 3; i++)
    {
        for(int j = 0; j < 3; j++)
        {
            tabuleiro[i][j] = ' ';
        }
    }
}

void VerificaFimJogo(char tabuleiro[3][3], int *fim_jogo)
{
    if(tabuleiro [0][0] == 'X' && tabuleiro [0][1] == 'X' && tabuleiro [0][2] == 'X' ||
       tabuleiro [1][0] == 'X' && tabuleiro [1][1] == 'X' && tabuleiro [1][2] == 'X' ||
       tabuleiro [2][0] == 'X' && tabuleiro [2][1] == 'X' && tabuleiro [2][2] == 'X' ||
       tabuleiro [0][0] == 'X' && tabuleiro [1][0] == 'X' && tabuleiro [2][0] == 'X' ||
       tabuleiro [0][1] == 'X' && tabuleiro [1][1] == 'X' && tabuleiro [2][1] == 'X' ||
       tabuleiro [0][2] == 'X' && tabuleiro [1][2] == 'X' && tabuleiro [2][2] == 'X' ||
       tabuleiro [0][0] == 'X' && tabuleiro [1][1] == 'X' && tabuleiro [2][2] == 'X' ||
       tabuleiro [0][2] == 'X' && tabuleiro [1][1] == 'X' && tabuleiro [2][0] == 'X')
    {
        printf("Jogador 1 venceu!\n");
        *fim_jogo = 1;
    }
    else 
    if(tabuleiro [0][0] == 'O' && tabuleiro [0][1] == 'O' && tabuleiro [0][2] == 'O' ||
            tabuleiro [1][0] == 'O' && tabuleiro [1][1] == 'O' && tabuleiro [1][2] == 'O' ||
            tabuleiro [2][0] == 'O' && tabuleiro [2][1] == 'O' && tabuleiro [2][2] == 'O' ||
            tabuleiro [0][0] == 'O' && tabuleiro [1][0] == 'O' && tabuleiro [2][0] == 'O' ||
            tabuleiro [0][1] == 'O' && tabuleiro [1][1] == 'O' && tabuleiro [2][1] == 'O' ||
            tabuleiro [0][2] == 'O' && tabuleiro [1][2] == 'O' && tabuleiro [2][2] == 'O' ||
            tabuleiro [0][0] == 'O' && tabuleiro [1][1] == 'O' && tabuleiro [2][2] == 'O' ||
            tabuleiro [0][2] == 'O' && tabuleiro [1][1] == 'O' && tabuleiro [2][0] == 'O')
    {
        printf("Jogador 2 venceu!\n");
        *fim_jogo = 1;
    }  
}

void Usuario(char tabuleiro[3][3], int *comando) //jogada do usuario
{
    int linha, coluna, jogada = 1;
    
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
    *comando = 1;
}

void Computador(char tabuleiro[3][3], int *comando) //jogada do computador
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
    *comando = 0;
}

int main()
{
    char tabuleiro[3][3];
    Preencher(tabuleiro);
    int i, j;
    int comando = 0, jogadas = 0, fim_jogo = 0;
    
    while(jogadas <= 4)
    {
       
        if(comando == 0 && fim_jogo == 0)
        {
            Tabuleiro(tabuleiro);
            Usuario(tabuleiro, &comando);
            VerificaFimJogo(tabuleiro, &fim_jogo);
        }
        
        if(jogadas !=4 && fim_jogo == 0)
        {
        
            if(comando == 1)
            {
                Computador(tabuleiro, &comando);
                VerificaFimJogo(tabuleiro, &fim_jogo);
            }
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