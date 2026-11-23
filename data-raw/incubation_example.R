# Synthetic complete observations; no patient records or fitted parameters.
# Run from the package root after installing quarantimer.
RNGkind("Mersenne-Twister", "Inversion", "Rejection")
set.seed(20260323)
incubation_example <- data.frame(
  id = seq_len(200),
  incubation_days = quarantimer::r_incubation(200, "lessler_2009")
)
save(incubation_example, file = "data/incubation_example.rda", compress = "xz")
