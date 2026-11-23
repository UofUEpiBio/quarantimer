#' Plot an incubation distribution
#'
#' @inheritParams incubation_model
#' @param type Curve to display: density, cumulative probability, or survival
#'   probability (onset later than the specified day).
#' @param days Increasing numeric vector of at least two finite, nonnegative days.
#' @param ... Graphical arguments passed to [graphics::plot.default()].
#' @return Invisibly, a data frame with `day` and `value` used in the plot.
#' @seealso [plot_incubation_data()], [p_incubation()], [d_incubation()]
#' @examples
#' plot_incubation()
#' plot_incubation(type = "survival", model = "morgenstern_2026")
#' @export
plot_incubation <- function(model = "lessler_2009",
                            type = c("density", "cdf", "survival"),
                            days = seq(0, 30, length.out = 301), ...) {
  type <- match.arg(type)
  if (!is.numeric(days) || length(days) < 2L || any(!is.finite(days)) ||
      any(days < 0) || any(diff(days) <= 0))
    stop("days must be finite, nonnegative and strictly increasing.")
  pars <- incubation_model(model)
  value <- switch(type,
    density = d_incubation(days, model),
    cdf = p_incubation(days, model),
    survival = stats::plnorm(days, pars$meanlog, pars$sdlog, lower.tail = FALSE))
  args <- utils::modifyList(list(x = days, y = value, type = "l",
    xlab = "Days since infection",
    ylab = if (type == "density") "Density (per day)" else "Probability"), list(...))
  do.call(graphics::plot, args)
  invisible(data.frame(day = days, value = value))
}

#' Compare complete incubation observations with a model
#'
#' @param x Numeric vector of fully observed incubation times in days.
#'   Values must be finite and positive. Censored observations are not supported.
#' @inheritParams incubation_model
#' @param ... Graphical arguments passed to [graphics::hist()].
#'   The histogram is always displayed on a density scale.
#' @return Invisibly, the histogram object returned by [graphics::hist()].
#' @details The line is the selected fixed model, not a fit to the observations.
#' @seealso [plot_incubation()], [incubation_example]
#' @examples
#' plot_incubation_data(incubation_example$incubation_days)
#' plot_incubation_data(incubation_example$incubation_days,
#'                      model = "morgenstern_2026", breaks = 15)
#' @export
plot_incubation_data <- function(x, model = "lessler_2009", ...) {
  if (!is.numeric(x) || !length(x) || any(!is.finite(x)) || any(x <= 0))
    stop("x must contain finite, positive, fully observed times.")
  incubation_model(model)
  args <- utils::modifyList(list(x = x, main = "Observed times and model",
    xlab = "Incubation time (days)"), list(...))
  args$freq <- FALSE
  args$probability <- TRUE
  h <- do.call(graphics::hist, args)
  days <- seq(min(h$breaks), max(h$breaks), length.out = 501)
  graphics::lines(days, d_incubation(days, model), col = 2, lwd = 2)
  invisible(h)
}
