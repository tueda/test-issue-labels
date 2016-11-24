//#define alignof __alignof
#include <cstdio>

int main() {
#ifdef _MSC_VER
  printf("%d %d\n", _MSC_VER, _MSC_FULL_VER);
#else
  printf("No _MSC_VER\n");
#endif
  printf("%d\n", (int)alignof(int));
  return 0;
}
