# quarantimer

Incubation-time distributions for exploring timing after an infectious disease
exposure. The current implementation supplies fixed lognormal models, simulation,
and plots; it does not estimate infection risk from exposure records or prescribe
quarantine durations.

## Install and use

```r
# install.packages("remotes")
remotes::install_github("UofUEpiBio/quarantimer")
library(quarantimer)

incubation_model()              # parameters on the natural-log scale
p_incubation(14)                # onset by day 14, conditional on infection
q_incubation(c(0.5, 0.95))       # median and 95th percentile in days
set.seed(42)
r_incubation(5)
```

These distributions condition on infection followed by symptoms. Their survival
probabilities are not probabilities of infection or infectiousness.

## Example data and plots

`incubation_example` contains 200 synthetic, fully observed incubation times
generated from the default model; it contains no patient data.

```r
summary(incubation_example)
mean(incubation_example$incubation_days <= 14)
plot_incubation_data(incubation_example$incubation_days)
plot_incubation(type = "survival")
plot_incubation(model = "morgenstern_2026", type = "cdf")
```

Both plotting helpers use base R and invisibly return their plotted data or
histogram object. The alternative model retains the original repository's
parameters; its bibliographic provenance remains unverified.

## Mathematical documentation and development

Read the [Quarto model vignette](vignettes/model.qmd) or the
[rendered HTML](inst/doc/model.html). It derives the implemented distribution,
symptom-based conditioning, and clearly identifies extensions beyond the API.

Rebuild documentation from the repository root:

```sh
Rscript -e 'roxygen2::roxygenise()'
R CMD INSTALL .
quarto render vignettes/model.qmd --to html
quarto render vignettes/model.qmd --to pdf
cp vignettes/model.html vignettes/model.pdf inst/doc/
R CMD build .
R CMD check quarantimer_0.0.0.9000.tar.gz --no-manual
```

Quarto, knitr, rmarkdown, and a TeX installation are needed to render both formats.
Rendered copies are shipped in `inst/doc`; source is maintained in
`vignettes/model.qmd` and excluded from R's automatic vignette build.
Regenerate data with `Rscript data-raw/incubation_example.R`.
Tests use tinytest.
