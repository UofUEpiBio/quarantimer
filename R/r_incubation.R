r_incubation <- function(n, model = "lessler_2009") {
  inc <- incubation_model(model)
  rlnorm(n, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
