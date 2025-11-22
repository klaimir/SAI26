#include <stdio.h>
int main() {
	int numFilas = 2;
	int numColumnas = 3;
	int matriz[numFilas][numColumnas];

	/* Rellenamos matriz */
	int valor = 1;
	for(int i=0; i < numFilas; i++) {
		for(int j=0; j < numColumnas; j++) {
			matriz[i][j] = valor++;
	        }
	}

	/* Mostramos  matriz */
        for(int i=0; i < numFilas; i++) {
                for(int j=0; j < numColumnas; j++) {
                        printf("[%d][%d]=%d\n", i, j, matriz[i][j]);
                }
        }

	return 0;
}
