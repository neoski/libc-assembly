#ifndef TEST_H
# define TEST_H

#define BLUE		"\033[01;34m"
#define BR		"\033[01;33m"
#define NC		"\033[0m"
#define PASSED		"\033[01;32mPASSED\033[0m"
#define FAILED		"\033[01;31mFAILED\033[0m"
#define TESTPR		"\033[01;34m%s\033[0m | "
#define SIZETAB(tab)	(sizeof(tab) / sizeof(*tab))

typedef	void	(*testfunc)(char *);

void	test_strlen(char *);
void	test_strchr(char *);
void	test_memset(char *);
void	test_memcpy(char *);
void	test_strcmp(char *);
void	test_memmove(char *);
void	test_strncmp(char *);
void	test_strcasecmp(char *);
void	test_rindex(char *);
void	test_strstr(char *);
void	test_strpbrk(char *);
void	test_strcspn(char *);
void	last_check(char *);

#endif /* TEST_H */
