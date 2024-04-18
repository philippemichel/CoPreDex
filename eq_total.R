neq <- read_ods("data/EQ5D.ods", na = c("Nd", "NA", "")) |> 
    mutate_if(is.character, as.factor) |>
    janitor::clean_names()
eq <- right_join(neq, ttn, by = "subjid")
## Recodage de eq$eq5d1 en eq$d1
eq$d1 <- eq$eq5d1 %>%
  fct_recode(
    "2" = "J’ai des problèmes pour me déplacer à pied.",
    "3" = "Je n’ai aucun problème pour me déplacer à pied.",
    "1" = "Je suis obligé(e) de rester alité(e)."
  )
eq$d1 <- as.numeric(as.character(eq$d1))
## Recodage de eq$eq5d2 en eq$d2
eq$d2 <- eq$eq5d2 %>%
  fct_recode(
    "2" = "J’ai des problèmes pour me laver ou m’habiller tout(e) seul(e).",
    "3" = "Je n’ai aucun problème pour prendre soin de moi.",
    "1" = "Je suis incapable de me laver ou de m’habiller tout(e) seul(e)."
  ) %>%
  as.character() %>%
  as.numeric()
## Recodage de eq$eq5d3 en eq$d3
eq$d3 <- eq$eq5d3 %>%
  fct_recode(
    "2" = "J’ai des problèmes pour accomplir mes activités courantes.",
    "3" = "Je n’ai aucun problème pour accomplir mes activités courantes.",
    "1" = "Je suis incapable d’accomplir mes activités courantes."
  ) %>%
  as.character() %>%
  as.numeric()
## Recodage de eq$eq5d4 en eq$d4
eq$d4 <- eq$eq5d4 %>%
  fct_recode(
    "1" = "J’ai des douleurs ou une gêne extrême(s).",
    "2" = "J’ai des douleurs ou une gêne modérée(s).",
    "3" = "Je n’ai ni douleurs ni gêne."
  ) %>%
  as.character() %>%
  as.numeric()
## Recodage de eq$eq5d5 en eq$d5
eq$d5 <- eq$eq5d5 %>%
  fct_recode(
    "3" = "Je ne suis ni anxieux(se) ni déprimé(e).",
    "1" = "Je suis extrêmement anxieux(se) ou déprimé(e)",
    "2" = "Je suis modérément anxieux(se) ou déprimé(e)."
  ) %>%
  as.character() %>%
  as.numeric()

eq$eq5 <- eq$d1 + eq$d2 + eq$d3 + eq$d4 + eq$d5
