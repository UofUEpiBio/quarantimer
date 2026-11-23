#' Parameters of a lognormal incubation model
#'
#' @param model Character model identifier: `"lessler_2009"` (default)
#'   or `"morgenstern_2026"`.
#' @return List with `distribution` (always `"lnorm"`), `meanlog`, and
#'   `sdlog`. Parameters describe the natural logarithm of time in days,
#'   not the arithmetic mean and standard deviation.
#' @details The Lessler model uses meanlog = 2.526 and sdlog = 0.207,
#'   consistent with the published measles median of 12.5 days and dispersion
#'   factor 1.23. The alternative uses meanlog = 2.62 and sdlog = 0.23;
#'   its identifier and values are retained from the original implementation.
#'   A bibliographic source for that alternative has not been established.
#'   Both distributions condition on infection followed by symptom onset.
#' @references Lessler J et al. (2009). Incubation periods of acute respiratory
#'   viral infections: a systematic review. Lancet Infectious Diseases 9:291-300.
#'   \doi{10.1016/S1473-3099(09)70069-6}.
#' @seealso [d_incubation()], [p_incubation()], [q_incubation()],
#'   [r_incubation()], [plot_incubation()]
#' @examples
#' pars <- incubation_model()
#' exp(pars$meanlog) # median in days
#' exp(pars$meanlog + pars$sdlog^2 / 2) # mean in days
#' incubation_model("morgenstern_2026")
#' @export
incubation_model <- function(model = c("lessler_2009", "morgenstern_2026")) {

  model <- match.arg(model)

  if (model == "lessler_2009") {
    return(list(
      distribution = "lnorm",
      meanlog = 2.526,
      sdlog = 0.207
    ))
  }

  if (model == "morgenstern_2026") {
    return(list(
      distribution = "lnorm",
      meanlog = 2.62,
      sdlog = 0.23
    ))
  }
}
