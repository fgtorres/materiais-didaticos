#ifndef PILHA_H   
#define PILHA_H
#include <stdio.h>
#define MAX 100
typedef int tp_item;     
typedef struct {
    int topo;
    tp_item item[MAX];
} tp_pilha;
//configura a pilha para cenário inicial

void inicializa_pilha(tp_pilha *p){
    p->topo = -1;
}

int pilha_vazia(tp_pilha *p){
    if (p->topo == -1) return 1; //verdade
    return 0; //falso
}

int pilha_cheia(tp_pilha *p){
    if (p->topo == MAX-1) {
        return 1; //verdade
    } else {
       return 0;    //falso
    }
}

int push(tp_pilha *p, tp_item e){
    if (pilha_cheia(p)==1) return 0;
    p->topo++;
    p->item[p->topo]=e;
    return 1;
}

int pop(tp_pilha *p, tp_item *e){
    if (pilha_vazia(p)) return 0;
    *e=p->item[p->topo];
    p->topo--;
    return 1;
}

int top(tp_pilha *p, tp_item *e){
    if (pilha_vazia(p)) return 0;
    *e=p->item[p->topo];
    return 1;
}

int altura_pilha(tp_pilha *p){
    return p->topo+1;
}

void imprime_pilha(tp_pilha p){
    tp_item e;
    printf("\n");
    while (!pilha_vazia(&p)){
         pop(&p, &e);
         printf("%d ",e);
    }
}

int compara_pilhas(tp_pilha p1, tp_pilha p2){
	
	//Comparar a p1 e a p2 utilizando os metodos do
	// pilha.h e retornando 1 se forem iguais e 0 se
	// forem diferentes.
	tp_item e1,e2;
    printf("\n");
    while (!pilha_vazia(&p1) && !pilha_vazia(&p2)){
         pop(&p1, &e1);
         pop(&p2, &e2);
         
         if(e1 != e2){
			 return 0;
		 }
    }
	
	return 1;
}

int empilha_pilha(tp_pilha *p1, tp_pilha *p2){
	tp_item e;
	tp_pilha paux;
	inicializa_pilha(&paux);
	
	//Checar se a altura das pilhas e menor que MAX;
	if(altura_pilha(p1)+altura_pilha(p2) > MAX) return 0;
	
    printf("\n");
    
	//Empilhar a p2 na paux
    while (!pilha_vazia(p2)){
         pop(p2, &e);
         push(&paux, e);
    }
    
    //Empilhar a paux na p1
    while (!pilha_vazia(&paux)){
         pop(&paux, &e);
         push(p1, e);
    }
    
    return 1;
    
}

#endif