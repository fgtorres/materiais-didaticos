#include <stdio.h>

int fatorial (n){
	if ((n==0) || (n==1)) return 1;
	return fatorial(n-1)*n;
}

int main()
{
	int n;
	printf("Informe o numero que deseja fatorar:\n ");
	scanf("%d", &n);
	printf("O fatorial de %d e %d", n, fatorial(n));
	return 0;
}