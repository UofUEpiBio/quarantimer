incubation_model <- function(model = c("lessler_2009", "morgenstern_2026")) {

  model <- match.arg(model)

  if (model == "lessler_2009") {
    return(list(
      distribution = "lnorm",
      meanlog = 2.526,
      sdlog = 0.207
    ))
  }

  if (model == "morgenstern_2026") {
    return(list(
      distribution = "lnorm",
      meanlog = 2.62,
      sdlog = 0.23
    ))
  }
}
