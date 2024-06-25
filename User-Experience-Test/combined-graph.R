library(ggplot2)
library(tidyverse)

Scale <- c(
  'Attractiveness',
  'Perspicuity',
  'Efficiency',
  'Dependability',
  'Stimulation',
  'Novelty'
)
`Lower Border` <- c(-1.50, -1.50, -1.50, -1.50, -1.50, -1.50)
Bad <- c(0.69, 0.72, 0.6, 0.78, 0.5, 0.16)
`Below Average` <- c(0.49, 0.48, 0.45, 0.36, 0.5, 0.54)
`Above Average` <- c(0.4, 0.53, 0.45, 0.34, 0.35, 0.42)
Good <- c(0.26, 0.27, 0.38, 0.22, 0.35, 0.48)
Excellent <- c(1.16, 1.0, 1.12, 1.3, 1.3, 1.4)

df_benchmark <- data.frame(`Scale` = factor(Scale, levels = Scale), 
                           `Lower Border`, Bad, `Below Average`, `Above Average`, Good, Excellent) %>%
  pivot_longer(!Scale, names_to = 'Threshold', values_to = 'Value') %>%
  mutate(Threshold = str_replace(Threshold, '\\.', ' '))
df_benchmark$Threshold <- factor(df_benchmark$Threshold, levels = c('Excellent', 'Good', 'Above Average', 'Below Average', 'Bad', 'Lower Border'))

`T3.1` <- c(0.93, 1.30, 1.00, 0.90, 0.45, -0.55)
`CI T3.1 lower` <- c(0.283, -0.132, 0.361, 0.197, -0.196, -1.459)
`CI T3.1 upper` <- c(1.583, 2.732, 1.639, 1.603, 1.096, 0.359)

`T3.2` <- c(1.4, 1.45, 1.45, 1.2, 1.2, 1)
`CI T3.2 lower` <- c(1.019, 0.823, 0.950, 0.156, 0.725, 0.225)
`CI T3.2 upper` <- c(1.781, 2.077, 1.950, 2.244, 1.675, 1.775)

`T3.3` <- c(1.67, 1.7, 1.35, 1.15, 1.4, 1.25)
`CI T3.3 lower` <- c(1.324, 0.904, 0.613, 0.579, 1.002, 0.557)
`CI T3.3 upper` <- c(2.009, 2.496, 2.087, 1.721, 1.798, 1.943)

df_techniques <- rbind(data.frame(`Technique` = 'T3.1',
                            `Scale` = factor(Scale, levels = Scale), 
                            `Mean` = `T3.1`,
                            `CI lower` = `CI T3.1 lower`,
                            `CI upper` = `CI T3.1 upper`),
                       data.frame(`Technique` = 'T3.2',
                                  `Scale` = factor(Scale, levels = Scale), 
                                  `Mean` = `T3.2`,
                                  `CI lower` = `CI T3.2 lower`,
                                  `CI upper` = `CI T3.2 upper`),
                       data.frame(`Technique` = 'T3.3',
                                  `Scale` = factor(Scale, levels = Scale), 
                                  `Mean` = `T3.3`,
                                  `CI lower` = `CI T3.3 lower`,
                                  `CI upper` = `CI T3.3 upper`)
                      )
df_techniques$Technique <- factor(df_techniques$Technique, levels = c('T3.1', 'T3.2', 'T3.3'))


# Building Benchmark plot
p <- df_benchmark %>%
  ggplot(aes(x=Scale, y=Value, fill=Threshold)) +
  geom_bar(stat="identity", position = position_stack(vjust = 1)) + 
  scale_y_continuous(limits = c(-1.5, 3), expand = c(0, 0), n.breaks=8) +
  scale_fill_manual(values=c('Excellent' = "green4", 'Good' = "green3", 'Above Average' = "green2", 
                             'Below Average' = "orange", 'Bad' = "red3", 'Lower Border' = "red3"),
                    breaks = c('Excellent', 'Good', 'Above Average', 'Below Average', 'Bad')) +
  theme(axis.text.x = element_text(angle = 35, hjust = 1)) +
  xlab(NULL) +
  ylab("Score") +
  guides(fill = guide_legend(override.aes = list(shape = NA)))

# Adding mean value lines
pos <- position_dodge(0.9)
p <- p +   
  geom_line(data = df_techniques, 
            mapping = aes(x = Scale, y = Mean, fill = NULL, color = Technique, group = Technique), position=pos) +
  geom_point(data = df_techniques, 
             mapping = aes(x = Scale, y = Mean, fill = NULL, color = Technique, shape = Technique, group = Technique), size = 2, position=pos) +
  scale_color_manual(values=c("blue3", "azure4", "black")) +
  geom_errorbar(data = df_techniques, 
                mapping = aes(x = Scale, y = Mean, ymin=CI.lower, ymax=CI.upper, fill = NULL, color = Technique, group = Technique), width=.5, position=pos)

# Save plot
ggsave("benchmarkT3.pdf", plot = p, width = 150, height = 100, units = 'mm')
ggsave("benchmarkT3.png", plot = p, width = 150, height = 100, units = 'mm')

