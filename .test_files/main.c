#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "test.h"

testfunc	g_tests[] = {
  &test_strlen,
  &test_strchr,
  &test_memset,
  &test_memcpy,
  &test_strcmp,
  &test_memmove,
  &test_strncmp,
  &test_strcasecmp,
  &test_rindex,
  &test_strstr,
  &test_strpbrk,
  &test_strcspn,
  &last_check
};

int	main()
{
  char	*string;
  int	i;
  int	max;

  string = strdup("This is a very very long string");
  printf("Test string is : '%s%s%s'\n", BR, string, NC);
  max = SIZETAB(g_tests);
  for (i = 0; i < max; ++i)
    (g_tests[i])(string);
  free(string);
  return (0);
}
