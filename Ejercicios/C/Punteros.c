#include <stdio.h>

int main() {
	int num = 1;
	int *pNum = NULL;
	pNum = &num;
	printf("num = %d\n", num);
	*pNum = 2;
	printf("num = %d\n", num);
	return 0;
}
