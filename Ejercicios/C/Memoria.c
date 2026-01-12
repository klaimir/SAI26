#include <stdio.h>
#include <stdlib.h>

void f1(int *arr) {
	arr = (int *) malloc(5 * sizeof(int));
}

int main() {
	int *array = NULL;
	f1(array);
	printf("Tamaño de array %ld\n", sizeof(array));
	printf("Tamaño de entero %ld\n", sizeof(int));
	printf("Tamaño real %ld\n", sizeof(array) / sizeof(int));
	return 0;
}
