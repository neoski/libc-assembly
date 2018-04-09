#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>
#include "test.h"

void	test_strlen(char *string)
{
  int	len = (int)strlen(string);

  printf(TESTPR, "strlen");
  printf("length is %d, expects %d : %s\n",
	 len, 31, (len == 31 ? PASSED : FAILED));
}

void	test_strchr(char *string)
{
  char	*found = strchr(string, 'l');

  printf(TESTPR, "strchr");
  printf("'%s' at 'l' -> '%s', expects 'long string' : %s\n",
	 string, found, (!strcmp(found, "long string") ? PASSED : FAILED));
}

void	test_memset(char *string)
{
  char	*new = memset(strdup(string), 'a', 4);
  char	*expected = "aaaa is a very very long string";

  printf(TESTPR, "memset");
  printf("'%s' at 'l' -> '%s', expects '%s' : %s\n",
	 string, new, expected, (!strcmp(new, expected) ? PASSED : FAILED));
  free(new);
}

void	test_memcpy(char *string)
{
  char	*new = memcpy(strdup(string), "That", 4);
  char	*expected = "That is a very very long string";

  
  printf(TESTPR, "memcpy");
  printf("'%s' 4 char 'That' -> '%s', expects '%s' : %s\n",
	 string, new, expected, (!strcmp(new, expected) ? PASSED : FAILED));
  free(new);
}

void	test_strcmp(char *string)
{
  char	*cmp = strdup(strchr(string, 'l'));
  char	*ref;
  int	diff;

  ref = "long string";
  diff = strcmp(cmp, ref);
  printf(TESTPR, "strcmp");
  printf("'%s' and '%s' -> %d, expects %d : %s\n", cmp, ref, diff, 0, (diff == 0 ? PASSED : FAILED));

  ref = "long a";
  diff = strcmp(cmp, ref);
  printf(TESTPR, "strcmp");
  printf("'%s' and '%s' -> %d, expects %d : %s\n", cmp, ref, diff, 18, (diff == 18 ? PASSED : FAILED));

  ref = "long z";
  diff = strcmp(cmp, ref);
  printf(TESTPR, "strcmp");
  printf("'%s' and '%s' -> %d, expects %d : %s\n", cmp, ref, diff, -7, (diff == -7 ? PASSED : FAILED));
}

void	test_strncmp(char *string)
{
  char	*cmp = strdup(strchr(string, 'l'));
  char	*ref;
  int	diff;

  ref = "long string";
  diff = strncmp(cmp, ref, 0);
  printf(TESTPR, "strncmp");
  printf("'%s' and '%s' for %d -> %d, expects %d : %s\n", cmp, ref, 0, diff, 0, (diff == 0 ? PASSED : FAILED));

  ref = "long a";
  diff = strncmp(cmp, ref, 4);
  printf(TESTPR, "strncmp");
  printf("'%s' and '%s' for %d chars -> %d, expects %d : %s\n", cmp, ref, 4, diff, 0, (diff == 0 ? PASSED : FAILED));

  ref = "long z";
  diff = strncmp(cmp, ref, 8);
  printf(TESTPR, "strncmp");
  printf("'%s' and '%s' for %d -> %d, expects %d : %s\n", cmp, ref,  8, diff, -7, (diff == -7 ? PASSED : FAILED));
}

void	test_memmove(char *string)
{
  char	*dup = strdup(string);
  char	*expected = "This is a very long long string";

  memmove(&dup[15], &dup[20], 4);
  printf(TESTPR, "memmove");
  printf("'%s' from %d to %d for %d -> '%s', expected '%s' : %s\n",
	 string, 14, 17, 4, dup, expected, (!strcmp(dup, expected) ? PASSED : FAILED));
  free(dup);
}

void	test_strcasecmp(char *b)
{
  char *a = "iahsdoadhosjdoajsdoj";

  (void)b;
  printf("%d\n", (int)strcasecmp(a, "Iosfdksdfksdk"));
  printf("%d\n", (int)strcasecmp(a, "IAHSdasja"));
  printf("%d\n", (int)strcasecmp(a, "disfiidfs"));
  printf("%d\n", (int)strcasecmp(a, ""));
}

void	test_rindex(char *b)
{
  char *a = "iahsdoadhosjdoajsdoj";

  (void)b;
  printf("%s\n", rindex(a, 'o'));
  printf("%s\n", rindex(a, 'i'));
  printf("%s\n", rindex(a, 0));
}

void	test_strstr(char *b)
{
  char *a = "iahsdoadhosjdoajsdoj";

  (void)b;
  printf("%s\n", strstr(a, "jdoa"));
  printf("%s\n", strstr(a, "a"));
  printf("%s\n", strstr(a, ""));
}

void	test_strpbrk(char *b)
{
  char *a = "iahsdoadhosjdoajsdoj";

  (void)b;
  printf("%s\n", strpbrk(a, "jsdadoa"));
  printf("%s\n", strpbrk(a, "sdfsdfa"));
  printf("%s\n", strpbrk(a, "sfdsdfs"));
  printf("%s\n", strpbrk(a, "sdfsfasz"));
}

void	test_strcspn(char *b)
{
  char *a = "iahsdoadhosjdoajsdoj";

  (void)b;
  printf("%d\n", (int)strcspn(a, "jsdadoa"));
  printf("%d\n", (int)strcspn(a, "sdfsdfa"));
  printf("%d\n", (int)strcspn(a, "sfdsdfs"));
  printf("%d\n", (int)strcspn(a, "sdfsfasz"));
}

void	last_check(char *b)
{
  char *a = "iahsdoadhosjdoajsdoj";
  b = malloc(100);

  printf("%d\n", (int)strnlen(a, 10));
  printf("%s\n", strrchr(a, 's'));
  printf("%s\n", strcpy(b, a));
  bzero(b, 100);
  printf("%s\n", b);
  free(b);
}
