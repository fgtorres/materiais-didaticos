#include <stdio.h>
#include <stdlib.h>
#include "listase.h"

int main()
{
	//Testando a lista.
	tp_listase *l1 = aloca_listase();
	tp_listase *l2 = aloca_listase();
	
	//Checando se a lista esta vazia
	if(listase_vazia(l1)== 1)
		printf("Nossa lista esta vazia.");
		
	//Inserindo 10 na lista.
	insere_listase_em_ordem(&l1, 10);
	insere_listase_em_ordem(&l1, 15);
	insere_listase_em_ordem(&l1, 14);
	insere_listase_em_ordem(&l1, 20);
	insere_listase_em_ordem(&l1, 2);
	
	//Inserindo 10 na lista.
	insere_listase_em_ordem(&l2, 10);
	insere_listase_em_ordem(&l2, 15);
	insere_listase_em_ordem(&l2, 14);
	insere_listase_em_ordem(&l2, 20);
	
	//Listar os valores da lista.
	imprime_listase(l1);
	printf("\r\n \r\n A lista possui %d elementos.\r\n", tamanho_listase(l1));
	printf("\r\n \r\n A lista possui %d elementos maiores que 12.\r\n\r\n", qtde_nos_maiores(l1, 12));
	printf(listase_igual(l1, l2) == 1 ? "L1 e igual a L2\r\n" : "L1 e diferente da L2\r\n");
	
	return 0;
}