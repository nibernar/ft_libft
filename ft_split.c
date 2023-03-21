/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nibernar <nibernar@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/14 14:16:44 by nibernar          #+#    #+#             */
/*   Updated: 2022/11/23 12:33:51 by nibernar         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	ft_free_malloc(char **words_tab, int i)
{
	if (!words_tab[i])
	{
		while (i >= 0)
		{
			free(words_tab[i]);
			i--;
		}
		free(words_tab);
		return (1);
	}
	return (0);
}

static int	ft_words_size(char const *s, char c)
{
	int	i;
	int	words_size;

	i = 0;
	words_size = 0;
	while (s[i])
	{
		if (s[i] == c)
		{
			while (s[i] == c)
			i++;
		}
		if (s[i] == '\0')
			break ;
		while (s[i] && s[i] != c)
			i++;
		words_size++;
	}
	return (words_size);
}

static char	**ft_split_bis(const char *s, char **words_tab, char c, int i)
{
	int	index;
	int	j;

	index = 0;
	j = 0;
	while (s[i])
	{
		if (s[i] == c)
		{
			while (s[i] == c)
				i++;
		}
		if (s[i] == '\0')
			break ;
		index = i;
		while (s[index] && s[index] != c)
			index++;
		words_tab[j] = ft_substr(s, i, (index - i));
		if (j <= ft_words_size(s, c) && ft_free_malloc(words_tab, j))
			return (0);
		j++;
		i = index;
	}
	return (words_tab);
}

char	**ft_split(char const *s, char c)
{
	char	**words_tab;

	if (!s)
		return (0);
	words_tab = ft_calloc(sizeof(char *), (ft_words_size(s, c) + 1));
	if (!words_tab)
		return (0);
	return (ft_split_bis(s, words_tab, c, 0));
}
