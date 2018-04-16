library(ggplot2)
library(plotly)

f_pure <- ggplot(data.frame(x = c(0, 10)), aes(x = x)) +
  stat_function(fun = df, args = list(df1 = 1, df2 = 8)) +
  geom_vline(xintercept = c(qf(p = (1 - .1), df1 = 1, df2 = 8), qf(p = 1 - 0.05, df1 = 1, df2 = 8), 4.44), 
             col = c('red', 'black', 'blue'))
ggplotly(f_pure)
