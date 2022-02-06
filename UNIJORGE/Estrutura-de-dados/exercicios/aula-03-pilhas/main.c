#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

int main() {
	//Criando uma pilha
	tp_pilha p1, p2;
	inicializa_pilha(&p1);
	inicializa_pilha(&p2);
	
	//Push dos elementos 1,2,3 na pilha 1.
	push(&p1, 1);
	push(&p1, 2);
	push(&p1, 3);
	push(&p2, 3);
	push(&p2, 7);
	push(&p2, 8);
	push(&p2, 10);	
	
	empilha_pilha( &p1, &p2);
	
	//Imprimir a pilha 1.
	imprime_pilha(p1);
	
	return 0;
}