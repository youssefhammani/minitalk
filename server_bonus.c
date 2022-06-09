/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yhammani <yhammani@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/12 01:52:58 by yhammani          #+#    #+#             */
/*   Updated: 2022/01/14 16:35:20 by yhammani         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "Minitalk.h"

int	g_pid = 0;

void	reset(char *c, int *a, int pid)
{
	*c = 0xff;
	*a = 0;
	g_pid = pid;
}

void	handler(int sig, siginfo_t *info, void *context)
{
	static char	c = 0xff;
	static int	shifter;

	(void)context;
	if (g_pid != info->si_pid)
		reset(&c, &shifter, info->si_pid);
	if (sig == SIGUSR2)
		c = c | 128 >> shifter;
	else if (sig == SIGUSR1)
		c = c ^ 128 >> shifter;
	shifter++;
	if (shifter == 8)
	{
		if (c == 0)
			kill(info->si_pid, SIGUSR2);
		write(1, &c, 1);
		c = 0xff;
		shifter = 0;
	}
}

int	main(void)
{
	struct sigaction	sa;

	ft_putstr("  PID :  ");
	ft_putnbr(getpid());
	ft_putstr("\n");
	sa.sa_sigaction = &handler;
	sa.sa_flags = SA_SIGINFO;
	sigaction(SIGUSR1, &sa, NULL);
	sigaction(SIGUSR2, &sa, NULL);
	while (1)
		pause();
}
