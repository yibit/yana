
#include <stdio.h>
#include <yana/rdfsa.h>

unsigned int rdfsa(int* a, unsigned int n) {
  int i = 0, j;

  if (!a || n <= 0) {
    return 0;
  }

  for (j = 1; j < n; j++) {
    if (*(a + i) != *(a + j)) {
      i++;
      *(a + i) = *(a + j);
    } else {
      *(a + j) = 0;  // clean
    }
  }

  return ++i;
}

void rdfsa_print(int* a, unsigned int n) {
#ifdef DDEBUG

  int i;

  for (i = 0; i < n; i++) {
    printf("a[%d] = %d\n", i, a[i]);
  }
#endif
}
