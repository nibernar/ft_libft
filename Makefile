# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nibernar <nibernar@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/09 15:01:55 by nibernar          #+#    #+#              #
#    Updated: 2022/11/23 13:53:05 by nibernar         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

SRCS		=	ft_bzero.c		\
				ft_isalnum.c	\
				ft_isalpha.c	\
				ft_isascii.c	\
				ft_isdigit.c	\
				ft_isprint.c	\
				ft_memcpy.c		\
				ft_memmove.c	\
				ft_memset.c		\
				ft_strlen.c		\
				ft_tolower.c	\
				ft_toupper.c	\
				ft_strchr.c		\
				ft_strrchr.c	\
				ft_memchr.c		\
				ft_memcmp.c		\
				ft_strlcpy.c	\
				ft_strncmp.c	\
				ft_strlcat.c	\
				ft_strnstr.c	\
				ft_atoi.c		\
				ft_calloc.c		\
				ft_strdup.c		\
				ft_substr.c		\
				ft_strjoin.c	\
				ft_strtrim.c	\
				ft_split.c		\
				ft_itoa.c		\
				ft_strmapi.c	\
				ft_striteri.c	\
				ft_putchar_fd.c	\
				ft_putstr_fd.c	\
				ft_putendl_fd.c	\
				ft_putnbr_fd.c	\

SRCS_BONUS	=	ft_lstnew_bonus.c		\
				ft_lstadd_front_bonus.c	\
				ft_lstlast_bonus.c		\
				ft_lstsize_bonus.c		\
				ft_lstadd_back_bonus.c	\
				ft_lstdelone_bonus.c	\
				ft_lstclear_bonus.c		\
				ft_lstiter_bonus.c		\
				ft_lstmap_bonus.c		\

OBJ			=	${SRCS:.c=.o}

NAME		=	libft.a

HEADER		=	libft.h

CC			=	gcc

FLAG		=	-Wall -Wextra -Werror

RAN			=	ranlib

RM			=	rm -f

OBJ_BONUS	=	${SRCS_BONUS:.c=.o}

%.o			:	%.c ${HEADER} Makefile
				${CC} ${FLAG} -c $< -o ${<:.c=.o} -I

${NAME}		:	${OBJ}
				ar rc ${NAME} ${OBJ}
				${RAN} ${NAME}

all			:	${NAME}

clean		:
				${RM} ${OBJ} ${OBJ_BONUS}

fclean		:	clean
				${RM} ${NAME}

re			:	fclean all

bonus		:	${OBJ} ${OBJ_BONUS}
				ar rc ${NAME} ${OBJ} ${OBJ_BONUS}
				${RAN} ${NAME}

.PHONY		:	all clean fclean re bonus
