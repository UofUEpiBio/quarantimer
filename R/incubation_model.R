#' Specify an incubation period model
#'
#' @param model A character string specifying the incubation period model.
#'   Must be one of \code{"lessler_2009"} or \code{"morgenstern_2026"}.
#'   Defaults to \code{"lessler_2009"}.
#'
#' @return A named list containing the model name, probability distribution,
#'   and parameters used to define the incubation period distribution.
#'
#' @examples
#' incubation_model()
#'
#' incubation_model("morgenstern_2026")
#'
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
