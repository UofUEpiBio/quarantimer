#' Generarate random deviates for an incubation period model
#'
#' @param n number of random observations
#' @param model A character string specifying the incubation period model.
#'   Must be one of \code{"lessler_2009"} or \code{"morgenstern_2026"}.
#'   Defaults to \code{"lessler_2009"}.
#'
#' @return A vector of random incubation time
#'
#' @examples
#' r_incubation(10)
#'
#' r_incubation(10, "morgenstern_2026")
#'
#' @export
r_incubation <- function(n, model = "lessler_2009") {
  inc <- incubation_model(model)
  rlnorm(n, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
