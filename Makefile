CC = cc
CFLAGS = -Wall -Wextra -Werror -g3

NAME = pipex

SRCS = pipex.c end_process.c child_process.c

LIBFT = ft_libft/libft.a

OBJS = $(SRCS:.c=.o)

all: $(NAME)


$(LIBFT):
	$(MAKE) -C ft_libft

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJS) $(LIBFT) -o $(NAME)

clean:
	$(MAKE) -C ft_libft clean
	rm -f $(OBJS)

fclean: clean
	$(MAKE) -C ft_libft fclean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
