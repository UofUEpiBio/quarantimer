d_incubation <- function(t, model = "lessler_2009") {
  inc <- incubation_model(model)
  dlnorm(t, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
