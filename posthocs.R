library(ggplot2)
library(plotly)

t_pure <- ggplot(data.frame(x = c(-4, 4)), aes(x = x)) +
  stat_function(fun = dt, args = list(df = 12-4)) 
ggplotly(t_pure)

t_krit_uncorr <- t_pure + geom_vline(xintercept = qt((1-.05/2), df = 12-4)) + geom_vline(xintercept = -qt((1-.05/2), df = 12-4))
ggplotly(t_krit_uncorr)

# T-Werte bei .99 Quantil SIDAK CORRECTION

t_krit_adj <- t_krit_uncorr + geom_vline(xintercept = -2.8965, col = 'red') + geom_vline(xintercept = 2.8965, col = 'red')
ggplotly(t_krit_adj)

t_emp1 <- t_krit_adj + geom_vline(xintercept = -4.0825, col = 'blue')

ggplotly(t_emp1)

t_emp2 <- t_krit_adj + geom_vline(xintercept = 2.4495, col = 'blue')

ggplotly(t_emp2)

t_emp_both <- t_krit_adj + geom_vline(xintercept = 2.4495, col = 'blue') + geom_vline(xintercept = -4.0825, col = 'green')

ggplotly(t_emp_both)

# # Exakte t-werte
# t_krit_adj_exact <- t_krit_uncorr + geom_vline(xintercept = qt(.98735, df = 12-4), col = 'red') + geom_vline(xintercept = -qt(.98735, df = 12-4), col = 'red')
# ggplotly(t_krit_adj_exact)

# Bonferroni Holm Methode

#0.05 Niveau (keine Korrektur)

ggplotly(t_krit_uncorr)

# Reihenfolge: Erster Vergleich
t_krit_corr_first <- t_krit_uncorr + geom_vline(xintercept = -qt(1 - (0.025/2), df = 8), col = 'red') + geom_vline(xintercept = qt(1 - (0.025/2), df = 8), col = 'red')
ggplotly(t_krit_corr_first)

t_emp1_holm <- t_krit_corr_first + geom_vline(xintercept = -4.0825, col = 'blue')

ggplotly(t_emp1_holm)

t_krit_corr_second <- t_krit_uncorr + geom_vline(xintercept = -qt(1 - (0.05/2), df = 8), col = 'red') + geom_vline(xintercept = qt(1 - (0.05/2), df = 8), col = 'red')
ggplotly(t_krit_corr_second)

t_emp2_holm <- t_krit_corr_second + geom_vline(xintercept = 2.4495, col = 'blue')
ggplotly(t_emp2_holm)
