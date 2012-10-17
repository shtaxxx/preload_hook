#include <stdio.h>
#include <dlfcn.h>

int main()
{
  void *dl_handle;
  int (*func)(void);
  int *value;
  
  dl_handle = dlopen("./lib.so", RTLD_LAZY);

  func = dlsym(dl_handle, "hoge");
  value = dlsym(dl_handle, "static_value");

  (*func)();

  *value = 200;

  (*func)();

  dlclose(dl_handle);
  return 0;
}
