#include <stdio.h>

void incrementarValor(int *valor);

int main() {
	int val = 2;
	incrementarValor(&val);
	printf("El valor de val es %d\n", val);
	return 0;
}

void incrementarValor(int *valor) {
	*valor = *valor + 1;
}
