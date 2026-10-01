#' Density function for an incubation period model
#'
#' @param t vector of quantiles
#' @param model A character string specifying the incubation period model.
#'   Must be one of \code{"lessler_2009"} or \code{"morgenstern_2026"}.
#'   Defaults to \code{"lessler_2009"}.
#'
#' @return A vector of densities corresponding to the probability input
#'
#' @importFrom stats dlnorm
#'
#' @examples
#' d_incubation(10)
#'
#' d_incubation(10, "morgenstern_2026")
#'
#' @export
d_incubation <- function(t, model = "lessler_2009") {
  inc <- incubation_model(model)
  dlnorm(t, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
