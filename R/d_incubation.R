#' Density for the incubation period
#'
#' The distribution describes time from infection to symptom onset among
#' infected individuals who develop symptoms. It is not an infection probability
#' or a distribution of time to infectiousness.
#'
#' @param t Numeric vector of times in days since infection.
#' @inheritParams incubation_model
#' @return Numeric vector of densities (per day). Missing values propagate.
#' @details Uses the corresponding lognormal function in [stats::Lognormal].
#'   See [incubation_model()] for parameter provenance and assumptions.
#' @seealso [incubation_model()], [d_incubation()], [p_incubation()],
#'   [q_incubation()], [r_incubation()], [plot_incubation()]
#' @importFrom stats dlnorm
#' @examples
#' d_incubation(c(10, 14))
#' d_incubation(14, model = "morgenstern_2026")
#' @export
d_incubation <- function(t, model = "lessler_2009") {
  inc <- incubation_model(model)
  dlnorm(t, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
