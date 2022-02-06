#include <stdio.h>
#include <stdlib.h>

int numeroNovoFib(int n){
	
	//Iniciando a sequencia
	int i;
	int num1 = 1;
	int num2 =1;
	int soma;
	
	//Operando a sequencia;
	for (i = 3; i<= n; i++){
		soma = num1 + num2;
		num1 = num2;
		num2 = soma;
	}
	
	return num2;	
}

int main(){
	int n; 
	scanf("%d", &n);
	printf("Resultado: %d\n", numeroNovoFib(n));
}
