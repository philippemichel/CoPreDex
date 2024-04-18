aa <- tt |> 
    filter(dcdon == "Oui")


dd <- matrix(c(95,55,106,44), nrow = 2)


dependent = "dcdon"
explanatory = "ttnom1"
zzg <- tt |> 
    glmuni(dependent, explanatory) |> 
    fit2df(estimate_suffix=" (univarié)")

ll <- glm(tt$dcdon~tt$ttnom1, family = binomial)


zind <- unique (ind$id)


ind$id[1] == zind[1]
ei <- ifelse(tt$patid %in% zind, "Oui", "Non")
