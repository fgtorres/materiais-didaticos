#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
#include <windows.h>

//Constantes
#define NUMERO_DE_TENTATIVAS 10

//Structs
typedef struct{
	int valor;
	int contrep;
	int ordem;
} tentativa;

void gotoxy(int x, int y){
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), (COORD){x-1,y-1});
}

//CHALLENGER ONE ADVANCED
//Contar a quantidade de chutes pares e retornar o cont
int contchutespar(int i, tentativa *tentativas){
	//Desenvolva a logica.
	int contpar=0;
	int j;
	
	for(j=0; j<i; j++){
		if(tentativas[j].valor%2==0){
			contpar++;
		}
	}
	return contpar;
}

//CHALLENGER TWO ADVANCED
//Contar a quantidade de chutes repetidos e retornar o cont
int checarepeticoes(tentativa *tentativas, int chute){
	int repeticoes = 0;
	
	//Desenvolva a logica de contagem de repeticoes do chute.
	int j;
	for(j = 0; j < NUMERO_DE_TENTATIVAS; j++)
	{
		if(chute == tentativas[j].valor)
			repeticoes++;
	}
	
	return repeticoes;
}

int listadechutes(int i, tentativa *tentativas){
       int j;
	   gotoxy(50,12);
	   printf("LISTA DE CHUTES\r\n\r\n");
	   for(j = 0; j < i; j++)
	   {
   		   tentativas[j].contrep = checarepeticoes(tentativas,tentativas[j].valor);
	   	   gotoxy(50,14+j);
		   printf("[%d] %d - %d vezes.", j, tentativas[j].valor,tentativas[j].contrep);
	   }
	   
	   return j;
}

void telajogo(int chute, int numerosecreto){
      int i;
      
      //Declarando o vetor.
      tentativa tentativas[NUMERO_DE_TENTATIVAS];
      
	  for(i = 1; i <= NUMERO_DE_TENTATIVAS; i++)
   	   {
	   //Pegando chute do usuario
	   gotoxy(50,7);
	   printf("Tentativa %d de %d ", i, NUMERO_DE_TENTATIVAS);
	   gotoxy(50,8);
	   printf("Qual o seu chute?");
	   scanf("%d", &chute);
	   
	   //Guardar o chute no vetor chutes
	   tentativas[i-1].valor = chute;
	   tentativas[i-1].ordem = i;
	   tentativas[i-1].contrep = checarepeticoes(tentativas,chute);
	   
	   //Checando o chute
	   if (chute == numerosecreto){
           gotoxy(50,10);
		   printf("Parabens voce acertou o numero! \n\n");
		   
		   //Listar todos os chutes
           int contchutes = listadechutes(i,tentativas);
           gotoxy(50,16+contchutes);
		   printf("Voce chutou %d vezes.", contchutes);
		   
		   //Listar quantidade de chutes pares
           int contpar = contchutespar(i,tentativas);
           gotoxy(50,17+contchutes);
		   printf("Voce chutou %d numeros pares.", contpar);
		   
		   
		   break;
	   
	   }else{
   		   //Checar e dar a dica
   		   gotoxy(50,10);
   		   printf("Voce errou, tente denovo\n");
   		   if(chute > numerosecreto) {
   		   	    gotoxy(50,12);
			    printf("%d e maior que o numero secreto.",chute);
		   }else{
		   	  gotoxy(50,12);
			  printf("%d e menor que o numero secreto.",chute); 
 		   }
		   
		   gotoxy(50,15);
           printf("<<Aperte uma tecla para continuar>>",chute); 	  
	   }
	   getch();
	   system("cls");
   }
}

int sorteianumero(int limite){
	//Configurando o seed do rand
   int segundos = time(0);
   srand(segundos);
   
   //Declaracao de variaveis
   int numerosecreto = rand() % limite;
   return numerosecreto;
}

int main(){
   //Sorteando o numero misterioso
   int numerosecreto = sorteianumero(100);
   int chute = 0;
   
   //Comecando o jogo
   telajogo(chute, numerosecreto);
}
