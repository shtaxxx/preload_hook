#define _GNU_SOURCE
#include <stdio.h>
#include <dlfcn.h>

size_t write (int d, const void *buf, size_t nbytes)
{
//  void *dl_handle;
  int (*o_write) (int d, const void *buf, size_t nbytes);
  
  o_write = dlsym(RTLD_NEXT, "write");
  printf("write called.\n");
  return (o_write(d, buf, nbytes));
}
