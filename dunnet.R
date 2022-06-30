
cdunnet <- function(medic, sortie, ddelta) {
    zz <- table(medic, sortie)
    restt <- colSums(zz)
    tts <- rowSums(zz)
    oo <- restt[[1]]
    nr <- tts[[1]]
    nn <- tts[[2]]
    pin <- (oo - nr * ddelta) / (nr + nn)
    print(pin)
    pir <- (oo + nr * ddelta) / (nr + nn)
    en <- nn * pin
    er <- nr * pir
    chidn <- (zz[1, 1] - er) ^ 2 * (1 / en + 1 / er + 1 / (nn - en) + 1 / (nr - er))
    pp <- beaup(1 - pchisq(abs(chidn), 1))
    return(pp)
}
