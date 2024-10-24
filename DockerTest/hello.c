/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hello.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmaria-d <mmaria-d@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/24 13:47:29 by mmaria-d          #+#    #+#             */
/*   Updated: 2024/10/24 15:39:02 by mmaria-d         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>

int main(int ac, char **av)
{

    while (1)
    {
        if (ac == 1)
            printf("Hello, World!\n");
        else
            printf("%s\n", av[1]);
        fflush(stdout);
        sleep(1);
    }
    
    return 0;
}