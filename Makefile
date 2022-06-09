# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yhammani <yhammani@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/13 03:09:28 by yhammani          #+#    #+#              #
#    Updated: 2022/06/09 02:33:39 by yhammani         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = Minitalk_utils.c

CLIENT = client.c
SERVER = server.c

CLIENT_BONUS = client_bonus.c
SERVER_BONUS = server_bonus.c

OBJ = $(SRC:.c=.o)

OBJ_C = $(CLIENT:.c=.o)
OBJ_S = $(SERVER:.c=.o)

OBJ_C_BONUS = $(CLIENT_BONUS:.c=.o)
OBJ_S_BONUS = $(SERVER_BONUS:.c=.o)

CC = cc
RM = rm -rf
CFLAGS = -Wall -Wextra -Werror

all : client server

bonus : client_bonus server_bonus

client: $(OBJ) $(OBJ_C)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_C)  -o client

server: $(OBJ) $(OBJ_S)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_S)  -o server
	
client_bonus: $(OBJ) $(OBJ_C_BONUS)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_C_BONUS)  -o client_bonus

server_bonus: $(OBJ) $(OBJ_S_BONUS)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_S_BONUS)  -o server_bonus

%.o: %.c minitalk.h
	$(CC) $(CFLAGS) -c $< -o $@

clean :
	$(RM) $(OBJ) $(OBJ_S) $(OBJ_C) $(OBJ_S_BONUS) $(OBJ_C_BONUS) server client server_bonus client_bonus

fclean : clean
	$(RM) $(NAME)

re: fclean all

.PHONY:
	all bonus clean fclean re
SRC = Minitalk_utils.c

CLIENT = client.c
SERVER = server.c

CLIENT_BONUS = client_bonus.c
SERVER_BONUS = server_bonus.c

OBJ = $(SRC:.c=.o)

OBJ_C = $(CLIENT:.c=.o)
OBJ_S = $(SERVER:.c=.o)

OBJ_C_BONUS = $(CLIENT_BONUS:.c=.o)
OBJ_S_BONUS = $(SERVER_BONUS:.c=.o)

CC = cc
RM = rm -rf
CFLAGS = -Wall -Wextra -Werror

all : client server

bonus : client_bonus server_bonus

client: $(OBJ) $(OBJ_C)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_C)  -o client

server: $(OBJ) $(OBJ_S)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_S)  -o server
	
client_bonus: $(OBJ) $(OBJ_C_BONUS)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_C_BONUS)  -o client_bonus

server_bonus: $(OBJ) $(OBJ_S_BONUS)
	$(CC) $(CFLAGS) $(OBJ) $(OBJ_S_BONUS)  -o server_bonus

%.o: %.c minitalk.h
	$(CC) $(CFLAGS) -c $< -o $@

clean :
	$(RM) $(OBJ) $(OBJ_S) $(OBJ_C) $(OBJ_S_BONUS) $(OBJ_C_BONUS) server client server_bonus client_bonus

fclean : clean
	$(RM) $(NAME)

re: fclean all

.PHONY:
	all bonus clean fclean re
