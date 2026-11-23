#' Random generation for the incubation period
#'
#' The distribution describes time from infection to symptom onset among
#' infected individuals who develop symptoms. It is not an infection probability
#' or a distribution of time to infectiousness.
#'
#' @param n Number of draws; a vector of length greater than one requests that many draws.
#' @inheritParams incubation_model
#' @return Numeric vector of simulated incubation times in days. Missing values propagate.
#' @details Uses the corresponding lognormal function in [stats::Lognormal].
#'   See [incubation_model()] for parameter provenance and assumptions.
#' @seealso [incubation_model()], [d_incubation()], [p_incubation()],
#'   [q_incubation()], [r_incubation()], [plot_incubation()]
#' @importFrom stats rlnorm
#' @examples
#' set.seed(42)
#' r_incubation(5)
#' r_incubation(5, model = "morgenstern_2026")
#' @export
r_incubation <- function(n, model = "lessler_2009") {
  inc <- incubation_model(model)
  rlnorm(n, meanlog = inc$meanlog, sdlog = inc$sdlog)
}
