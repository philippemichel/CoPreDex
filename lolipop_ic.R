zz <- table(tt$dcdon,tt$ttnom1)




library(binom)
dex <- binom.confint(40,44, method = "exact")*100
pre <- binom.confint(44,44, method = "exact")*100

nom <- c("Dexamethazone", "Prednisolone")
moy <- c(dex[[4]], pre[[4]]) *100
inf <- c(dex[[5]], pre[[5]])*100
sup <- c(dex[[6]], pre[[6]]) *100
aa <- tibble(nom, moy, inf, sup)

aa |> 
  ggplot() +
    aes(x = nom, y = moy) +
    geom_point(size = 4) +
    geom_segment(aes(x = nom, xend = nom, y = inf, yend = sup), size = 1) +
    scale_y_continuous(limits = c(50,100)) +
    coord_flip() +
    labs(
        title = "28 Day Survival (%)",
        y = "Survival (%)",
        x = "Treatment"
    ) +
    theme_light() +
    theme(
        plot.title = element_text(size = 16, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.title.x = element_text(size = 12),
        legend.title = element_blank(),
        axis.title.y = element_text(
            size = 12,
            hjust = 0.5,
            angle = 90
        ),
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        legend.position = "none"
    )
