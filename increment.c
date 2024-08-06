#include <stdio.h>

int main() {
  int n;
  int r = scanf("%d", &n);
  if (r == 1) {
    n++;
    printf("%d\n", n);
  } else {
    fprintf(stderr, "error: can't read a number\n");
  }
}

