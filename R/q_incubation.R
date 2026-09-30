q_incubation <- function(p, model = "lessler_2009") {
  inc <- incubation_model(model)
  qlnorm(p, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
