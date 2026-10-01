#' Cumulative distribution function for an incubation period model
#'
#' @param q vector of quantiles
#' @param model A character string specifying the incubation period model.
#'   Must be one of \code{"lessler_2009"} or \code{"morgenstern_2026"}.
#'   Defaults to \code{"lessler_2009"}.
#'
#' @return A vector of probabilities corresponding to the quantile input: the probability that the incubation time is less q
#'
#' @examples
#' p_incubation(14)
#'
#' p_incubation(14, "morgenstern_2026")
#'
#' @export
p_incubation <- function(q, model = "lessler_2009") {
  inc <- incubation_model(model)
  plnorm(q, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
