p_incubation <- function(q, model = "lessler_2009") {
  inc <- incubation_model(model)
  plnorm(q, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
