#' Quantile for the incubation period
#'
#' The distribution describes time from infection to symptom onset among
#' infected individuals who develop symptoms. It is not an infection probability
#' or a distribution of time to infectiousness.
#'
#' @param p Numeric vector of probabilities between zero and one.
#' @inheritParams incubation_model
#' @return Numeric vector of incubation times in days. Missing values propagate.
#' @details Uses the corresponding lognormal function in [stats::Lognormal].
#'   See [incubation_model()] for parameter provenance and assumptions.
#' @seealso [incubation_model()], [d_incubation()], [p_incubation()],
#'   [q_incubation()], [r_incubation()], [plot_incubation()]
#' @importFrom stats qlnorm
#' @examples
#' q_incubation(c(0.5, 0.95))
#' q_incubation(0.95, model = "morgenstern_2026")
#' @export
q_incubation <- function(p, model = "lessler_2009") {
  inc <- incubation_model(model)
  qlnorm(p, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
