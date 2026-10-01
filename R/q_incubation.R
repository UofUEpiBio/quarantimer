#' Quantile function for an incubation period model
#'
#' @param p vector of probabilities
#' @param model A character string specifying the incubation period model.
#'   Must be one of \code{"lessler_2009"} or \code{"morgenstern_2026"}.
#'   Defaults to \code{"lessler_2009"}.
#'
#' @return A vector of quantiles corresponding to the probability input
#'
#' @importFrom stats qlnorm
#'
#' @examples
#' # median incubation period:
#' q_incubation(0.5)
#'
#' # 25th percentile incubation period under the Morgenstern 2026 model:
#' q_incubation(0.25, "morgenstern_2026")
#'
#' @export
q_incubation <- function(p, model = "lessler_2009") {
  inc <- incubation_model(model)
  qlnorm(p, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
