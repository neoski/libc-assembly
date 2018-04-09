NAME		=	libasm.so

SRC_DIR		=	./src

SRC_EXT		=	S

SRCS		=	src/memmove.S	\
			src/strstr.S	\
			src/strncmp.S	\
			src/strlen.S	\
			src/strcspn.S	\
			src/strcmp.S	\
			src/memset.S	\
			src/strcasecmp.S	\
			src/memcpy.S	\
			src/strchr.S	\
			src/strpbrk.S	\
			src/rindex.S	\
			src/strcpy.S	\
			src/strnlen.S	\
			src/strrchr.S	\
			src/bzero.S


OBJS		=	$(SRCS:.$(SRC_EXT)=.o)

RM		=	-rm -rf

CC		=	gcc

CFLAGS		=	-f macho64

all		:	$(NAME)

$(NAME)		:	$(OBJS)
			$(CC) -o $(NAME) -shared $(OBJS)

%.o		:	%.S
			nasm $(CFLAGS) -o $@ $< 

clean		:
			$(RM) $(OBJS)

fclean		:	clean
			$(RM) $(NAME)

re		:	fclean all

.PHONY		:	fclean clean all re
