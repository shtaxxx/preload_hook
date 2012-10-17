#include <stdio.h>
int static_value = 100;

int hoge()
{
  printf("hogehoge %d\n", static_value);
  return 0;
}
