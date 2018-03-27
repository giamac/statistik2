### Zweifaktorielle Varianzanalyse ###

## Alkoholbeispiel ## 

aggro <- c(69,73,74,74,79,72,71,69,67,64,58,64)

alk <- c(rep('ja', each = 3), rep('nein', each = 3))

erwartung <- c(rep('ja', each = 6), rep('nein', each = 6))

df <- data.frame(aggro, alk, erwartung)

library(dplyr)

summarised_df <- df %>%
  group_by(alk, erwartung) %>%
  summarise(meanAggro = mean(aggro))

main_effect_alk <- df %>%
  group_by(alk) %>%
  summarise(meanAggro = mean(aggro))

main_effect_erwartung <- df %>%
  group_by(erwartung) %>%
  summarise(meanAggro = mean(aggro))

library(ggplot2)

effects_plot1 <- summarised_df %>%
  ggplot(aes(x= alk, y = meanAggro, color = erwartung, group = erwartung)) +
  geom_point(size = 4) + 
  geom_line(size = 1) +
  geom_jitter(data = df, alpha = 0.3, position = position_jitter(width = 0.1), size = 2, aes (x = alk, y = aggro, group = erwartung, color = erwartung)) + 
  geom_line(data = main_effect_alk, aes(x = alk, y = meanAggro, group = 1, color = ''), size = 1.5) 

effects_plot_line_1 <- ggplot(data = main_effect_alk, aes(x = alk, y = meanAggro, group = 1), size = 1.5) + 
  geom_line(size = 1.5, linetype = 2) +
  geom_jitter(alpha = 0.6, position = position_jitter(width = 0.1), 
              data = df, 
              aes(x = alk, y = aggro, color = erwartung, group = erwartung)) + 
  geom_point(data = summarised_df, size = 4, aes(x = alk, y = meanAggro, color = erwartung, group = erwartung))+
  geom_line(data = summarised_df, aes(x = alk, y = meanAggro, color = erwartung, group = erwartung))
  
    effects_plot2 <- summarised_df %>%
  ggplot(aes(x= erwartung, y = meanAggro, color = alk, group = alk)) +
  geom_point(size = 4) + 
  geom_line( size = 1) +
  geom_jitter(data = df, alpha = 0.6, position = position_jitter(width = 0.1), size = 2, aes (x = erwartung, y = aggro, group = alk, color = alk))

    
    effects_plot_line_2 <- ggplot(data = main_effect_erwartung, aes(x = erwartung, y = meanAggro, group = 1), size = 1.5) + 
      geom_line(size = 1.5, linetype = 2) +
      geom_jitter(alpha = 0.6, position = position_jitter(width = 0.1), 
                  data = df, 
                  aes(x = erwartung, y = aggro, color = alk, group = alk)) + 
      geom_point(data = summarised_df, size = 4, aes(x = erwartung, y = meanAggro, color = alk, group = alk))+
      geom_line(data = summarised_df, aes(x = erwartung, y = meanAggro, color = alk, group = alk))
    