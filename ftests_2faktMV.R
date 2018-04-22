library(ggplot2)
library(plotly)

f_a <- ggplot(data.frame(x = c(0, 10)), aes(x = x)) +
  stat_function(fun = df, args = list(df1 = 1, df2 = 8)) +
  geom_vline(xintercept = c(qf(p = 1 - 0.05, df1 = 1, df2 = 8), 8.877), 
             col = c('red', 'black'))
ggplotly(f_a)


f_b <- ggplot(data.frame(x = c(0, 10)), aes(x = x)) +
  stat_function(fun = df, args = list(df1 = 2, df2 = 16)) +
  geom_vline(xintercept = c(qf(p = 1 - 0.05, df1 = 2, df2 = 16), 1.874), 
             col = c('red', 'black'))
ggplotly(f_b)

f_ab <- ggplot(data.frame(x = c(0, 10)), aes(x = x)) +
  stat_function(fun = df, args = list(df1 = 2, df2 = 16)) +
  geom_vline(xintercept = c(qf(p = 1 - 0.05, df1 = 2, df2 = 16), 4.112), 
             col = c('red', 'black'))
ggplotly(f_ab)
