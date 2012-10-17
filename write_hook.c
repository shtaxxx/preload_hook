#include <stdio.h>

size_t write (int d, const void *buf, size_t nbytes)
{
  printf("write called.\n");
  return nbytes;
}
