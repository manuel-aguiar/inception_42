/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   hello.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mmaria-d <mmaria-d@student.42lisboa.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/24 13:47:29 by mmaria-d          #+#    #+#             */
/*   Updated: 2024/10/30 13:48:03 by mmaria-d         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>
#include <stdio.h>

// Signal handler function
void handle_signal(int sig) {
    switch(sig) {
        case SIGQUIT:
            printf("Received SIGQUIT (signal number %d)\n", sig);
            fflush(stdout); 
            exit(0);
            break;
        case SIGINT:
            printf("Received SIGINT (signal number %d)\n", sig);
            fflush(stdout); 
            break;
        case SIGTERM:
            printf("Received SIGTERM (signal number %d)\n", sig);
            fflush(stdout); 
            break;
        // You can add more cases for other signals if needed
        default:
            printf("Received signal number %d\n", sig);
            fflush(stdout); 
            break;
    }
    
    // Exit the program after handling the signal
    
}

int main(int argc, char *argv[]) {
    // Set up the signal handler for SIGQUIT and SIGINT
    signal(SIGTERM, handle_signal);
    signal(SIGQUIT, handle_signal);
    signal(SIGINT, handle_signal);

    if (argc > 1) {
        printf("%s\n", argv[1]); // Print the argument passed via CMD
    }

    // Infinite loop printing "Hello World!"
    while (1) {
        printf("Hello World!\n");
        fflush(stdout); // Ensure output is flushed
        sleep(1);       // Wait for 1 second
    }

    return 0; // This will never be reached in an infinite loop
}
