#include <stdio.h>
#include <stdlib.h>

int numeroNovoFib(unsigned long int n){
    if (n==1) return 1;
    return (n==2)? 1 : 
		(numeroNovoFib(n-1) + numeroNovoFib( n-2));	
}
k
int main(){
	unsigned long int n; 
	scanf("%d", &n);
	printf("Resultado: %d\n", numeroNovoFib(n));
	return 0;
}
